#!/bin/sh
ipServer=192.168.20.34  #Ip of the other vm for the nfs
backupDir=/backup #Directory to store the dump
mysqlServer=localhost #mysql server if yours is not local
mysqlPassword=SuchPassw0rd. #Root mysql password
bdd=employees #Name of the database you want to backup or restore
nfsDirServ=/var/nfs #Nfs directory server side
mysqlDir=var/lib/mysql #Mysql data
mountPoint=/mnt/nfs/var/nfs
mysqlSnap=/dev/centos/backup

log(){
  message=$1
  severity=$2
  if [ -z "$serverity" ]; then
    severity=info #If $serverity is empty, default severity will be info
  fi
  echo $message
  logger -p local7.$severity $message
}
