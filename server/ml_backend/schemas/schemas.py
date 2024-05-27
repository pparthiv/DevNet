from pydantic import BaseModel
from datetime import datetime
from typing import List

class linkedin_url(BaseModel):
    url: str