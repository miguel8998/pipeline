#!/usr/bin/env bash

sudo yum update -y

sudo amazon-linux-extras install epel -y

sudo yum install java-1.8.0-openjdk-devel -y

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo yum install jenkins -y

sudo service jenkins start

sudo chkconfig jenkins on

sudo cat /var/lib/jenkins/secrets/initialAdminPassword
