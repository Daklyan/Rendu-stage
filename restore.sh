#Déclaration de la variable bdd

bdd=employees #<-- remplacé par la BDD souhaitée

#Stop le serveur mysql

systemctl stop mysqld


#Copier la base de données dans le /var/lib/mysql

cp -rf   /mnt/ubuntu_426/var/lib/mysql/$bdd /var/lib/mysql/


#Changer le own et mod des fichiers

chown -R mysql:mysql /var/lib/mysql/$bdd
chmod -R 660 /var/lib/mysql/$bdd
chown  mysql:mysql /var/lib/mysql/$bdd 
chmod 700 /var/lib/mysql/$bdd


#Copier ibdata1 dans /var/lib/mysql

cp /backup/backup/mysql/ibdata1 /var/lib/mysql/

chown mysql:mysql /var/lib/mysql/ibdata1


#Copier ib_logfile0 et ib_logfile1 dans/var/lib/mysql

cp /backup/backup/mysql/ib_logfile0 /var/lib/mysql/

cp /backup/backup/mysql/ib_logfile1 /var/lib/mysql/


#Rechanger le own 

chown -R mysql:mysql /var/lib/mysql


#Rallumer le serveur mysql

systemctl start mysqld