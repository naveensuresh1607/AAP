# Start from your existing base Execution Environment image
FROM registry.redhat.io/ansible-automation-platform-24/ee-supported-rhel8:latest

# Install Azure Python SDKs and other Python dependencies
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

# Install Ansible Galaxy collections
COPY requirements.yml /tmp/requirements.yml
RUN ansible-galaxy collection install -r /tmp/requirements.yml

# Copy your playbook (optional, remove if not needed in image)
COPY azurevm.yml /projects/azurevm.yml

# Set working directory
WORKDIR /projects

# Default command for debugging (optional)
CMD ["/bin/bash"]
