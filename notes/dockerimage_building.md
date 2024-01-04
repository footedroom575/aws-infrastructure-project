# Docker Image Building

## Should we build docker images automatically? Why/Why not?
It can be answered in 2 ways:

### 1. Requirement Perspective
Taking in account the below factors, such as:

- Nature of project
- Updates frequency

It can be established that we dont have to use automatic image builds because the nature of project does not demand automatic docker image builds in order to work. Additionally, it does not look like either application (FE & BE) are going to recieve any major future updates once officially deployed.

### 2. Possibility Perspective
Yes, of course it is possible. We need to make a decision for Image Registry location like Dockerhub, Amazon ECR, etc

We'll have to create + authenticate a user from AWS with CircleCI and assign them correct read/write/modify policies. And add a build task to make a Docker image and push it om ECR.


### Final Decision
It can be decided after a group discussion around this subject.

## Which tool to use for building images automatically (if applies)?
Considering **Perspective#2**, you can use CircleCI for this. You can add a build job by modifying `.circleci/config.yaml` to make a Docker image using `circleci/aws-ecr `[ORB](https://circleci.com/developer/orbs/orb/circleci/aws-ecr).

Example script below builds and tests a Java application and pushes images to ECR:

```
# Use the latest 2.1 version of CircleCI pipeline process engine.
# See: https://circleci.com/docs/configuration-reference
version: 2.1
orbs:
  aws-ecr: circleci/aws-ecr@8.2.1

# Define a job to be invoked later in a workflow.
# See: https://circleci.com/docs/configuration-reference/#jobs
jobs:
  # Below is the definition of your job to build and test your app, you can rename and customize it as you want.
  build-and-test:
    # These next lines define a Docker executor: https://circleci.com/docs/executor-types/
    # You can specify an image from Dockerhub or use one of our Convenience Images from CircleCI's Developer Hub.
    # Be sure to update the Docker image tag below to openjdk version of your application.
    # A list of available CircleCI Docker Convenience Images are available here: https://circleci.com/developer/images/image/cimg/openjdk
    working_directory: ~/ce-cicd-sample-java-web
    docker:
      - image: cimg/openjdk:17.0.7
    # Add steps to the job
    # See: https://circleci.com/docs/configuration-reference/#steps
    steps:
      # Checkout the code as the first step.
      - checkout
      # Use mvn clean and package as the standard maven build phase
      - run:
          name: Build
          command: mvn -B -DskipTests clean package
          working_directory: ~/ce-cicd-sample-java-web/demo-app
      # Then run your tests!
      - run:
          name: Test
          command: mvn test
          working_directory: ~/ce-cicd-sample-java-web/demo-app
  build-image-and-push:
    working_directory: ~/ce-cicd-sample-java-web
    docker:
      - image: cimg/aws:2023.05
    steps:
      - setup_remote_docker # Ensures that we can issue docker build commands
      - aws-ecr/build-and-push-image:
          repo: ce-cicd-sample-java-app
          path: "demo-app" # This is the directory to look for the Dockerfile
          build-path: "demo-app" # This is directory for Docker to load the build path to source code
          tag: ${CIRCLE_BUILD_NUM} # This will be automatically replaced with the job number
          public-registry-alias: b0m5l3u7
          public-registry: true
          


# Invoke jobs via workflows
# See: https://circleci.com/docs/configuration-reference/#workflows
workflows:
  demo-app-pipeline: # This is the name of the workflow, feel free to change it to better match your workflow.
    # Inside the workflow, you define the jobs you want to run.
    jobs:
      - build-and-test
      - build-image-and-push:
          requires: 
            - build-and-test # Ensures that the build and test job finished before we try to push docker image

```