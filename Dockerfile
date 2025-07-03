FROM python:3.10-slim

# Install TA-Lib dependencies
RUN apt-get update && apt-get install -y     build-essential     wget     curl     git     libffi-dev     libssl-dev     libta-lib0     ta-lib  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements and install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy rest of the app
COPY . .

# Run the app
CMD ["python", "main.py"]
