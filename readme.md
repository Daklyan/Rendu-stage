

# Instructions

Les deux scripts présents permettent la **sauvegarde** et la **restauration** de base de données à partir du système de snapshots de **LVM2**.



## Prérequis

* Avoir le paquet **mysql-server** (ainsi que ses dépendances) d'installé(es)

* Installer le paquet **nfs-utils** sur la machine plus une autre machine et l'activer

* Pour tester le script, utiliser la base de données db_test


## Installer la base de données de test

Pour pouvoir dézipper la base de données vous aurez besoin d'un outil qui peut lire les .zip comme **winzip** que nous allons utiliser dans l'exemple :

```terminal
shell> unzip test_db-master.zip
shell> cd test_db-master/
```
Ensuite il suffit d'importer la base de données :

```terminal
shell> mysql -uroot -p -t < employees.sql
```

## Mettre en place le nfs

 _Accès firewall :_

```terminal
shell> firewall-cmd --permanent --zone=public --add-service=ssh
shell> firewall-cmd --permanent --zone=public --add-service=nfs
shell> firewall-cmd --reload
```

_Côté serveur :_
* Créer un répertoir nfs et attribuer les own / droits :
 ```terminal
 shell> mkdir /var/nfs
 shell> chown nfsnobody:nfsnobody /var/nfs
 shell> chmod 755 /var/nfs
 ```
 * Modifier le fichier exports
 ```terminal
 shell> nano /etc/exports
```
```terminal

/var/nfs        IPCLIENT(rw,sync,no_subtree_check)

```
* Valider les modifications du fichier export
```terminal
shell> exportfs -a
```
_Côté client_

* Créer un répertoir nfs :
```terminal
shell> mkdir -p /mnt/nfs/var/nfs
```
## Faire une backup de mysql

* Mettre **snap.sql** au même endroit que **backup.sh** pour que le script s'exécute correctement

* Créer un dossier **/backup** au préalable :
  ```terminal
  shell> mkdir /backup
  ```

* Lancer le script soit avec **sudo** soit en étant en **su** :
  ```terminal
  shell> sudo sh backup.sh
  ```

* Une fois lancé, un mot de passe sera demandé il faudra rentrer celui de votre compte **root** de **mysql**

## Restaurer une base de données

* Dans le script changez *employees* par le nom de la base de données souhaitée pour la restauration (base de données qui doit être présente dans le **/backup**)

* Si vous avez utilisé backup.sh il faut décompresser le fichier **mysql.tar.gz**, avant de lancer le script, avec la commande :
	 ```terminal
	 shell> sudo tar xf mysql.tar.gz
	 ```

* Lancer le script en **sudo** ou être en **su** :
	 ```terminal
	 shell> sudo sh restore.sh
	 ```
