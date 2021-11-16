#!/bin/bash

git clone https://github.com/miguel8998/test_app.git

cd test_app

mvn package

docker build -t test_app_img .

docker run -dit -p 8081:8080 test_app_imgs

cd ..