# pi-gen-nightly
Scripts to make nightly builds of pi-gen repo

# Requirements
* Vagrant
* Linux/ubuntu machine

# Usage
```
git clone https://github.com/guysoft/pi-gen-nightly.git
cd pi-gen-nightly
sudo ./install_deps.sh
sudo vagrant up
./run_vagrant_build.sh
```
Then you can build nightly with :
```
./run_vagrant_build.sh
```
To make a jenkins user able to build using ``sudo ./run_vagrant_build.sh`` run:
```
./install_jenkins_sudo.sh
```
