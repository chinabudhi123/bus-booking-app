#!/bin/bash

set -e

echo "Starting Bus Booking Application setup..."

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS_ID=$ID
else
    echo "Cannot detect OS"
    exit 1
fi

echo "Detected OS: $OS_ID"

# Install Apache based on OS
case "$OS_ID" in
    amzn)
        echo "Installing Apache on Amazon Linux 2023..."
        sudo dnf install httpd -y
        SERVICE=httpd
        ;;
    rhel|centos)
        echo "Installing Apache on RHEL/CentOS..."
        sudo yum install httpd -y
        SERVICE=httpd
        ;;
    ubuntu)
        echo "Installing Apache on Ubuntu..."
        sudo apt update -y
        sudo apt install apache2 -y
        SERVICE=apache2
        ;;
    *)
        echo "Unsupported OS: $OS_ID"
        exit 1
        ;;
esac

# Copy application file
echo "Deploying application..."
sudo cp index.html /var/www/html/index.html
sudo chown root:root /var/www/html/index.html
sudo chmod 644 /var/www/html/index.html

# Start & enable Apache
echo "Starting Apache service..."
sudo systemctl restart $SERVICE
sudo systemctl enable $SERVICE

echo "---------------------------------------"
echo "Bus Booking Application Deployed Successfully"
echo "Access using: http://<SERVER_PUBLIC_IP>"
echo "---------------------------------------"

