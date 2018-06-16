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
#yum install mysql-server -y

yum -q -y install mysql-server

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



cd $HOME
ls
cd var
ls
cd lib
ls
cd mysql
ls

chown mysql:mysql -R /var/*
chown mysql:mysql -R /var/lib/*
chown mysql:mysql -R /var/lib/mysql/*

chmod 755 -R /var/lib/mysql/*
chmod 755 -R /var/lib/*

service mysqld restart

mysql -u root


#./setup.sh


#########################################
## FOr testing purposes

mysqluser=jason
mysqlpass=jason
mysqlhost=localhost
dbname=jason
dbuser=jason
dbpass=jason
dbtable=${dbtable:-wp_}

#cd /tmp/scripts/db/mySQL

#service mysqld start
mysql -u root

create database jason
GRANT ALL PRIVILEGES ON jason.* TO root@localhost IDENTIFIED BY 'jason';
FLUSH PRIVILEGES;
exit

mysql -u $mysqluser -p$mysqlpass -e "$dbsetup"
mysql -u root jason
show databases;


