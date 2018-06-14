#! /bin/bash
# INSTALL MYSQL ON LINUX WITH REMOTE ACCESS AS A SERVICE

# SETUP MYSQL CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#Configuring MySQL for autmatic startup on reboot
#chkconfig mysqld on
#service mysqld start

mysqluser=jason
mysqlpass=jason
mysqlhost=${mysqlhost:-localhost}
dbname=jason
dbuser=jason
dbpass=jason
dbtable=${dbtable:-wp_}

dbsetup="create database $dbname;GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@$mysqlhost IDENTIFIED BY '$dbpass';FLUSH PRIVILEGES;"
mysql -u $mysqluser -p$mysqlpass -e "$dbsetup"
mysql -u jason -p -jason
exit;
#mySQL user settings
#mysqladmin -u root password [password] -y
#mysqladmin -u root -p create [new_wp_db]

#Creating a new user, 
#mysql -u root mysql -p

#Creating database
#CREATE DATABASE wp_db

#NOT SURE IF BELOW IS BEST WAY TO RUN OR OTHER WAY IS OF BEST PRACTICE> PLEASE ADVISE
#CREATE USER 'owner'@'localhost' IDENTIFIED BY 'yourpassword';
#GRANT ALL PRIVILEGES ON ideside.* TO 'ideuser'@'localhost';
#FLUSH PRIVILEGES;

#GRANT ALL PRIVILEGES ON wp_db.* TO "owner"@"localhost" IDENTIFIED BY "password"
#FLUSH PRIVILEGES
#echo Privelges Flushed ~ mySQL Site 
cd $sqlCurrDir
#End of mySQLScript
