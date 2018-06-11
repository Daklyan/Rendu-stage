

#Stop le serveur mysql

systemctl stop mysqld


#Copier la base de données dans le /var/lib/mysql

sudo cp -rf   /mnt/ubuntu_426/var/lib/mysql/employees /var/lib/mysql/


#Changer le own et mod des fichiers

sudo chown -R mysql:mysql /var/lib/mysql/employees
sudo chmod -R 660 /var/lib/mysql/employees
sudo chown  mysql:mysql /var/lib/mysql/employees 
sudo chmod 700 /var/lib/mysql/employees


#Copier ibdata1 dans /var/lib/mysql

sudo cp /backup/backup/mysql/ibdata1 /var/lib/mysql/

sudo chown mysql:mysql /var/lib/mysql/ibdata1


#Copier ib_logfile0 et ib_logfile1 dans/var/lib/mysql

sudo cp /backup/backup/mysql/ib_logfile0 /var/lib/mysql/

sudo cp /backup/backup/mysql/ib_logfile1 /var/lib/mysql/


#Rechanger le own 

sudo chown -R mysql:mysql /var/lib/mysql


#Rallumer le serveur mysql

systemctl restart mysqld