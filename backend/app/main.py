from fastapi import FastAPI
from app.database import engine
from app.models import metadata

app = FastAPI(title="FastAPI Backend")

# Create tables on startup
metadata.create_all(bind=engine)

@app.get("/api/health")
def health_check():
    return {"status": "ok"}

@app.get("/api/users")
def get_users():
    with engine.connect() as conn:
        result = conn.execute("SELECT * FROM users")
        return [dict(row) for row in result]