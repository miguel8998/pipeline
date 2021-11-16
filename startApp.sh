#!/bin/bash

cd /home/ec2-user

cd pipeline
git pull
chmod +x installPip.sh
./installPip.sh
cd ..


git clone https://github.com/miguel8998/test_app.git

cd test_app/02-cicd/01-containerising-the-application/

docker build -t my_image .

docker run -p 5000:5000 my_image

#pipenv run python -m unittest discover -s tests -v

#sudo mvn package

#sudo service docker start

#sudo docker build -t test_app_img .

#sudo docker run -dit -p 8081:8080 test_app_img

cd ..