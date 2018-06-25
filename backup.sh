#!/bin/sh

source /home/var.sh #Variables and log() function

#Mount nfs

mount $ipServer:/var/nfs $mountPoint

#Nfs mounted?

mount | grep $mountPoint
if [ "$?" -eq 0 ]; then
  log  'NFS mounted'
else
  log "NFS didn't mount properly" emerg
  exit
fi

#Freeze - Snapshot -Release

mysql -uroot -p$mysqlPassword < freeze.sql


#LV created?

lvs | grep backup
if [ "$?" -eq 0 ]; then
  log 'LV created'
else
  log "LV creation canceled - Error : creation of the LV didn't work" emerg
  umount $mountPoint
  exit
fi

#Mount snapshot on /mnt/nfs/var/nfs

mount -o nouuid $mysqlSnap $mountPoint

#mysqlData is mounted?

mount | grep $mysqlSnap
if [ "$?" -eq 0 ]; then
  log "$mysqlSnap mounted"
else
  log "$mysqlSnap did not mount properly" emerg
  umount $mountPoint
  lvremove -y /dev/centos/backup
  exit
fi

#Dump

ssh $ipServer "systemctl restart mysqld\"
mysqldump -uroot -p$mysqlPassword $bdd > $nfsDirServ/backup_$bdd.sql\""

#Compression of the Dump

tar cvf /backup/backup_$bdd-$(date +%d%m%Y-%H%M%S).tar.gz $mountPoint/backup_$bdd.sql | rm $mountPoint/backup_$bdd.sql

#Unmount

unmount $mountPoint

#Destruction of the snapshot

lvremove -y /dev/centos/backup
