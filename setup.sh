#! /bin/bash
# INSTALL MYSQL ON LINUX WITH REMOTE ACCESS AS A SERVICE

# SETUP MYSQL CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#Configuring MySQL for autmatic startup on reboot
#chkconfig mysqld on



mysql

create database jason
GRANT ALL PRIVILEGES ON root.* TO root@localhost IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
exit

echo "You are now done and have installed mySQL Thank you for using this script by Jason Antao"
