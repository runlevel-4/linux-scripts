#!/bin/bash

echo "Install MS SQL repositories"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/20.04/mssql-server-2019.list)"
echo
echo "Update MS repository"
sudo apt-get update
echo
echo "Install MS SQL Server 2019"
sudo apt-get install -y mssql-server
echo
echo "After the package installation finishes, run mssql-conf setup and follow the prompts to set the SA password and choose your edition."
read -p "Press a key"
echo
echo "Running Setup"
sudo /opt/mssql/bin/mssql-conf setup
echo
echo "Verify that the service is running"
sudo systemctl status mssql-server --no-pager
echo
echo "If you plan to connect to the SQL instance on this server remotely from another machine, you might also need to open the SQL Server TCP port (default 1433) on your firewall."
echo "At this point, SQL Server 2019 is running on your Ubuntu machine and is ready to use!"
echo "To create a database, you need to connect with a tool that can run Transact-SQL statements on the SQL Server. The following steps install the SQL Server command-line tools: sqlcmd and bcp"
read -p "Press a key"
echo
echo "Installing command line tools"
sudo apt-get update 
sudo apt install curl
echo
echo "Import the public repository GPG keys"
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
echo
echo "Install mssql-tools"
sudo apt-get update 
sudo apt-get install mssql-tools unixodbc-dev
sudo apt-get update 
sudo apt-get install mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
sleep 5
source ~/.bashrc
