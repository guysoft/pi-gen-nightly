#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y quilt parted realpath qemu-user-static debootstrap zerofree pxz zip \
dosfstools bsdtar libcap2-bin grep rsync
sudo apt-get install -y git

sudo apt-get install -y  \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

# If you want docker, but at the moment docker build breaks
# curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# sudo add-apt-repository \
# 	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
# 	      $(lsb_release -cs) \
# 	         stable"
# sudo apt-get update
# sudo apt-get install -y docker-ce
