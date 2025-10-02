# Use Python slim image
FROM python:3.12-slim

# Install system dependencies for mysqlclient
RUN apt-get update && apt-get install -y \
    gcc \
    pkg-config \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set workdir
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose Django port
EXPOSE 8000

# Run server
CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]
