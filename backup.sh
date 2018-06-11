#Connexion à mysql et exécution de snap.sql

mysql -uroot -pD4rkn00bs. < snap.sql

#mount de la snapshot sur /mnt

mount -o nouuid /dev/centos/backup /mnt

#Copier le contenu de la snapshot dans /backup

cp -a /mnt/var/lib/mysql /backup

#unmount /mnt

umount /mnt

#Suppression de la snapshot

lvremove -y /dev/centos/backup

#Compression de /backup/mysql

tar cvf /backup/mysql.tar.gz /backup/mysql
rm -r /backup/mysql