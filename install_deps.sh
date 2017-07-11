#!/usr/bin/env bash
sudo vagrant plugin install vagrant-disksize
sudo apt-get install vagrant nfs-kernel-server
sudo vagrant plugin install vagrant-nfs_guest
