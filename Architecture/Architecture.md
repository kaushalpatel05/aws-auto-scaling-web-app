# AWS Auto Scaling Web App Architecture

```text
                           Internet
                               |
                               |
                        Application Load
                           Balancer (ALB)
                               |
                    -------------------------
                    |                       |
                    |                       |
            Availability Zone A     Availability Zone B
                    |                       |
              Public Subnet A        Public Subnet B
                    |                       |
          +----------------+      +----------------+
          |  EC2 Instance  |      |  EC2 Instance  |
          |   Apache Web   |      |   Apache Web   |
          +----------------+      +----------------+
                    \                 /
                     \               /
                      \             /
                 Auto Scaling Group
                          |
                          |
                     Target Group
                          |
                          |
                   Launch Template
                          |
                          |
                    Amazon Machine Image
```

## Components

- Custom VPC
- Two Public Subnets
- Internet Gateway
- Route Tables
- Security Groups
- Launch Template
- Amazon Linux 2023 EC2 Instances
- Apache Web Server
- Application Load Balancer (ALB)
- Target Group
- Auto Scaling Group
- Health Checks

## Workflow

1. User accesses the application through the Internet.
2. The Application Load Balancer receives incoming requests.
3. The ALB forwards requests to the Target Group.
4. The Target Group routes traffic to healthy EC2 instances.
5. EC2 instances are launched using the Launch Template.
6. Auto Scaling Group automatically launches or terminates EC2 instances based on CPU utilization.
7. Health checks remove unhealthy instances and replace them automatically.
8. Users continue accessing the application without downtime.

## Scaling Process

- High CPU Utilization → Launch New EC2 Instance
- Low CPU Utilization → Terminate Extra EC2 Instance
- Health Check Failure → Replace Unhealthy Instance

## Benefits

- High Availability
- Fault Tolerance
- Automatic Scaling
- Load Distribution
- Improved Performance
- Cost Optimization