#!/bin/bash

cd /home/ec2-user

chmod +x pipeline/installPip.sh
./pipeline/installPip.sh

git clone https://github.com/miguel8998/test_app.git

#cd test_app/01-python/src_complete/

#pipenv sync

#pipenv run python -m unittest discover -s tests -v

#./run.sh

#sudo mvn package

#sudo service docker start

#sudo docker build -t test_app_img .

#sudo docker run -dit -p 8081:8080 test_app_img

cd ..