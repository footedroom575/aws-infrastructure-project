# HashiCorp Terraform Cloud

There is a HashiCorp Terraform Cloud free tier which allows for 500 resources per month.

Each “Managed Resource” is charged on a per-hour basis, from the time a Managed Resource is provisioned until it is destroyed. Each partial hour is billed as a full hour. For Terraform Cloud Standard Edition, the first 500 managed resources are free every month.

For every other resource you have in the state above the 500 resource threshold, you will have to pay $0.00014/hour.

Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.

Teams in Terraform Cloud are used to organize users and manage their access to workspaces.

Users have to be added to the organization before they can be added to a team.

A team API token can be used to access the account without a username, password or two-factor authentication.

Steps:

    Login to Terraform Cloud:
    Log in to your Terraform Cloud account using your credentials.

    Access the Organization:
    Create/select the organization where you want to create the team.

[Create a Workspace](https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-workspace-create)

    Terraform Cloud manages infrastructure collections with workspaces instead of directories. A workspace contains everything Terraform needs to manage a given collection of infrastructure, and separate workspaces function like completely separate working directories.

    You must be a member of a team with manage all projects permissions, manage all workspaces permissions, or admin permissions for a project to create a workspace.

    There are three choices of workflow:
    Version Control - trigger runs based on changes to configuration in repositories
    CLI-Driven - trigger runs in a workspace using the Terraform CLI
    API-Driven - trigger runs using the terraform cloud api

    Add Users to the Organization:
    Organization Settings -> Users

    Add New Team Members to Team:
    Organization Settings -> Teams

    Set Permissions:
    Define the permissions for the team. This includes specifying what actions team members can perform within the workspaces associated with the team.

Additional Notes:

    Permissions and Policies:
    Terraform Cloud allows you to set fine-grained permissions and policies for teams. This ensures that team members have the appropriate level of access to workspaces and operations.

    Integration with VCS (Version Control System):
    If you are using a version control system like Git, Terraform Cloud allows you to integrate teams with your VCS.

Configuring Terraform Code for Terraform Cloud:

To specify that you are using HashiCorp Terraform Cloud for the state, configure the backend block in the Terraform configuration file (main.tf or similar). Here's an example:

```
terraform {
  backend "remote" {
    organization = "your-organization-name"
    workspaces = {
      name = "your-workspace-name"
    }
  }
}
```