# Use the latest Ubuntu base image
FROM ubuntu:latest

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip to the latest version
RUN python3 -m pip install --upgrade pip

# Install Python dependencies
RUN pip3 install --no-cache-dir pyYAML

# Copy the Python script to the container
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint script to the container
COPY entrypoint.sh /entrypoint.sh

# Make sure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Define the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
