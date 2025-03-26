FROM ollama/ollama:0.6.0

# Install netcat to check for service availability
RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy entrypoint script
COPY ollama-setup.sh /usr/local/bin/

# Make entrypoint script executable
RUN chmod +x /usr/local/bin/ollama-setup.sh

# Set environment variables (can be overridden)
# MODELS should be a comma separated list of models to pull, e.g. "deepseek-r1:1.5b,bge-m3"
ARG MODELS=${MODELS}

# Set the entrypoint script
RUN bash -c "/usr/local/bin/ollama-setup.sh"

# Default command (will be passed to the entrypoint)
CMD ["serve"]
