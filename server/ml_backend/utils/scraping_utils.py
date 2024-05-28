from playwright.sync_api import sync_playwright
from playwright.async_api import async_playwright, Playwright
from bs4 import BeautifulSoup
import time
import json
from dotenv import load_dotenv
import os
import asyncio
from langchain_core.prompts.prompt import PromptTemplate
from langchain_community.llms.huggingface_endpoint import HuggingFaceEndpoint
from langchain.chains.llm import LLMChain
import random
from typing import List

load_dotenv()


async def scrape_name(soup: BeautifulSoup)->str:
    name = soup.select_one("h1.top-card-layout__title.font-sans.text-lg.font-bold.leading-open.text-color-text.mb-0")
    if name is None:
        return ""
    return name.get_text().replace("\n", " ").lstrip().rstrip()


async def scrape_header(soup: BeautifulSoup)->str:
    header = soup.select_one("h2.top-card-layout__headline.break-words.font-sans.text-md.leading-open.text-color-text")
    return header.get_text().replace("\n", " ").lstrip().rstrip()


async def scrape_about(soup: BeautifulSoup)->str:
    about_section = soup.select_one("section[data-section='summary']>div.core-section-container__content.break-words>p")
    return about_section.get_text().replace("\n", " ").lstrip().rstrip()


async def scrape_exp(soup: BeautifulSoup)->List[str]:
    f = soup.find(lambda tag: tag.name=='section' and tag.has_attr('data-section') and tag['data-section']=="experience")
    if not f:
        return []
    exp_list = f.find("ul").find_all("li")
    experiences = []
    for i in range(len(exp_list)):
        title = exp_list[i].find("div").find("span", class_="experience-item__title")
        if not title:
            continue
        title = title.text.replace('\n', " ").lstrip().rstrip()
        subtitle = exp_list[i].find("div").find("span", class_="experience-item__subtitle")
        if not title:
            continue
        subtitle = subtitle.text.replace('\n', " ").lstrip().rstrip()
        experiences.append(f"{title} at {subtitle}")
    return experiences


async def scrape_certs(soup: BeautifulSoup)->List[str]:
    f = soup.find(lambda tag: tag.name=='section' and tag.has_attr('data-section') and tag['data-section']=="certifications")
    if not f:
        return []
    certs_list = f.find("ul").find_all("li")
    certs = []
    for i in range(len(certs_list)):
        cert_title = certs_list[i].find("div").find("h3").find("a").text.replace('\n', " ").lstrip().rstrip()
        certs.append(cert_title)
    return certs


async def scrape_projects(soup: BeautifulSoup)->List[str]:
    f = soup.find(lambda tag: tag.name=='section' and tag.has_attr('data-section') and tag['data-section']=="projects")
    if not f:
        return []
    proj_list = f.find("ul").find_all("li")
    projects = []
    for i in range(len(proj_list)):
        if proj_list[i].find("div") is None:
            continue
        desc = proj_list[i].find("div").find("div").find("div").find("p", class_="show-more-less-text__text--less").text.replace('\n', " ").lstrip().rstrip()
        if proj_list[i].find("div").find("div").find("div").find("p", class_="show-more-less-text__text--more"):
            desc = proj_list[i].find("div").find("div").find("div").find("p", class_="show-more-less-text__text--more").text.replace('Show less', " ").replace('\n', " ").lstrip().rstrip()
        projects.append(desc)
    return projects


async def generate_skills(input_data: dict):

    llm = HuggingFaceEndpoint(repo_id='mistralai/Mistral-7B-Instruct-v0.2', temperature=0.2, huggingfacehub_api_token=os.environ["TOKEN"])
    skills = []

    template = """Extract and list all the programming skills mentioned in the LinkedIn experiences and certificates. Provide only the skills as bullet points without any additional information in an array.
        Experiences: {exps},
        Certificates: {certs}
        Programming Skills:
    """

    prompt = PromptTemplate(
        template=template,
        input_variables=['exps', 'certs']
    )

    llm_chain = LLMChain(
        prompt=prompt,
        llm=llm
    )
    
    res = llm_chain.run({'exps': input_data["Experiences"], 'certs': input_data["Certificates"]})

    cleaned_str = res.strip(" []")
    skills = cleaned_str.split("', '")
    skills = [item.strip("'") for item in skills]

    return skills


async def scrapped_data(url: str):
    
    async with async_playwright() as p:

        browser = await p.chromium.launch(headless=True)
        context = await browser.new_context()
        await context.clear_cookies()
        page = await context.new_page()

        await page.goto(url)
        await asyncio.sleep(random.randrange(5, 10, 1))
        
        html = await page.content()
        soup = BeautifulSoup(html, 'html.parser')

        await context.close()

        name = await scrape_name(soup)

        if name == "":
            return False

        summary = await scrape_about(soup)
        header = await scrape_header(soup)
        exps = await scrape_exp(soup)
        certs = await scrape_certs(soup)
        # projs = await scrape_projects(soup)
        
        data = {
            "Name": name,
            "Header": header,
            "Summary": summary,
            "Experiences": exps,
            "Certificates": certs,
            # "Projects": projs
        }
        
        return data


async def generate_summary(gen_skills, input_data):
    template = """Given the following list of programming and technical skills, generate a recruiter's summary highlighting the important areas of expertise of the programmer. Emphasize the key strengths and areas where the programmer excels all as a paragraph of less than 80 words.

        Skills:
        {skills}

        LinkedIn Description:
        {description}

        LinkedIn Header:
        {header}

        Summary:"""
    prompt = PromptTemplate(
        template=template,
        input_variables=['skills', 'description', 'header']
    )
    llm = HuggingFaceEndpoint(repo_id='mistralai/Mistral-7B-Instruct-v0.2', temperature=0.1, huggingfacehub_api_token=os.environ["TOKEN"])
    skills = gen_skills

    llm_chain = LLMChain(
        prompt=prompt,
        llm=llm
    )

    res = llm_chain.run({"skills" : skills, "description" : input_data["Summary"], "header": input_data["Header"]})

    return res.replace('\n', " ").lstrip().rstrip()