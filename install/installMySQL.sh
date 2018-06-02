# WILDFLY INITIAL INSTALLATION SETUP
mySQLOwner=$1
mySQLGroup=$2
mySQLHome=$3
mySQLLog=$4
mySQLPkg=wildfly-10.0.0.Final.tar.gz

echo Executing $0 $1 $2 $3 $4

# INSTALL MYSQL-SERVER
yum install mysql-server -y

mkdir -p $mySQLLog 
chown -R $mySQLOwner:$mySQLGroup $mySQLLog
