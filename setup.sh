#! /bin/bash
# INSTALL MYSQL ON LINUX WITH REMOTE ACCESS AS A SERVICE

# SETUP MYSQL CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#Configuring MySQL for autmatic startup on reboot
#chkconfig mysqld on

echo "HERE 0"
cd $HOME

echo "HERE 2"
ls
cd var
echo "HERE 3"
ls
cd lib
ls
echo "HERE 4"
cd mysql
ls

echo "HERE 5"
chown mysql:mysql -R /var/*
chown mysql:mysql -R /var/lib/*
chown mysql:mysql -R /var/lib/mysql/*

chmod 755 -R /var/lib/mysql/*
chmod 755 -R /var/lib/*

service mysqld restart

mysql -u root

create database jason
GRANT ALL PRIVILEGES ON root.* TO root@localhost IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
exit

echo "You are now done and have installed mySQL Thank you for using this script by Jason Antao"
