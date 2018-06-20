#!/bin/sh

source var.sh #Variables and log() function

#Mount nfs

mount $ipServer:/var/nfs $mountPoint

#Nfs mounted?

mount | grep $mountPoint
if["$?" -eq 0]
then
  log('NFS mounted', INFO)
else
  log("NFS didn't mount properly", EMERGENCY)
  exit
fi

#Freeze - Snapshot -Release

mysql -uroot -p$mysqlPassword < freeze.sql #WIP

#LV created?

lvs | grep backup
if["$?" -eq 0]
then
  log('lv created', INFO)
else
  log("LV creation canceled - Error : creation of the LV didn't work", EMERGENCY)
  exit
fi

#Mount snapshot on /mnt/nfs/var/nfs

mount -o nouuid $mysqlData $mountPoint

#mysqlData is mounted?

mount | grep $mysqlData
if["$?" -eq 0]
then
  log('$mysqlData mounted', INFO)
else
  log('$mysqlData did not mount properly', EMERGENCY)
  exit
fi

#Dump

ssh $ipServer"systemctl restart mysqld | mysqldump -uroot -p$mysqlPassword $bdd > $nfsDirServ/backup_$bdd.sql"

#Compression of the Dump

tar cvf /backup/backup_$bdd-$(date +%d%m%Y-%H%M%S).tar.gz $mountPoint/backup_$bdd.sql | rm $mountPoint/backup_$bdd.sql

#Unmount

unmount $mountPoint

#Destruction of the snapshot

lvremove /dev/centos/backup
