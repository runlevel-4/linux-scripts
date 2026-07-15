#!/bin/bash

# download the dependencies
sudo apt-get update
sudo apt install -y wget apt-transport-https software-properties-common

# download the Microsoft keys
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb

# register the Microsoft repository GPG keys
sudo dpkg -i packages-microsoft-prod.deb

# update the list of products
sudo apt-get update

# install PowerShell
sudo apt-get install -y powershell

echo
echo "To start powershell, type: pwsh"
