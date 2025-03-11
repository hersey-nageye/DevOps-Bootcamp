# Network Assignment 1: Deploying NGINX on AWS with Cloudflare

## Introduction
The purpose of this assignment is to deploy an NGINX web server on an AWS EC2 instance and make it accessible via a custom domain registered on Cloudflare. To complete this assignment, the following steps will be performed:

* Register a custom domain on Cloudflare.
* Create a security group for the EC2 instance on AWS, allowing SSH and HTTP traffic.
* Launch an EC2 instance and manually install NGINX on it.
* Configure an A record on Cloudflare to point the custom domain to the EC2 instance's IP address.

---

## 1. Register a Custom Domain on Cloudflare
* Create an account on Cloudflare.
* Click **Domain Registration** on the left-hand side and register a domain.
* Enter a desired domain name into the search box (e.g., `hersey`) and click **Search**.
* Choose an available domain name from the list (e.g., `drhersey.org`) and click **Confirm**.
* Complete the domain purchase.
* Once purchased, go to **Manage Domains** on the left-hand side. You should see your domain name with a status of **Active**.

---

## 2. Create a Security Group for the EC2 Instance on AWS
* Log into AWS and navigate to **EC2**.
* In the EC2 dashboard, click **Security Groups** on the left-hand side.
* Click **Create Security Group**.
* Name the security group `ec2-sg`.
* Edit the **Inbound Rules** to allow:
  * **SSH (port 22)** from anywhere (`0.0.0.0/0` and `::/0`) to enable Instance Connect.
  * **HTTP (port 80)** from anywhere (`0.0.0.0/0` and `::/0`) to allow web traffic.
* Save the security group.

Since we will be using **Instance Connect** to access the instance and install NGINX, we do not need to create SSH keys.

---

## 3. Launch an EC2 Instance
* Click **Launch Instances**.
* Name the instance `my-ec2`.
* Keep the default settings.
* Under **Security Groups**, select the previously created `ec2-sg`.
* Proceed without generating a private key, as we will use **Instance Connect** to access the instance.

---

## 4. Manually Install NGINX on the EC2 Instance
Once the instance is running:
* Click **Connect** in the top-right corner of the EC2 instance page.
* Choose **Instance Connect** and click **Connect**.
* Once inside the terminal, run the following commands to install NGINX:

### Install Prerequisites
```
sudo yum install yum-utils
```

### Set Up the Yum Repository
Create the necessary directory:
```
mkdir -p /etc/yum.repos.d/
cd /etc/yum.repos.d/
```

Create and edit the repository file:
```
sudo vi nginx.repo
```

Copy and paste the following content:
```
[nginx-stable]
name=nginx stable repo
baseurl=http://nginx.org/packages/amzn/2023/$basearch/
gpgcheck=1
enabled=1
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
priority=9

[nginx-mainline]
name=nginx mainline repo
baseurl=http://nginx.org/packages/mainline/amzn/2023/$basearch/
gpgcheck=1
enabled=0
gpgkey=https://nginx.org/keys/nginx_signing.key
module_hotfixes=true
priority=9
```

Save and exit (`Esc` → `:wq!`).

### Install NGINX
```
sudo yum install nginx
```
Type `y` to confirm installation.

### Verify NGINX Installation
```
nginx -v
```
**Expected output:**
```
nginx version: nginx/1.26.3
```

### Start and Enable NGINX
```
sudo systemctl start nginx
sudo systemctl status nginx
```
**Expected output:**
```
nginx.service - nginx - high performance web server
Active: active (running)
```

---

## 5. Test NGINX Installation
* Copy the **public IP address** of the EC2 instance.
* Open a web browser and enter `http://<public-ip>`.
* If everything is configured correctly, the **NGINX welcome page** should appear.

---

## 6. Add an A Record on Cloudflare
* Log back into Cloudflare.
* Click **Manage Domains** on the left-hand side.
* Select your domain and click **Manage**.
* Go to **DNS Configurations** and add a new **A Record**:
  * **Name:** `nginx`
  * **IPv4 Address:** Paste the public IP address of the EC2 instance.
  * Click **Save**.

---

## 7. Final Test
* Enter your **custom domain name** (`http://yourdomain.com`) into a web browser.
* If everything is set up correctly, you should see the **NGINX welcome page**.

---

## Conclusion
This guide outlines how to deploy an NGINX web server on an AWS EC2 instance and link it to a custom domain via Cloudflare. If issues arise, check the **security group rules**, **Cloudflare DNS settings**, and **NGINX status** to troubleshoot effectively.