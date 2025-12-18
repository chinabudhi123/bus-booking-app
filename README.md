# Bus Booking UI – Fully Automated Apache Setup

This project demonstrates how to deploy a **simple static Bus Booking UI** using **Apache Web Server**, fully automated with a shell script and CI/CD-ready using Jenkins.

There is **no backend logic or database**. Apache acts as the backend static server, and HTML/CSS act as the frontend.

---

## 🎯 Why This Project?

This project is created to:

- Understand **frontend + backend separation**
- Learn how **Apache serves static applications**
- Demonstrate **manual vs automated deployment**
- Show **CI/CD automation using Jenkins**
- Practice **real-world DevOps workflows**

It is ideal for:
- Cloud & DevOps learning
- Jenkins pipeline demos
- College training sessions
- Interview explanations

---

## 🧱 Architecture Overview

User Browser
↓
Apache Web Server (Backend)
↓
Static UI (HTML/CSS)

markdown
Copy code

- **Frontend:** HTML & CSS
- **Backend:** Apache (static server)
- **Automation:** Shell script (`setup.sh`)
- **CI/CD:** Jenkins (via GitHub Webhook)
- **Infrastructure:** AWS EC2

---

## 📁 Project Structure

bus-booking-app/
├── index.html # Frontend UI
├── setup.sh # Automated Apache setup & deployment
├── Jenkinsfile # CI/CD pipeline definition
└── README.md # Documentation

yaml
Copy code

---

## 🚀 One-Step Deployment (Manual Automation)

```bash
git clone https://github.com/chinabudhi123/bus-booking-app
cd bus-booking-app
chmod +x setup.sh
./setup.sh
🔍 What This Script Does
Installs Apache automatically

Copies index.html to Apache web root

Restarts Apache service

Makes the application live instantly

This removes all manual setup effort.

✅ Prerequisites
Before deploying, ensure you have:

🔹 AWS EC2 Instance
Amazon Linux 2023

Port 22 (SSH) open

Port 80 (HTTP) open

🔹 Software
Git installed

Jenkins (optional, for CI/CD)

☁️ How to Create an EC2 Instance (Quick Steps)
Login to AWS Console

Go to EC2 → Launch Instance

Choose Amazon Linux 2023

Instance type: t2.micro

Create or select a key pair

Security Group:

Allow SSH (22)

Allow HTTP (80)

Allow Jenkins (8080) if needed

Launch the instance

🔧 Install Git on EC2
bash
Copy code
sudo dnf install git -y
🔗 Git & GitHub Usage
GitHub stores the source code

Git is used to clone the repository onto EC2

Every code change can trigger Jenkins automatically

🤖 Jenkins (CI/CD Automation)
Jenkins is used to:

Automatically pull code from GitHub

Deploy application to EC2

Remove manual deployment steps

Jenkins Setup (High Level)
Install Jenkins on a server

Configure GitHub webhook

Add SSH credentials

Use the provided Jenkinsfile

📝 Notes
This is a demo application

No backend APIs

No database

Best suited for learning & demonstrations

Can be extended to Docker, ALB, or Kubernetes

🌐 Access the Application
cpp
Copy code
http://<EC2_PUBLIC_IP>
You will see:

WELCOME TO BUS BOOKING 🚍
