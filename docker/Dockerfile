# Use the base image with Ubuntu 22.04
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update \
    && apt-get install -y curl iproute2 sshfs unzip less groff \
    && rm -rf /var/lib/apt/lists/*

# Download and install kubectl from the official release URL
RUN curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl \
    && chmod +x kubectl \
    && mv kubectl /usr/local/bin/

# Download and install the AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip ./aws

# Add the installed tools to the PATH
ENV PATH="/usr/local/bin:${PATH}"

# Specify the default command or entrypoint
CMD ["/bin/bash"]


