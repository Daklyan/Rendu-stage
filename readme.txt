===============================================================================================================
Instructions
===============================================================================================================

-------Pour faire une backup avec backup.sh----------

-Cr�er un dossier /backup avant de lancer le script :
 mkdir /backup

-Lancer le script avec sudo ou �tre en su :
 sudo sh backup.sh


-------Pour restaurer la BDD avec restore.sh----------

-Si vous venez d'utiliser backup.sh il faut d�compresser le fichier mysql.tar.gz avec la commande :
 sudo tar xf mysql.tar.gz
 avant de lancer restore.sh

-Lancer le script avec sudo ou �tre en su :
 sudo sh restore.sh