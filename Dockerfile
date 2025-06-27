FROM python:3.10-slim

WORKDIR /app

# Install dependencies first for caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose port (Cloud Run uses PORT env var)
ENV PORT=8501
EXPOSE $PORT

# Run Streamlit
CMD ["streamlit", "run", "analysis_tool.py", "--server.port=$PORT", "--server.address=0.0.0.0"]
