#!/usr/bin/env bash

chmod +x  installjava.sh

chmod +x installmaven.sh

chmod +x installjenkins.sh

chmod +x installDocker.sh

chmod +x installPip.sh

./installjava.sh

./installmaven.sh

./installjenkins.sh

./installDocker.sh

./installPip.sh

sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform