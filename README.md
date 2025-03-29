# DevOps E2E Project

Welcome to the DevOps E2E Project! This guide will walk you through the steps to set up and run the project.

## Prerequisites

Before you begin, ensure you have the following installed:

1. Docker
2. Kubectl
3. Terraform

## Steps

### 1. Create IAM User with Admin Privileges

First, create an IAM user with administrative privileges in your AWS account.

### 2. Create EC2 Instance and Login

Next, create an EC2 instance and log in to it.

### 3. Install Docker in Ubuntu EC2

Install Docker on your Ubuntu EC2 instance by following the [official Docker documentation](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).

### Resolve Docker Permission issues.

Adding ubuntu user to the docker group. 
``` sh
sudo usermod -aG docker ubuntu
```


### 4. Upgrade Disk Size

To upgrade the disk size and increase the filesystem size, follow these commands:

1. Check the size:
    ```sh
    df -h
    lsblk
    ```
2. Install cloud-guest-utils:
    ```sh
    sudo apt install cloud-guest-utils
    ```
3. Grow the partition size:
    ```sh
    sudo growpart /dev/xvda 1
    ```
4. Resize the filesystem:
    ```sh
    sudo resize2fs /dev/xvda1
    ```
5. Verify the size:
    ```sh
    df -h
    ```

### 5. Clone the Repository

Clone the demo repository:
```sh
git clone https://github.com/iam-veeramalla/ultimate-devops-project-demo.git
```

### 6. Run Docker Compose

Navigate to the cloned repository and run Docker Compose:
```sh
docker compose up -d
```
This command will pull the necessary images and run the containers. And, -d is to Start containers with automatic restart policy

```sh
docker compose down
```

Containerizing a Python Application: A brief summary of the image
Using image python:3.13-slim-bookworm, installing requirements, copying source code and using Entrypoint to run the application. 

Docker Build Image:
docker build -t iamvenkatgiri/recommendation:v1 .
Docker Run command:
docker run iamvenkatgiri/recommendation:v1

Docker Init - Available for only Docker Desktop


Docker Compose:
A configuration file that helps to run multiple microservices at a time. 
Core components:
services
networks
volumes   

Docker vs Kubernetes












## Additional Resources

For more information on Open Telemetry, visit the [Open Telemetry documentation](https://opentelemetry.io/docs/what-is-opentelemetry/).

Happy coding!


Containerizing a few services:
Go - Product Catalog Service

Python - Recommend
Java - Frontend Service

Instead of creating a project in AWS, I choose the other way around to challenge myself and went with google cloud. I created the VPC infra along with subnets in google cloud. I also imported a virtual machine to terraform state within the network I created.

Terraform import:

import {
  id = "projects/devopsdemo-453502/zones/us-south1-c/instances/opentelemetry-demo-20250313-014532"
  to = google_compute_instance.devops-demo-vm
}

Command: 
 terraform plan -generate-config-out=generated_resources.tf


Later, played with docker lifecycle management.

Docker-lifecycle:
Build lightweight Docker image.
Later build and push
docker build -t iamvenkatgiri/product-catalog:v1 .

