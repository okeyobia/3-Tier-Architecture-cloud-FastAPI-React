from sqlalchemy import create_engine
import os
from app.config import get_db_credentials

DB_SECRET_ARN = os.getenv("DB_SECRET_ARN")
DB_USER, DB_PASSWORD, DB_NAME = get_db_credentials(DB_SECRET_ARN)
DB_HOST = os.getenv("DB_HOST")  # Set in ECS Task Definition

DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:5432/{DB_NAME}"
engine = create_engine(DATABASE_URL, echo=True)