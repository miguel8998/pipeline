#!/bin/bash

cd /home/ec2-user

sudo yum update -y
sudo yum install git -y

git clone https://github.com/miguel8998/automatePipeline.git

cd automatePipeline
./installAll.sh

cd ..

git clone https://github.com/miguel8998/test_app.git

cd test_app

# TODO remove logging

touch logs.txt

mvn package >> logs.txt

docker build -t test_app_img .  >> logs.txt

docker run -dit -p 8081:8080 test_app_img  >> logs.txt