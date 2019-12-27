
﻿

# Instructions

The scripts allows you to **backup** and **restore** a database from **LVM2** snapshots.



## Requirements

* **mysql-server** package installed

*  **nfs-utils** package installed and activated + an athore vm (for database slave)

* db_test for testing the scripts


##  How to install the database for the tests

To unzip the database you'll need a tool that can read .zip like **winzip** that we'll use in this exemple :

```terminal
shell> unzip test_db-master.zip
shell> cd test_db-master/
```
Then import the database :

```terminal
shell> mysql -uroot -p -t < employees.sql
```

## Set up of the NFS
_Script modification :_

Change the variable ipServer in var.sh by the ip of your vm that will be the nfs server

 _Firewall access :_

```terminal
shell> firewall-cmd --permanent --zone=public --add-service=ssh
shell> firewall-cmd --permanent --zone=public --add-service=nfs
shell> firewall-cmd --reload
```

_Server side :_
* Create a directory nfs and give the own / rights  :
 ```terminal
 shell> mkdir /var/nfs
 shell> chown nfsnobody:nfsnobody /var/nfs
 shell> chmod 755 /var/nfs
 ```
 * Modify exports file
 ```terminal
 shell> nano /etc/exports
```
```terminal

/var/nfs        IPCLIENT(rw,sync,no_subtree_check)

```
* Save changes on exports
```terminal
shell> exportfs -a
```
_Client side_

* Create a nfs directory :
```terminal
shell> mkdir -p /mnt/nfs/var/nfs
```
## Backup of mysql

* Create a directory **/backup** before anything:
  ```terminal
  shell> mkdir /backup
  ```

* Launch backup.sh with **sudo** or in **su** :
  ```terminal
  shell> sudo sh backup.sh
  ```

* Once it's launched a password we'll be asked, enter your **root** password for **mysql**

## Restore a database

**TO DO**
