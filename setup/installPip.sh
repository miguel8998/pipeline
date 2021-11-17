#!/usr/bin/env bash

sudo echo alias python=python3 >> /home/ec2-user/.bash_profile 

sudo source /home/ec2-user/.bash_profile

sudo pip3 install pipenv