#Connexion à mysql et exécution de snap.sql

mysql -uroot -p < snap.sql

#mount de la snapshot sur /mnt

mount -o nouuid /dev/centos/backup /mnt

logger Backup mounted on /mnt

#Copier le contenu de la snapshot dans /backup

cp -a /mnt/var/lib/mysql /backup

logger mysql copied in /backup

#unmount /mnt

umount /mnt

logger /mnt unmounted

#Suppression de la snapshot

lvremove -y /dev/centos/backup

logger backup snapshot destroyed

#Compression de /backup/mysql

tar cvf /backup/mysql.tar.gz /backup/mysql
rm -r /backup/mysql

logger /backup/mysql compressed