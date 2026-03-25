

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from sqlalchemy import select, insert
from app.database import engine
from app.models import metadata, users
from fastapi.middleware.cors import CORSMiddleware


class UserCreate(BaseModel):
    name: str
    email: str


app = FastAPI(title="FastAPI Backend")


# CORS configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.post("/api/users")
def create_user(user: UserCreate):
    with engine.begin() as conn:
        stmt = insert(users).values(name=user.name, email=user.email)
        result = conn.execute(stmt)
        user_id = result.inserted_primary_key[0] if result.inserted_primary_key else None
        if user_id is None:
            raise HTTPException(status_code=500, detail="Failed to insert user")
        return {"id": user_id, "name": user.name, "email": user.email}



# Ensure tables are created at startup (important for in-memory DB)
@app.on_event("startup")
def on_startup():
    metadata.create_all(bind=engine)

@app.get("/api/health")
def health_check():
    return {"status": "ok"}

@app.get("/api/users")
def get_users():
    with engine.connect() as conn:
        stmt = select(users)
        result = conn.execute(stmt)
        return [dict(row._mapping) for row in result]