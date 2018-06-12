# Instructions

Les deux scripts présents permettent la **sauvegarde** et la **restauration** de base de donnée à partir du système de snapshot de **LVM2**.



## Prérequis

* Avoir le paquet **mysql-server** (ainsi que ses dépendances) d'installé

* Pour tester le script, utiliser la base de données inclus

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

## Faire une backup de mysql

* Mettre **snap.sql** au même endroit que **backup.sh** pour que le script s'exécute correctement 

* Créer un dossier **/backup** au préalable :
  ```terminal
  shell> mkdir /backup
  ```

* Lancer le script soit avec **sudo** soit être en **su** :
  ```terminal
  shell> sudo sh backup.sh
  ```

* Une fois lancé, un mot de passe sera demandé il faudra rentré celui de votre compte **root** de **mysql**

## Restaurer une base de donnée

* Dans le script changez *employees* par le nom de la base de donnée souhaitée pour la restauration (base de données qui doit être présente dans le **/backup**)

* Si vous avez utilisé backup.sh il faut décompresser le fichier **mysql.tar.gz**, avant de lancer le script, avec la commande :
	 ```terminal
	 shell> sudo tar xf mysql.tar.gz
	 ```

* Lancer le script en **sudo** ou être en **su** :
	 ```terminal
	 shell> sudo sh restore.sh
	 ```

