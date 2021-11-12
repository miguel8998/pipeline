#!/usr/bin/env bash

sudo yum update

sudo yum install java-1.8.0-openjdk-devel -y

sudo amazon-linux-extras install java-openjdk11 -y

java -version
