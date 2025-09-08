# Use the Home Assistant Community Add-on base image
# https://github.com/hassio-addons/addon-base
FROM ghcr.io/hassio-addons/base:17.2.5

# Download the newt binary
RUN curl -fsSL -o /usr/bin/newt https://github.com/fosrl/newt/releases/download/1.4.2/newt_linux_amd64; \
    chmod +x /usr/bin/newt

# Copy the script into the container
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Run the script as the main process
ENTRYPOINT [ "/run.sh" ]
