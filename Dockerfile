# Use the Go base image
FROM golang:1.20

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV GO111MODULE=on

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Install waybackurls
RUN go install github.com/tomnomnom/waybackurls@latest

# Install hakrawler
RUN go install github.com/hakluke/hakrawler@latest

# Install unfurl
RUN go install github.com/tomnomnom/unfurl@latest

# Install Katana directly from the repository
RUN git clone https://github.com/projectdiscovery/katana.git /opt/katana && \
    cd /opt/katana && \
    git checkout v1.0.3 && \
    go build -o /usr/local/bin/katana ./cmd/katana

# Install anew
RUN go install github.com/tomnomnom/anew@latest

# Set the working directory for the user
WORKDIR /data

# Default command when starting the container
CMD ["/bin/bash"]
