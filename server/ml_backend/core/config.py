from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    app_name: str = "LINKEDIN SCRAPER"

settings = Settings()

# CORS config
origins = ["*"]
allow_credentials = (True,)
# allow_methods=,
allow_headers = ["Content-Type", "Authorization", "Set-Cookie"]