# AWS Assignment - Application Load Balancer

## Objective
The purpose of this assignment is to deploy an **Application Load Balancer (ALB)** with two **EC2 instances** behind it. The **Security Group (SG)** must be configured to allow only ALB access to EC2 instances while preventing direct access from the internet.

---

## Steps to Deploy

### **1. Launch Two EC2 Instances**
- Use the **Amazon Linux 2023 AMI**.
- In **security group settings**, enable:
  - **SSH (port 22)**: To access the EC2 instance manually.
  - **HTTP (port 80)**: To allow web traffic to NGINX.
- A key pair is optional since we will use the **AWS browser-based client** for SSH access.

### **2. Install NGINX on Both EC2 Instances**
- Once instances are running, connect via the **browser-based client**.
- Open a new tab and visit the [NGINX installation guide](https://nginx.org/en/docs/install.html) for Amazon Linux 2023.
- Run the following commands to install NGINX:

#### **Install Prerequisites**
```sh
sudo yum install yum-utils
```

#### **Set Up the Yum Repository**
To create the repository file, first, create the necessary directory:
```sh
mkdir -p /etc/yum.repos.d/
cd /etc/yum.repos.d/
```
Then, create the `nginx.repo` file:
```sh
sudo vi nginx.repo
```
Copy and paste the following content into the file:
```ini
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
Save and exit by pressing `Esc`, then typing `:wq!`.

#### **Install NGINX**
```sh
sudo yum install nginx
```
Type `y` to confirm installation.

#### **Verify NGINX Installation**
```sh
nginx -v
```
Expected output:
```
nginx version: nginx/1.26.3
```

#### **Start and Enable NGINX**
```sh
sudo systemctl start nginx
sudo systemctl status nginx
```
Expected output:
```
nginx.service - nginx - high performance web server
Active: active (running)
```

### **3. Test NGINX Installation**
- Copy the **public IP address** of the EC2 instance.
- Paste it into a web browser (`http://<public-ip>`).
- If everything is set up correctly, you should see the **NGINX welcome page**.

### **4. Customise the Web Page for Each Instance**
- Navigate to the NGINX configuration directory:
  ```sh
  cd /etc/nginx/conf.d
  sudo vi default.conf
  ```
- Locate the **root directory** path, typically:
  ```
  /usr/share/nginx/html;
  ```
- Navigate to the HTML directory:
  ```sh
  cd /usr/share/nginx/html
  ```
- Edit the `index.html` file:
  ```sh
  sudo vi index.html
  ```
- Replace its content with:
  ```html
  <h1>Hello! My name is [Public-IP-Address]</h1>
  ```
- Save the file and refresh your web browser. You should now see the modified message.

---

### **5. Create a Security Group for the Application Load Balancer (ALB)**
- In **AWS Console → EC2 → Security Groups**, create a new **ALB security group** (`alb-sg`).
- Allow **HTTP (port 80) traffic from anywhere (`0.0.0.0/0`)**.

### **6. Update EC2 Security Group to Restrict Direct Access**
- Modify the **EC2 security group** to allow only **inbound HTTP traffic from `alb-sg`**, instead of from the internet.

### **7. Create an Application Load Balancer (ALB)**
1. Navigate to **AWS Console → EC2 → Load Balancers**.
2. Click **Create Load Balancer** and select **Application Load Balancer**.
3. Configure the ALB:
   - Select at least **two availability zones**.
   - Select at least **two public subnets**.
   - Assign the **`alb-sg`** security group.
   - Enable a **listener on port 80 (HTTP)**.
4. Create a **Target Group**:
   - Select **HTTP** as the protocol and **port 80**.
   - Register the **two EC2 instances** in the target group.
5. Finalize the ALB creation.

### **8. Test Load Balancing**
- Once the ALB is provisioned, verify that the **health checks pass**.
- Copy the **ALB's DNS name** from the **AWS Console**.
- Paste it into a browser (`http://<alb-dns-name>`).
- Refresh the page multiple times; it should alternate between the two EC2 instances, displaying their respective messages.

---

## **Conclusion**
By following this process, you have successfully:

✅ Deployed two EC2 instances with **NGINX**.  
✅ Configured security groups to **restrict direct access**.  
✅ Set up an **Application Load Balancer** to distribute traffic.  
✅ Verified that the ALB alternates between instances, ensuring high availability.  


