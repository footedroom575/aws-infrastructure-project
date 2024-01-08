# Can we add collaborators in CircleCI so everyone can see build logs?

Yes we can.

Free Tier:  Up to 6,000 build minutes per month and 5 active users per month.

Team members require an account and once signed up, can be invited to join an organization on CircleCI. Invitations can be sent from the CircleCI dashboard.

Organization settings can be accessed on the CircleCI dashboard and basic organization settings configured.

Personal access tokens can be created by each team member.

Access to projects is managed through organization memberships.

Projects in CircleCI are associated with orgainzations

## Build a new project on CircleCI

[title](https://www.example.com)

The [authorization method](https://circleci.com/docs/github-apps-integration/) used to set up your CircleCI account determines the definition of "project" in CircleCI, as well as the permissions management processes available to you.

You can see which account type you have by heading to the CircleCI web app, select Dashboard from the sidebar, and inspect the URL in your browser:

This style of URL indicates you authenticated with the GitHub App: https://app.circleci.com/pipelines/circleci/UTxCZDiJ9MLGLC8hR1ZDmg

The following limits are currently in place for GitHub App integrations:

    Each user can create up to three organizations.

    Each organization under a Free plan can have up to 10 projects.

Steps to integrate GitHub projects with CircleCI

Follow the steps on the Sign up and try CircleCI page to connect your GitHub account, which creates your CircleCI organization.

When you create a new organization and connect your GitHub account, you will be prompted to create a new project from a repository. You will be presented with the following options to set up a CircleCI configuration for your project:

    Faster: Commit a starter CI pipeline to a new branch.

    CircleCI automatically creates a new branch and commits a basic configuration file. You may make further changes to the file afterwards in your GitHub repository.

Choosing Faster automatically triggers a pipeline once you create the project. You should see the pipeline running shortly after you are taken to the CircleCI dashboard.

Follow these steps to set up a new project in CircleCI:

    In the CircleCI web app, click Projects in the sidebar.

    Find your project in the list and click the blue Set Up Project button next to it.
    Set up Project

## Project settings

Within CircleCI, a project can have one or more configurations, which are pipeline definitions. Configurations include, but are not limited to, a .circleci/config.yml file in your repository.

A project can have one or more triggers, which are events from a source of change. Triggers include, but are not limited to, a Version Control System (VCS). A trigger determines which configuration should be used to start a pipeline.

The following settings are found by clicking the Project Settings button within your project. At this time, both configurations and triggers are limited to GitLab and GitHub App integrations.
People

Project roles give control over which users have access to which projects within an organization. This enables teams to have limited access to only their projects, while managers and others can have broader organizational access. The access options are:

    Admin: Read and write access to the project and all settings and ability to manage other users' access.

    Contributor: Read and write access to the project and some settings.

    Viewer: Read only access to the project and some settings.

For a complete list of permissions, see the Roles and permissions overview page.

## Configuration

You can add or delete a configuration source for your project. If you followed the steps above to connect GitHub, a GitHub configuration source has been automatically added for you.

Once you define a configuration source, you can set up a trigger that points to that configuration.

## Organization settings

For GitHub App integrations, organizations and users are managed independently from your VCS. Organizations and users are considered CircleCI organizations and users, with their own roles and permissions that do not rely on those defined in your VCS.

To manage settings at the organization level, click Organization Settings in the CircleCI web app sidebar.
People

Add or remove users, and manage user roles for the organization as well as user invites. See the Roles and permissions overview page for full details.

Once logged into CircleCI click on the top left where your username and icon is shown, this will show you all of the available accounts you currently have access to view. At the bottom of the section press the button titled Create New Organisation.

Add people to your organization

    In the CircleCI web app, click on Organization Settings in the sidebar.
    Click on People.
    Click Invite.
    Enter the person's email address. You can add multiple people separated by a space too.
    Select a role from the dropdown menu to be applied to the people you are inviting.
    Click Send Invite(s)

## Roles and permissions

CircleCI users have different abilities depending on assigned roles in a particular organization. For a detailed list of CircleCI org and project roles and associated permissions, see the Roles and permissions page.

## Deprecated system environment variables

There are a number of built-in environment variables that are not available in GitHub-based projects for accounts authenticated through the GitHub App. VCS support for each environment variable is indicated in the Built-in environment variables table on the Project values and variables page. If your pipelines need these environment variables, we recommend you use suitable replacements from the available pipeline values.
