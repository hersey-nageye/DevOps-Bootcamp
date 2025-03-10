# AWS Custom VPC Setup Guide

## Objective
Create a custom **Virtual Private Cloud (VPC)** with public and private subnets, set up internet access through an **Internet Gateway (IGW)** and **NAT Gateway (NGW)**, and deploy **EC2 instances** with proper network segmentation.

## Requirements

### 1. VPC & Subnets
- Create a custom **VPC** with at least **one public** and **one private subnet**.

### 2. Internet & NAT Gateway
- Attach an **Internet Gateway (IGW)** for public internet access.
- Deploy a **NAT Gateway (NGW)** in the **public subnet** to enable outbound traffic for private instances.

### 3. EC2 Instances
- Deploy **one EC2 instance** in the **public subnet** (with internet access).
- Deploy **one EC2 instance** in the **private subnet** (no direct internet access).

### 4. Routing & Security
- Configure **route tables** to allow internet access for the public instance and restrict direct access to the private instance.

### 5. Bonus Challenge (Optional)
- Set up a **Bastion Host** (Jump Box) in the **public subnet** to SSH into the private EC2 instance.

---

## Steps to Create AWS Infrastructure

### 1. Create VPC
1. Log onto the **AWS Management Console** and navigate to **VPC**.
2. Click **Create VPC** > **VPC only**.
3. Set **Name Tag** to `assignment-vpc`.
4. Enter **IPv4 CIDR Block**: `10.0.0.0/16` (which allows roughly 65,000 IP addresses).
5. Leave all other settings as default and **Create VPC**.

### 2. Create Subnets
1. In the VPC dashboard, click **Subnets** > **Create Subnets**.
2. Create two subnets:
   - **Public Subnet**: CIDR Block `10.0.1.0/24`
   - **Private Subnet**: CIDR Block `10.0.2.0/24`
3. Select the **public subnet**, click **Edit Subnet Settings**, and enable **Auto-Assign Public IP**.

### 3. Create Internet Gateway (IGW)
**Purpose**: Provides direct internet access for public subnet instances.
1. Navigate to **Internet Gateways**.
2. Click **Create Internet Gateway**, name it `assignment-ig`, and click **Create**.
3. Attach the IGW to the custom VPC.

### 4. Create Route Tables
**Purpose**: Define how traffic is routed within the VPC.
1. Navigate to **Route Tables** > **Create Route Table**.
2. Name it `public-route-table` and associate it with the custom VPC.
3. Click on **Subnet Associations** and associate it with the **public subnet**.
4. Edit **Routes**, add a new route:
   - **Destination**: `0.0.0.0/0` (default internet route)
   - **Target**: Select the previously created **Internet Gateway** (`assignment-ig`)
5. Follow the same steps to create a **private-route-table**, but **do not** associate it with an IGW.

### 5. Create NAT Gateway (NGW)
**Purpose**: Allows private subnet resources to access the internet while remaining inaccessible from outside.
1. Navigate to **NAT Gateways** > **Create NAT Gateway**.
2. Name it `assignment-nat-gateway`.
3. Select the **public subnet**.
4. Allocate an **Elastic IP** to the NAT Gateway.
5. Click **Create NAT Gateway**.
6. Edit the **private-route-table**, add a route:
   - **Destination**: `0.0.0.0/0`
   - **Target**: Select the NAT Gateway.

### 6. Create Security Groups

#### a. Public Instance Security Group (Bastion Host)
1. Navigate to **EC2** > **Security Groups** > **Create Security Group**.
2. Name it `bastion-server-sg` and associate it with the custom VPC.
3. Configure **Inbound Rules**:
   - **Allow HTTP (80) & SSH (22) from anywhere (0.0.0.0/0)**.

#### b. Private Instance Security Group
1. Create another security group and name it `private-instance-sg`.
2. Configure **Inbound Rules**:
   - **Allow SSH & HTTP traffic only from the bastion-server-sg**.

### 7. Create EC2 Instances

#### a. Public Instance (Bastion Server)
1. Navigate to **EC2** > **Launch Instance**.
2. Name the instance `bastion-server`.
3. Select the **public subnet**.
4. Create a **new key pair** (`bastion-server-key`) for SSH access.
5. Attach **bastion-server-sg** as its security group.
6. Launch the instance.

#### b. Private Instance
1. Follow the same steps as above, but name it `private-ec2-instance`.
2. Select the **private subnet**.
3. Attach **private-instance-sg** as its security group.
4. Launch the instance.

### 8. SSH Access Configuration

#### a. Connect to Bastion Server
Use SSH from your **local machine** to connect:
```
ssh -i /path/to/bastion-server-key.pem ec2-user@<BASTION_PUBLIC_IP>
```

#### b. Copy Private Key to Bastion Server
To access the **private instance** from the bastion server, copy the private key to it:
```
scp -i /path/to/bastion-server-key.pem /path/to/private-instance-key.pem ec2-user@<BASTION_PUBLIC_IP>:/home/ec2-user/
```

#### c. SSH into Private Instance
1. Connect to the bastion server as before.
2. From within the bastion, SSH into the private instance:
```
ssh -i /path/to/private-instance-key.pem ec2-user@<PRIVATE-EC2-INSTANCE-IP>
```

### 🎉 **You are now connected to the private instance!**

---

## Summary
- **Created a VPC** with public & private subnets.
- **Set up IGW & NAT Gateway** for internet access.
- **Configured Route Tables & Security Groups**.
- **Deployed EC2 Instances** & set up **Bastion Host**.
- **Connected to the private instance through the bastion server**.

This guide provides a strong foundation for working with AWS networking and VPCs. 🚀 If you have any improvements, feel free to contribute! 😊