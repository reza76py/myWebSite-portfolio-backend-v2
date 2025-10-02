FROM python:3.12-slim

# Prevent Python from writing pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY . .

# Collect static files (ignore errors if not configured yet)
RUN python manage.py collectstatic --noinput || true

# Start with Gunicorn
CMD ["gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]
