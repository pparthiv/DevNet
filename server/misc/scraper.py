from playwright.sync_api import sync_playwright
from bs4 import BeautifulSoup
import time
import json
from dotenv import load_dotenv
import os

load_dotenv()

def scrape_name(soup: BeautifulSoup)->str:
    name = soup.select("h1")
    return name[0].get_text()

def scrape_about(soup: BeautifulSoup)->str:
    info = list(soup.find_all("div", class_="pv-shared-text-with-see-more"))
    summary = info[0].get_text().replace("\n", " ").replace("                                 ", " ").lstrip().rstrip()
    return summary

def scrape_skills(soup: BeautifulSoup)->list:
    skills = soup.select("a[data-field='skill_page_skill_topic']>div>div>div>div>span[aria-hidden='true']")
    return [skill.get_text().replace("\n", " ").replace("                                                         ", " ").lstrip().rstrip() for skill in skills]

def scrape_certs(soup: BeautifulSoup)->dict:
    certifications = BeautifulSoup(str(certification_soup.select("ul[class='pvs-list']>li>div>div>div>div>a")), "html.parser")
    cert_name = certifications.select("div>div>div>div>span[aria-hidden='true']")
    cert_issuer = certifications.select("span[class='t-14 t-normal']>span[aria-hidden='true']")
    return {cert.get_text(): issuer.get_text() for (cert, issuer) in zip(cert_name, cert_issuer)}

NEW = False
with sync_playwright() as p:
    profile_soup = ""
    skill_soup = ""
    certification_soup = ""
    if NEW:
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        page.goto('https://www.linkedin.com/login')
        time.sleep(5)
        page.fill("input#username", os.environ["username"])
        page.fill("input#password", os.environ["password"])
        page.click("button[type=submit]")
        page.goto("https://www.linkedin.com/in/parthiv-purkayastha/")
        time.sleep(10)
        html = page.content()
        profile_soup = BeautifulSoup(html, 'html.parser')
        time.sleep(10)
        with open("temp.html", "w", encoding='utf-8') as temp:
            temp.write(str(profile_soup))
        page.goto("https://www.linkedin.com/in/parthiv-purkayastha/details/skills/")
        time.sleep(10)
        html = page.content()
        skill_soup = BeautifulSoup(html, 'html.parser')
        time.sleep(10)
        NEW = False
        with open("temp_skills.html", "w", encoding='utf-8') as temp:
            temp.write(str(skill_soup))
        page.goto("https://www.linkedin.com/in/parthiv-purkayastha/details/certifications/")
        time.sleep(10)
        html = page.content()
        certification_soup = BeautifulSoup(html, 'html.parser')
        time.sleep(10)
        NEW = False
        with open("temp_certifications.html", "w", encoding='utf-8') as temp:
            temp.write(str(certification_soup))
        NEW = False
        browser.close()
    else:
        with open("./temp.html", encoding="utf8") as f:
            profile_soup = BeautifulSoup(f, "html.parser")
        with open("./temp_skills.html", encoding="utf8") as f:
            skill_soup = BeautifulSoup(f, "html.parser")
        with open("./temp_certifications.html", encoding="utf8") as f:
            certification_soup = BeautifulSoup(f, "html.parser")
    data = {
        "Name": scrape_name(profile_soup),
        "Summary": scrape_about(profile_soup),
        "Skills": scrape_skills(skill_soup),
        "Certifications": scrape_certs(certification_soup)
    }
    with open("text.json", "w", encoding='utf-8') as info:
        json.dump(data, info, ensure_ascii=False, indent=4)

