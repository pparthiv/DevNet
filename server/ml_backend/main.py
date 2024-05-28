import core.config as core
from fastapi.middleware.cors import CORSMiddleware
from api import routes
from docs.tags import tags_metadata

from fastapi import FastAPI
import uvicorn
from dotenv import load_dotenv

load_dotenv()

app = FastAPI(
    title=core.settings.app_name,
    openapi_tags=tags_metadata
)

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=core.origins,  # type: ignore
    allow_credentials=core.allow_credentials,  # type: ignore
    allow_methods=["*"],  # type: ignore
    allow_headers=core.allow_headers,  # type: ignore
)

app.include_router(routes.router, prefix="/api/v1")