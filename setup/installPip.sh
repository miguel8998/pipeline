#!/usr/bin/env bash

echo alias python=python3 >> /home/ec2-user/.bash_profile 

source /home/ec2-user/.bash_profile

pip3 install pipenv