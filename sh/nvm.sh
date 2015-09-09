#!/usr/bin/env bash

# Install Node Version Manager
curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash
echo "source /home/vagrant/.nvm/nvm.sh" >> /home/vagrant/.profile
source /home/vagrant/.profile
nvm install 0.12
nvm alias default 0.12

npm install -g pm2
npm install -g bower

touch /etc/vagrant-provisioned

echo "--------------------------------------------------"
echo "Your vagrant instance is running at: 192.168.33.10"