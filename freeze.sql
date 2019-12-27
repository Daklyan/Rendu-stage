#Freeze Mysql on read only mod

FLUSH TABLES WITH READ LOCK;

#Creation of the snapshot backup

system lvcreate -s -n backup -L 400M /dev/centos/root

#Release Mysql

UNLOCK TABLES;
exit
