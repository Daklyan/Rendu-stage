===============================================================================================================
Instructions
===============================================================================================================

-------Pour faire une backup avec backup.sh----------

-Mettre snap.sql au même endroit que backup.sh pour que le script s'exécute correctement

-Créer un dossier /backup avant de lancer le script :
 mkdir /backup

-Lancer le script avec sudo ou être en su :
 sudo sh backup.sh

-Une fois le script lancé il faudra mettre votre mot de passe root pour mysql


-------Pour restaurer la BDD avec restore.sh----------

-Changer 'employees' dans le script par la base de donnée souhaitée pour la restauration

-Si vous venez d'utiliser backup.sh il faut décompresser le fichier mysql.tar.gz avec la commande :
 sudo tar xf mysql.tar.gz
 avant de lancer restore.sh

-Lancer le script avec sudo ou être en su :
 sudo sh restore.sh