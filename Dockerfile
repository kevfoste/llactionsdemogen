# Use the latest Ubuntu image
FROM ubuntu:latest

# Update package lists and install Python3, pip, and PyYAML
RUN apt-get update && \
    apt-get install -y python3  \
	python3-pip \
	python3-yaml \
	git


# Set the working directory
WORKDIR /app


# Default command (optional)
CMD ["python3"]


COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
