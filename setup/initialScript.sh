#!/bin/bash

cd /home/ec2-user

sudo yum update -y
sudo yum install git -y 

git clone https://github.com/miguel8998/pipeline.git

cd pipeline/setup
./installAll.sh

cd ..
