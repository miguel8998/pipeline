#!/usr/bin/env bash

echo alias python=python3 >> /home/ec2-user/.bash_profile 

source /home/ec2-user/.bash_profile

sudo pip3 install pipenv