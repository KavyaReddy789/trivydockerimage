# Use an official Alpine-based image to keep the image lightweight
FROM alpine:latest

# Set the working directory in the container
WORKDIR /app

# Install dependencies: curl, bash, and packages for installing Trivy
RUN apk add --no-cache \
    curl \
    bash \
    git \
    && curl -sfL https://github.com/aquasecurity/trivy/releases/download/v0.33.0/trivy_0.33.0_Linux-64bit.tar.gz -o trivy.tar.gz \
    && tar zxvf trivy.tar.gz trivy \
    && mv trivy /usr/local/bin/ \
    && rm trivy.tar.gz

# Verify Trivy installation
RUN trivy --version

# Set the default command to run Trivy
ENTRYPOINT ["trivy"]
