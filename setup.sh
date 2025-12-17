#!/bin/bash

echo "Starting Bus Booking Application setup..."

# Detect OS
if [ -f /etc/redhat-release ]; then
    OS="RHEL"
elif [ -f /etc/lsb-release ]; then
    OS="UBUNTU"
else
    echo "Unsupported OS"
    exit 1
fi

echo "Detected OS: $OS"

# Install Apache
if [ "$OS" == "RHEL" ]; then
    sudo yum install httpd -y
    SERVICE=httpd
elif [ "$OS" == "UBUNTU" ]; then
    sudo apt update -y
    sudo apt install apache2 -y
    SERVICE=apache2
fi

# Copy application file
sudo cp index.html /var/www/html/index.html

# Start & enable Apache
sudo systemctl restart $SERVICE
sudo systemctl enable $SERVICE

echo "---------------------------------------"
echo "Bus Booking Application Deployed"
echo "Access using: http://<SERVER_PUBLIC_IP>"
echo "---------------------------------------"

