#!/bin/bash
sqlCurrDir=$PWD

# Ensure script is running under root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

#Initial update of server
yum update -y

#Installation of Required Programs
#--Git
#--MySQL
yum install git -y
yum install mysql-server -y

#Set Cloning Properties
pkg=mySQL
gitRepo="linux-scripts-apps-mysql.git"
#installDir="/tmp/scripts/apps/JBOSS"
installDir=sqlCurrDir


if [ -f ~/.ssh/gitHub.key ]; then
   clone="git clone git@github.com:jasonantao/"
else
   clone="git clone https://github.com/jasonantao/"
fi

# Clone $pkg
echo Executing $clone$gitRepo $installDir
$clone$gitRepo $installDir

# Setup $pkg
cd $installDir
. ./setup.sh

cd $sqlCurrDir

####################################################################################################################
#!/bin/bash

#Checking for requirement that super-user is being run, otherwise do not proceed.
if [ "$EUID" -ne 0 ]
  then echo "Please run as root or under sudo"
  return -1
fi

#Initial update of server
yum update -y

#Installation of Required Programs
#--Git
#--MySQL
yum install git -y

#Placing into environment file.
#yum install mysql-server -y

#Configuring MySQL for autmatic startup on reboot
chkconfig mysqld on
service mysqld start

#mySQL user settings
#mysqladmin -u root password [password] -y
#mysqladmin -u root -p create [new_wp_db]

#Creating a new user, 
mysql -u root mysql -p

#Creating database
CREATE DATABASE wp_db

#NOT SURE IF BELOW IS BEST WAY TO RUN OR OTHER WAY IS OF BEST PRACTICE> PLEASE ADVISE
#CREATE USER 'owner'@'localhost' IDENTIFIED BY 'yourpassword';
#GRANT ALL PRIVILEGES ON ideside.* TO 'ideuser'@'localhost';
#FLUSH PRIVILEGES;

GRANT ALL PRIVILEGES ON wp_db.* TO "owner"@"localhost" IDENTIFIED BY "password"
FLUSH PRIVILEGES
echo Privelges Flushed ~ mySQL Site 
cd $sqlCurrDir
#End of mySQLScript
