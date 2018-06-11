#Bloque toutes les tables en lecture seulement

FLUSH TABLES WITH READ LOCK;

#Création de la snapshot

system lvcreate -s -n backup -L 400M /dev/centos/root

#Débloquer les tables 

UNLOCK TABLES;
exit