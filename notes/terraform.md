# Terraform

### Do we need to create VPC to provision postgres and EKS?
Yes we do need a VPC, subnets, and security group for both 
- Postgres
- EKS

For EKS provisioning using Terraform, refer to 
- https://l2c.northcoders.com/courses/ce-application-deployment/eks
- https://github.com/northcoders/ce-kubernetes-eks-terraform/tree/main

### Do we need to setup IAM Policy for db?
No we dont need IAM policy for DB creation. It has its own user and it doesn't require any additional authentication by default (unless you specify otherwise).

### Do we need to setup User for EKS?
No. You can provision it without setting up a different user account.

### Do we need to setup policy for EKS user (if applies)?
Does not apply.

### What else we need to get the db up and running?
You need to set some ingress/egress rules in networking (using terraform) for connecting to DB.

### What else do we need to get the EKS up and running?
Nothing specifically.
Just make sure to make it single node and put it inside public subnet(s). Also, set "Cluster endpoint access" to "Public and private" so it can communicate well.

### Do we need to setup User for CircleCI for ECR?
Yes we need to create a user and key pair (local code or command line) as well for linking it with CircleCI if we are planning to push Docker images to ECR.

Otherwise, if you don't want automated Dockerfile creation, you can skip it.