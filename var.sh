#!/bin/sh
ipServer = 192.168.20.40
backupDir = /backup
mysqlServer = localhost
mysqlPassword = suchPassw0rd.
mysqlData = /dev/centos/root
bdd = employees
nfsDirServ = /var/nfs
mysqlDir = var/lib/mysql
mountPoint = /mnt/nfs/var/nfs

function log(message,severity){
  if[-z "$severity"]
  then
    severity = INFO
  fi
  echo'$message'
  logger -p local7.$severity '$message'
}
