#!/bin/sh

source /home/var.sh #Variables and log() function
echo 'source done'

#Mount nfs

mount $ipServer:/var/nfs $mountPoint
echo 'mount done'

#Nfs mounted?

mount | grep $mountPoint
if [ "$?" -eq 0 ]
then
  log  'NFS mounted', info
else
  log "NFS didn't mount properly", emerg
  exit
fi

#Freeze - Snapshot -Release

mysql -uroot -p$mysqlPassword < freeze.sql #WIP


#LV created?

lvs | grep backup
if [ "$?" -eq 0 ]
then
  log 'lv created', info
else
  log 'LV creation canceled - Error : creation of the LV didn't work', emerg
  exit
fi

#Mount snapshot on /mnt/nfs/var/nfs

mount -o nouuid $mysqlData $mountPoint

#mysqlData is mounted?

mount | grep $mysqlData
if [ "$?" -eq 0 ]
then
  log $mysqlData' mounted', info
else
  log $mysqlData' did not mount properly', emerg
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
