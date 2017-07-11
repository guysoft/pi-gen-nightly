#!/usr/bin/env bash
sudo apt-get update
sudo apt-get install -y quilt parted realpath qemu-user-static debootstrap zerofree pxz zip \
dosfstools bsdtar libcap2-bin grep rsync
sudo apt-get install -y git
# git clone https://github.com/RPi-Distro/pi-gen.git

pushd /pi-gen-nightly
    echo "IMG_NAME='Raspbian'" > pi-gen/config
    touch pi-gen/stage3/SKIP pi-gen/stage4/SKIP pi-gen/stage5/SKIP
    rm pi-gen/stage4/EXPORT*
popd

sudo apt-get install \
     apt-transport-https \
     ca-certificates \
     curl \
     gnupg2 \
     software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
	   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
	      $(lsb_release -cs) \
	         stable"
sudo apt-get update
sudo apt-get install -y docker-ce
