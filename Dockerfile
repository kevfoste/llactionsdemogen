# Use the latest Ubuntu image
FROM ubuntu:latest

# Set non-interactive mode for apt-get to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install Python3, pip, and PyYAML
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip3 install --no-cache-dir pyyaml && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Default command (optional)
CMD ["python3"]


COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/enrtypoint.sh"]
