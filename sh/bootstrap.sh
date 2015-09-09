#!/usr/bin/env bash

echo "kos-development" > /etc/hostname
echo "127.0.0.1 kos-development" >> /etc/hosts
hostname kos-development

# Install core components
apt-get update
apt-get install -y make g++ git curl libcairo2-dev libav-tools nfs-common portmap

# Install MongoDB
# Update apt-get to get 10gen stable packages
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list
apt-get update
# Install specific stable version
apt-get install -y mongodb-10gen=2.4.4
apt-get install -y mongodb-clients
# Pin to the exact version above, so it's not auto upgraded by apt-get
echo "mongodb-10gen hold" | dpkg --set-selections

# GitHub repositories:
su vagrant -c 'git config --global color.ui true'

echo "Run 'vagrant ssh' then set your git config manually, e.g.:"
echo "ssh-keygen -t rsa"
echo "(Copy the contents of ~/.ssh/id_rsa.pub into your GitHub account: https://github.com/settings/ssh)"
echo "git config --global user.name '<your name>'"
echo "git config --global user.email <your email>"

