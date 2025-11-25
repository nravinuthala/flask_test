# Use an official lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

ENV PIP_PROGRESS_BAR=off

# Copy dependency file first (to use Docker layer caching)
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application
COPY . .

# Expose Flask port
EXPOSE 5000

# Set environment variable for Flask
ENV FLASK_APP=app.py

# Run the application
CMD ["python", "app.py"]
