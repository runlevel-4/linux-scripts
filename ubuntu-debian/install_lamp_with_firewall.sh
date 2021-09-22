#!/bin/sh

echo "I would not recommend immediately pointing this to the internet without securing it first."
echo "There is a basic firewall installed and configured, but no SSL certs or anything have been generated."
echo "UFW is a very effective and easy front end built on top of the ever so popular iptables firewall."
read Continue

echo
echo "This will install the necessary components to get a very basic Linux web server up and running."
sleep 3
echo
echo "Installing Apache, MySQL, and PHP..."
echo
sudo apt install apache2 mysql-common mariadb-server php7.4 php7.4-mysql -y
echo
echo "Installing the ufw (uncomplicated firewall) to secure the server a bit."
echo
sudo apt install ufw -y
echo
echo "Allowing http, https, & ssh protocols.  To disable any of them, just run sudo ufw remove [protocol]."
echo
sudo ufw allow http
sudo ufw allow https
sudo ufw allow ssh
