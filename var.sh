#!/bin/sh
ipServer = 192.168.20.40
backupDir = /backup
mysqlServer = localhost
mysqlPassword = D4rkn00bs.
mysqlData = /dev/centos/root
bdd = employees
nfsDirServ = /var/nfs
mysqlDir = var/lib/mysql
mountPoint = /mnt/nfs/var/nfs

function log(message,criticity){
  if[-z "$criticity"]
  then
    criticity = INFO
  fi
  echo'$message'
  logger -p local7.$criticity '$message'
}
