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
installDir="/tmp/scripts/db/mySQL"



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


#./setup.sh


#########################################
## FOr testing purposes

mysqluser=jason
mysqlpass=jason
mysqlhost=localhost
dbname=jason
dbuser=jason
dbpass=jason
db table=${dbtable:-wp_}cd /tmp/scripts/db/mySQL

service mysqld start
mysql -u root -p

create database jason
GRANT ALL PRIVILEGES ON jason.* TO jason@localhost IDENTIFIED BY 'jason';
FLUSH PRIVILEGES;
exit

mysql -u $mysqluser -p$mysqlpass -e "$dbsetup"
mysql -u root jason
show databases;


