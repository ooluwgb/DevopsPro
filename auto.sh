#!/bin/bash

# Author: Oluwanifemi Oluwagbemila
# Updated by: ChatGPT
# Script to update an Ubuntu machine, install Docker and Jenkins, and add Jenkins to the Docker group.

# Function to log messages
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1"
}

# Update Ubuntu machine
log "Updating Machine..."
sudo apt-get update -y && sudo apt-get upgrade -y
if [ $? -ne 0 ]; then
    log "Failed to update the machine."
    exit 1
fi
log "Machine updated successfully."

# Install Docker
log "Installing Docker..."
sudo apt-get install -y docker.io
if [ $? -ne 0 ]; then
    log "Failed to install Docker."
    exit 1
fi
log "Docker installed successfully."

# Start and enable Docker service
log "Starting and enabling Docker service..."
sudo systemctl start docker
sudo systemctl enable docker
if [ $? -ne 0 ]; then
    log "Failed to start or enable Docker service."
    exit 1
fi
log "Docker service started and enabled."

# Install Jenkins
log "Installing Jenkins dependencies..."
sudo apt-get install -y openjdk-11-jre openjdk-11-jdk
if [ $? -ne 0 ]; then
    log "Failed to install Jenkins dependencies."
    exit 1
fi
log "Jenkins dependencies installed successfully."

log "Adding Jenkins repository and installing Jenkins..."
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get update -y
sudo apt-get install -y jenkins
if [ $? -ne 0 ]; then
    log "Failed to install Jenkins."
    exit 1
fi
log "Jenkins installed successfully."

# Start Jenkins service
log "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins
if [ $? -ne 0 ]; then
    log "Failed to start or enable Jenkins service."
    exit 1
fi
log "Jenkins service started and enabled."

# Add Jenkins to Docker group
log "Adding Jenkins to Docker group..."
sudo usermod -aG docker jenkins
if [ $? -ne 0 ]; then
    log "Failed to add Jenkins to Docker group."
    exit 1
fi
log "Jenkins added to Docker group successfully."

log "All tasks completed successfully. Bye!"

# End of script
