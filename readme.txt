===============================================================================================================
Instructions
===============================================================================================================

-------Pour faire une backup avec backup.sh----------

-Mettre snap.sql au m�me endroit que backup.sh pour que le script s'ex�cute correctement

-Cr�er un dossier /backup avant de lancer le script :
 mkdir /backup

-Lancer le script avec sudo ou �tre en su :
 sudo sh backup.sh

-Une fois le script lanc� il faudra mettre votre mot de passe root pour mysql


-------Pour restaurer la BDD avec restore.sh----------

-Changer 'employees' dans le script par la base de donn�e souhait�e pour la restauration

-Si vous venez d'utiliser backup.sh il faut d�compresser le fichier mysql.tar.gz avec la commande :
 sudo tar xf mysql.tar.gz
 avant de lancer restore.sh

-Lancer le script avec sudo ou �tre en su :
 sudo sh restore.sh