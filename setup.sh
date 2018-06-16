#! /bin/bash
# INSTALL MYSQL ON LINUX WITH REMOTE ACCESS AS A SERVICE

# SETUP MYSQL CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#Configuring MySQL for autmatic startup on reboot
#chkconfig mysqld on

cd $HOME

mysqluser=jason
mysqlpass=jason
mysqlhost=localhost
dbname=jason
dbuser=jason
dbpass=jason
dbtable=${dbtable:-wp_}

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

create database jason
GRANT ALL PRIVILEGES ON root.* TO root@localhost IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
exit
