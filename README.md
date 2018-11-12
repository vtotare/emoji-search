# Project Title

Prudential Service Reliability Engineer - Case Study

## Summary ##

This document lays out the steps to implement modern automated infrastructure which will help to dev team to build,test & deploy node.js application so far in dev environment using CI/CD concepts.

### Pre-Requisites ###

[1. AWS Account](#1-aws-account)

[2. Github Account](#2-github-account)

[3. Docker Deamon](#3-docker-deamon)

[4. Jenkins setup](#4-jenkins-setup)


### CI/CD Process - How things work ?? ###

[1. Spin up EC2 instance with linux platform](#1-spin-up-ec2-instance-with-linux-platform)

[2. Clone sample repository on Github](#2-clone-sample-repository-on-github)

[3. Execute Jenkins in Docker](#3-execute-jenkins-in-docker)

[4. Setup Jenkins for CI/CD process](#4-setup-jenkins-for-ci/cd-process)

[5. Verify Deployment](#5-verify-deployment)


### Explanation of Choices ###

[1. AWS](#1-aws)

[2. Github](#2-github)

[3. Docker](#3-docker)

[4. Jenkins](#4-jenkins)

---

### Pre-Requisites

## 1. AWS Account
- Create `demo` vpc with appropriate components like security group, subnet, nat etc..
- Ubuntu 16.04 t2.micro ec2 instance running into `demo` vpc


## 2. Github Account
- Should have github account to get access of code base repository mentioned in the case study.


## 3. Docker Deamon
- Install docker on ec2 instance to support best control on testing environment, we will run application in docker containers.


## 4. Jenkins setup
- Run jenkins as a docker container from the jenkinsci/blueocean docker image for better management as well as cost effective.


### CI/CD Process - How things work ??

## 1. Spin up EC2 instance with linux platform   
- Need to ensure that we should have linux machine with configuration like 4GB RAM and at least 10GBdrive space for running container.
- Docker deamon should in running state on the instance.


## 2. Clone sample repository on Github
- Ensure you are signed in to your GitHub account. If you don’t yet have a GitHub account, sign up for a free one on the GitHub website.
- Fork the https://github.com/ahfarmer/emoji-search.git  on GitHub into your local GitHub account to kick off the project.
- Clone your forked https://github.com/ahfarmer/emoji-search.git repository (on GitHub) locally to your machine.
  - **Note**: Will not share the steps in this document that how to clone fork repository into local machine.
- Ensure that requsted repository is forked correctly on your local machine


## 3. Execute Jenkins in Docker
- Open terminal window and run jenkinsci image as a container in docker using following command..
  `docker run -u root --rm -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean`


## 4. Setup Jenkins for CI/CD process
- When you first access a new Jenkins instance using command mentioned in #3, you are asked to unlock it using an automatically-generated password.
- From your terminal/command prompt window again, copy the automatically-generated alphanumeric password (between the 2 sets of asterisks).
- On the Unlock Jenkins page, paste this password into the Administrator password field and click Continue.
- Install Customize plugin by cliking "Install suggested plugins".
- Create first administrator user as per instruction give on page.
- To verify jenkins configuration and setup, please access it in browser to http://<servername>:8080.
- Create pipline project in Jenkins with following instructions.
  - Go back to Jenkins, log in again if necessary and click create new jobs under Welcome to Jenkins!
  - In the Enter an item name field, specify the name for your new Pipeline project (e.g. Prudential_SRE_Case Study).
  - Scroll down and click Pipeline, then click OK at the end of the page.
  - ( Optional ) On the next page, specify a brief description for your Pipeline in the Description field.
  - Click the Pipeline tab at the top of the page to scroll down to the Pipeline section.
  - From the Definition field, choose the Pipeline script from SCM option. This option instructs Jenkins to obtain your Pipeline from Source Control Management (SCM), which will be your locally cloned Git repository.
  - From the SCM field, choose Git.
  - In the Repository URL field, specify the directory path of your locally cloned repository
- Create your initial Pipeline as a Jenkinsfile.
  - Your Pipeline will be created as a Jenkinsfile, which will be committed to your locally cloned Git repository (https://github.com/vtotare/emoji-search)
- Enable Poll Scm in Build section of Job to execute build automatically as soon as push the changes in repository.


## 5. Verify Deployment
- The Blue Ocean interface turns green if Jenkins built your Node.js application successfully.
  - **Note**: while building the app if we found wrong command then build will automatically aborted due `exit 1` command.
- Add a test stage to Pipeline but before test stage add environment directives in Jenkinsfile to run `npm test`
command in non-watch/interactive mode.
- Once everything looks fine the final stage to deploy the code in dev environment for continous testing.
- In the deploy script executed successfully then access your respective application (http://<servername/ip>:3000) in another tab of browser to see you changes and play with same process unless you will not get expected output in the application.
- Have also given button to abort or cancel the deployment process, please refer the same to complete respective job in Jenkins.


### Explanation of Choices

## 1. AWS
- Easy to setup infrastructure as code in AWS using any orchestration tool. I was planning to use terraform to support this architecture but couldn't due to time constraint.

## 2. Github
- Cost is not involved as far as you belongs to Public repository, also easy to integrate with any CI/CD tool to support continuous integration and deployment.

## 3. Docker
- Containerization is the best approach if you are working on dev/test environment to test you code base as it gives more flexibility in terms of code change and setup.

## 4. Jenkins
- Jenkins is extremely extensible tool, it can be modified and configured to handled practically any aspect of build orchestration and automation. In this setup, we'll have also choice to use `travis` for CI process but don't want to mess process by introducing more technology as long as one is working as swiss-knife (i.e Jenkins).


### Setup Information

Jenkins Server - http://ec2-34-227-242-12.compute-1.amazonaws.com:8080 - As of now it is accessible from everywhere which we can restrict using NACL or Security Group.
Application Server - http://ec2-34-227-242-12.compute-1.amazonaws.com:3000
Github 		- https://github.com/vtotare/emoji-search


## Built With
AWS EC2, Dockers, Jenkins, shell scripting


## Acknowledgments

* Google
* Inspiration
* AWS
