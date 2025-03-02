# Deploying NGINX on AWS EC2 and Configuring Cloudflare DNS

## Overview

This document outlines the steps taken to deploy an NGINX web server on an AWS EC2 instance and configure Cloudflare DNS to point a custom domain to the instance.

## Step 1: Launch an EC2 Instance

1. Log in to the AWS EC2 Console.
2. Click **Launch Instance**.
3. Choose **Amazon Linux 2** (or Ubuntu).
4. Select **t2.micro** (free tier eligible).
5. Configure Security Group:
   - Allow **HTTP** (port 80, TCP, 0.0.0.0/0).
   - Allow **SSH** (port 22, TCP, your IP only).
6. Click **Launch**, select a key pair, and confirm.

## Step 2: Connect to the EC2 Instance & Install NGINX

1. Find the **Public IPv4 Address** of the instance in the AWS console.
2. SSH into the instance:

    ```bash
    ssh -i your-key.pem ec2-user@your-ec2-public-ip
    ```

3. Install & start NGINX:

    ```bash
    sudo yum update -y  # Amazon Linux
    sudo yum install nginx -y
    sudo systemctl start nginx
    sudo systemctl enable nginx
    ```

   *(For Ubuntu, use `apt update && apt install nginx` instead.)*

4. Verify NGINX is running by visiting:

    ```
    http://your-ec2-public-ip
    ```

   You should see the NGINX Welcome Page.

## Step 3: Configure Cloudflare DNS

1. Log in to **Cloudflare** and select your domain (`drhersey.org`).
2. Go to **DNS Settings** and click **Add Record**.
3. Enter the following details:
   - **Type**: A
   - **Name**: nginx (this creates `nginx.drhersey.org`)
   - **IPv4 Address**: `<your-ec2-public-ip>`
   - **TTL**: Auto
   - **Proxy Status**: DNS only
4. Click **Save** and wait a few minutes for DNS propagation.

## Step 4: Test the Custom Domain

1. Open a browser and go to:

    ```
    http://nginx.drhersey.org
    ```

   If everything is set up correctly, you should see the NGINX welcome page.
