# Use official Python base image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy files to container
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apt update && apt install -y libgl1

RUN python -m spacy download en_core_web_sm

RUN apt-get update && apt-get install -y libglib2.0-0


COPY . .

# Expose port
EXPOSE 8501

# Run Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
