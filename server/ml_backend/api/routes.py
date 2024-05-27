from fastapi import APIRouter, HTTPException
from fastapi.responses import JSONResponse
from schemas.schemas import linkedin_url
import traceback
from dotenv import load_dotenv
from utils.scraping_utils import generate_skills, scrapped_data, generate_summary
import asyncio
import random

load_dotenv()

router = APIRouter()

@router.get("/info", tags=["scrape"])
async def get_information(url: str):
    try:
        count = 0
        scrapped_info = False

        while scrapped_info == False and count < 5:
            scrapped_info = await scrapped_data(url)
            count += 1
            await asyncio.sleep(random.randrange(5, 10, 1))
        
        if not scrapped_info:
            raise Exception("User not found")

        return JSONResponse(content={"detail": "New summary generated successfully", "info": scrapped_info}, status_code=200)

    except Exception as e:
        traceback.print_exc()
        error_message = {"detail": f"An error occurred: {str(e)}"}
        return JSONResponse(content=error_message, status_code=500)
    

@router.post("/skills", tags=["skills"])
async def gen_skills(input_data: linkedin_url):
    try:
        count = 0
        scrapped_info = False

        while scrapped_info == False and count < 5:
            scrapped_info = await scrapped_data(input_data.url)
            count += 1
            await asyncio.sleep(random.randrange(5, 10, 1))
        
        if not scrapped_info:
            raise Exception("User not found")

        generated_skills = await generate_skills(scrapped_info)


        return JSONResponse(content={"detail": "New skills generated successfully", "skills": generated_skills}, status_code=200)

    except Exception as e:
        traceback.print_exc()
        error_message = {"detail": f"An error occurred: {str(e)}"}
        return JSONResponse(content=error_message, status_code=500)
    

@router.post("/generate", tags=["generate"])
async def create_summary(input_data: linkedin_url):
    try:
        count = 0
        scrapped_info = False

        while scrapped_info == False and count < 5:
            scrapped_info = await scrapped_data(input_data.url)
            count += 1
            await asyncio.sleep(random.randrange(5, 10, 1))
        
        if not scrapped_info:
            raise Exception("User not found")

        generated_skills = await generate_skills(scrapped_info)
        generated_summary = await generate_summary(generated_skills, scrapped_info)


        return JSONResponse(content={"detail": "New summary generated successfully", "info": scrapped_info, "skills": generated_skills, "gen_summary": generated_summary}, status_code=200)

    except Exception as e:
        traceback.print_exc()
        error_message = {"detail": f"An error occurred: {str(e)}"}
        return JSONResponse(content=error_message, status_code=500)