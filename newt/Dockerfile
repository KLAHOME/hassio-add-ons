# Use the Home Assistant Community App base image
# https://github.com/hassio-addons/app-base
FROM ghcr.io/hassio-addons/base:20.0.1

# Download the newt binary
RUN curl -fsSL -o /usr/bin/newt https://github.com/fosrl/newt/releases/download/1.15.0/newt_linux_amd64; \
    chmod +x /usr/bin/newt

# Copy the script into the container
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Run the script as the main process
ENTRYPOINT [ "/run.sh" ]
