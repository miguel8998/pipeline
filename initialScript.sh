#!/bin/bash

cd /home/ec2-user

sudo yum update -y
sudo yum install git -y 

git clone https://github.com/miguel8998/pipeline.git

git clone https://github.com/miguel8998/test_app.git

cd pipeline
./installAll.sh 

cd ../test_app

mvn package

docker build -t test_app_img .

docker run -dit -p 8081:8080 test_app_img