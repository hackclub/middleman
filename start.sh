# Build the Docker image
docker build -t airtable-proxy .

# Run the container, mapping port 80 of the container to port 8080 of the host
docker run -p 8080:80 airtable-proxy | logstalgia - --sync
