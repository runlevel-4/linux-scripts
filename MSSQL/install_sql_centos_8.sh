#!/bin/bash
echo

echo "Updating packages"
echo
sudo yum update
sudo yum upgrade -y
echo
echo "Building the foundation"
echo
echo "Checking for Python and setting it to the default interpreter"
echo
sudo yum install -y python2
sudo yum install compat-openssl10
sudo alternatives --config python
echo
echo "Coupling with Microsoft RHEL/CentOS reposiory"
echo
sudo curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/8/mssql-server-2019.repo
echo
echo "Installing Microsoft SQL Server"
echo
sudo yum install -y mssql-server
echo
echo "Running SQL Setup"
echo
sudo /opt/mssql/bin/mssql-conf setup
echo
echo "Verify SQL service is running"
echo
systemctl status mssql-server
echo
echo "Update firewall"
echo
sudo firewall-cmd --zone=public --add-port=1433/tcp --permanent
sudo firewall-cmd --reload
echo
echo "Coupling with Microsoft RHEL/CentoOS repsoitory to get sqlcmd command line tools"
echo
sudo curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/8/prod.repo
sudo yum remove unixODBC-utf16 unixODBC-utf16-devel
sudo yum install -y mssql-tools unixODBC-devel
echo
echo "Creating shortcut to sqlcmd"
echo
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bash_profile
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
echo
echo "All set.  Type the 'sqlcmd -S localhost -U sa' command and punch in the sa password that you setup during config"
echo
