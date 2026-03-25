# Dockerfile for FastAPI backend
FROM python:3.12-slim

# Set work directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y build-essential libpq-dev && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY pyproject.toml .
COPY uv.lock .
COPY app ./app

# Install dependencies
RUN pip install --upgrade pip && \
    pip install uv && \
    uv pip install --system --no-deps .

# Expose port
EXPOSE 8000

# Set environment variables
ENV PYTHONUNBUFFERED=1
ENV USE_INMEMORY_DB=false

# Run the app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
