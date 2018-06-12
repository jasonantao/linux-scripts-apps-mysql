#! /bin/bash
# INSTALL MYSQL ON LINUX WITH REMOTE ACCESS AS A SERVICE

# SETUP MYSQL CONFIGURATION ENVIRONMENT AND PARAMETERS
. ./env/setEnv.sh

#Configuring MySQL for autmatic startup on reboot
chkconfig mysqld on
service mysqld start

mysqluser=admin
mysqlpass=admin
mysqlhost=${mysqlhost:-localhost}
echo "============================================"
echo "Setting up the database."
echo "============================================"
#login to MySQL, add database, add user and grant permissions
dbsetup="create database $dbname;GRANT ALL PRIVILEGES ON $dbname.* TO $dbuser@$mysqlhost IDENTIFIED BY '$dbpass';FLUSH PRIVILEGES;"
mysql -u $mysqluser -p$mysqlpass -e "$dbsetup"
exit
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
echo Privelges Flushed ~ mySQL Site 
cd $sqlCurrDir
#End of mySQLScript

##############################################################################################################
#CHECK IF WILDFLY INSTALLED AND RETURN IF INSTALLED
#. ./utils/exitIfInstalled.sh $wfHome

# INSTALL REQUIRED DEVELOPMENT LIBRARIES
#./install//installJava8.sh

# SET UP WILDFLY ADMIN USER
#./install/addPkgUser.sh $wfOwner $wfGroup $wfHome $pkg

# DOWNLOAD AND INSTALL WILDFLY 10
#./install/installjBoss10.sh $wfOwner $wfGroup $wfHome $wfLog

# SET UP WILDFLY REMOTING CONFIGURATION 
#./install/configjBossRemoting.sh $wfHome $wfAdmin

# CONFIGURE WILDFLY AS A SERVICE AND START WILDFLY SERVICE
#./install/addjBossAsService.sh $wfHome 

# START JBOSS WILDFLY
#service wildfly start
