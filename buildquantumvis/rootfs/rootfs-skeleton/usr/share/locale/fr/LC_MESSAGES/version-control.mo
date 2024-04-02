��    _                   i   	     s     �  :   �  p   �  �   U	  �   %
     �
  
   �
  
   �
               #     *     ;  �   L  �   �  �   �  w   �  �        �     �     �     �     �  7   �  h   )     �     �     �     �     �  e   �  +   [  5   �  4   �  (   �          :     R     o     �  5   �  �   �  �   `  [   #  Z     �   �  k   �  `     9   u  �   �  �   8     �                3     K    `     w     �     �     �     �      �  �   �  "   �  Y   �  �   &  `   �     F  �   V  /   �  '     �   3  y   �     7  g   S     �     �  �   �     �  %   �  &          '      ;   g   S      �      �   V   �   �   "!  �   �!  6   V"      �"  @  �"  �   �#  +   �$  +   �$  K   �$  �   K%  �   �%  4  �&     (  
   (  
   (     "(     /(  
   B(     M(     _(  �   q(  �   ")     *  �   ;+  �   �+  w  �,     .     3.     ;.     Y.  Q   y.  l   �.     8/  "   I/     l/     �/     �/     �/  .   50  0   d0  @   �0  (   �0  '   �0     '1  )   D1     n1     �1  C   �1  �   �1  =  �2  }   �3  v   S4    �4  o   �5  m   <6  O   �6  �   �6  �   �7  	   z8     �8     �8     �8     �8  P  �8  #   >:     b:     n:     �:     �:  $   �:  �   �:  *   �;  q   �;  �   ^<  t   V=     �=  �   �=  =   �>  *   �>  �   
?  �   �?     Z@  |   x@  %   �@  #   A  �   ?A     &B  2   ;B  3   nB  $   �B     �B  �   �B  	   xC  	   �C  �   �C  �   D  �   �D  E   �E  8   �E                =   <                    6   A   ]   +      L      #               X      0           !   9              _   /   4   \          
   2   [   -   ;   @   >   	       S   "   &   7   T   Q   D   O   ^      Z                P   5   3   V   I   W           F   )      ?   (   $   Y               K   C         G                       1   R   :      .      8   B   %             '       M   U   H      *       E       N                                J   ,                /files will not be erased. This is where user personal files are kept, such as downloads, photos, videos. /home is a symlink to: /mnt/wkg/home is a symlink to: <i>Depth</i> is stored in /var/local/version-history-depth A container is a copy of Easy Linux, to run applications isolated from the main Easy Linux and other containers. A container is not really a copy, it just seems that way. It is built upon a layered filesystem, with <i>easy.sfs</i> and other read-only layers that are shared with the main Easy Linux and other containers. As version upgrades occur, the amount of storage occupied by older versions may get excessive, hence the <i>Depth</i> parameter sets a maximum depth for the history. Older versions are deleted. Close Container: Containers Current status Current version: Depth: ERROR: Container ERROR: container Each container has its own read-write layer, and this may be erased, or a snapshot taken. If there is a previous snapshot, then it can be rolled-back to. Easy Linux also supports containers, which are in the <i>containers</i> folder. Snapshots of current work in each container may also be saved, in this case inside the appropriate container folder. Easy Linux keeps a record of everything. The user may take a snapshot of the current work at any time, and there will be upgrades to later versions. All snapshots and old versions are saved in the <i>releases</i> folder. Easy Linux runs on a layered filesystem, with read-only (ro) layer <i>easy.sfs</i>, and a read-write (rw) layer on top. Easy Linux runs on a layered filesystem, with read-only (ro) layers <i>easy.sfs</i> and <i>session.sfs</i>, and a read-write (rw) layer on top. Easy Linux runs on a layered filesystem. This has one or more read-only layers on the bottom, including <i>easy.sfs</i> that has the entire Easy Linux files.
The top layer is read-write, and this has all of the changes you have made, such as new files and installed packages. Easy Version Control Erase Erase almost completed Erase the working session: Files found inside each easy-<i>version</i> folder are: Folders within the repository are named easy-<i>version</i>, where <i>version</i> is the release number. Help: Containers Help: Easy Version Control Help: Erase session Help: Rollback Help: take snapshot Here you may choose to take a snapshot of the session, or roll back to an earlier snapshot or version If there are any snapshots, they are named: It is the content of this folder that will be erased. It is this read-write (rw) layer that will be saved. It is this rw layer that will be erased. Location of containers folder: Location of containers: Location of releases folder: Location of releases: Location of rw folder: Merge of session.sfs and rw layer of previous version NOTE: if you click the Erase button, there will be another window offering to preserve some things, such as browser, audio or video profiles. NOTICE: As the boot partition is read-only, cannot rollback to a different version. However, you can bootup an older or newer version to achieve the version change, for example boot an older CD. Note however, anything installed to /files is outside the rw layer, and will not be erased. Note however, anything installed to /home is outside the rw layer, and will not be erased. Note that although it is nice to keep all of the history in the releases, this can get out of hand if memory storage is limited. A Flash stick of 8GB for example, may seem like a lot, but can quickly fill. Note that session.sfs is the merge of session.sfs and the rw-layer from the previous version of Easy Linux. Note that the purpose of taking a snapshot, is that it can be rolled back to at any future date. Please type a short one-line comment about this snapshot: Previous versions (releases) of Easy Linux, if any, as well as any snapshots taken by the user, are saved in the <i>releases</i> folder. Reasons for doing this are varied. Sometimes, a later version proves to be troublesome, therefore it is a simple matter to rollback, until the problems with the later version are sorted out. Rollback Rollback almost completed Rolled-back to snapshot: Rolled-back to version: Rolled-back version: Rolling back to versions from January 2019 to December 22, 2019, is broken. That is, versions prior to 1.3 in the Pyro series and 2.2 in the Buster series. Rolling back and forward to any snapshot in the same version is OK. From 1.3 and 2.2 onwards, all of rollback should work. Save the working session: Snapshot Snapshot comments Snapshot created Snapshot file: Snapshot of the working session: Snapshots are also useful, as they capture the state of the system when the user has it setup in a particular desired way, which can be rolled back to if there is a mess created later on. Some reasons for taking a snapshot Sorry the container is currently in use. The read-write layer cannot be erased. Aborting. Sorry the container is currently in use. The read-write layer cannot be erased. It is required to restart the X server or reboot (see the Shutdown menu) to stop the desk container. Aborting. Take a snapshot or erase the working session, or rollback to an earlier snapshot, in a container Technical notes The <i>Depth</i> parameter sets a maximum limit to number of versions recorded. Older versions are deleted from the releases folder. The container read-write layer has been erased. The current easy-<i>version</i> folder: The reason for keeping all of this history in the releases folder, is that the user can roll back to any earlier version and/or snapshot. The rw layer has all changes made by the user. Theming, network setup, installed packages, etc, are all in this rw layer. The rw layer is located at: The rw layer will be erased. However, as this is currently in use, a reboot is required to take effect. The snapshot will be saved as: This has all of Easy Linux This is done for two main reasons, security, and/or to provide a working environment that does not compromise the main Easy Linux. An example of the latter would be compiling and testing source packages. This is the Linux kernel This requires a reboot to take effect This requires a reboot to take effect. This runs at bootup This will be copied to: This will not be erased. This is where user personal files are kept, such as downloads, photos, videos. WARNING Warning You cannot perform a session erase, snapshot, or rollback, when a container is in use. You have added the devx.sfs as a read-only layer. Take a snapshot before compiling and installing source packages, then later can remove them all by rolling back to the snapshot. You have setup theming and network. Later on, you want to get rid of whatever you have done, and go back to this original state. and any extra SFS files that are desired to be loaded. is bind-mounted on folder /files Project-Id-Version: easy-version-control VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2019-01-20 12:04+0100
Last-Translator: root <jj@moulinier.net>
Language-Team: French
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 le dossier /files (ou Fichiers) ne sera pas effacé. C'est là que sont conservés les fichiers personnels des utilisateurs, tels que les téléchargements, les photos, les vidéos... /mnt/wkg/home est un lien symbolique vers : /mnt/wkg/home est un lien symbolique vers : <i>Profondeur</i> (Depth) est stocké dans /var/local/version-history-depth Un conteneur est une copie de Easy Linux, permettant d'exécuter des applications isolées des principaux conteneurs Easy Linux et autres. Un conteneur n'est pas vraiment une copie, cela semble juste comme ça. Il est construit sur un système de fichiers en couches, avec <i>easy.sfs</i> et d'autres couches en lecture seule partagées avec le conteneur principal Easy Linux et d'autres. Au fur et à mesure des mises à niveau de version, la quantité de stockage occupée par les anciennes versions (releases) peut devenir excessive. Par conséquent, le paramètre <i>Profondeur</i> (Depth) définit une profondeur maximale pour l'historique. Les anciennes versions (releases) sont supprimées. Fermer Conteneur: Conteneurs État actuel Version actuelle : Profondeur ERREUR: Conteneur ERREUR: conteneur Chaque conteneur possède sa propre couche lecture-écriture, qui peut être effacée ou prise en instantané. S'il existe un instantané précédent, vous pouvez le restaurer. Easy Linux prend également en charge les conteneurs, situés dans le dossier <i>conteneurs</i>. Des instantanés du travail en cours dans chaque conteneur peuvent également être enregistrés, dans ce cas dans le dossier du conteneur approprié. Easy Linux garde une trace de tout. L'utilisateur peut prendre un instantané du travail en cours à tout moment, et il y aura des mises à niveau vers des versions (releases) ultérieures. Tous les instantanés et les anciennes versions sont enregistrés dans le dossier <i>releases</i>. Easy Linux s'exécute sur un système de fichiers en couches, avec la couche en lecture seule (ro) <i>easy.sfs</i>, et une couche en lecture-écriture (rw) au sommet. Easy Linux s'exécute sur un système de fichiers en couches, avec les couches en lecture seule (ro) <i>easy.sfs</i> et <i>session.sfs</i>, et une couche en lecture-écriture (rw) au sommet. Easy Linux s’exécute sur un système de fichiers en couches. Celui-ci comporte une ou plusieurs couches en lecture seule, y compris <i>easy.sfs</i>, qui contient l’ensemble des fichiers de Easy Linux.
La couche supérieure est en lecture-écriture et contient toutes les modifications que vous avez apportées, telles que les nouveaux fichiers et les paquets installés. Contrôle de version easy Effacer Suppression presque terminée Effacer la session de travail : Les fichiers contenus dans chaque dossier easy-<i>version</i> sont les suivants : Les dossiers dans le dépot sont appelés easy-<i>version</i>, où <i>version</i> est le numéro de version. Aide: Conteneurs Aide: Contrôle de version de Easy Aide: Effacer la session Aide: Restauration Aide: prendre un instantané Ici, vous pouvez choisir de prendre un instantané de la session ou de revenir à un instantané ou à une version antérieure. S'il y a des instantanés, ils sont appelés : C'est le contenu de ce dossier qui sera effacé. C'est cette couche lecture-écriture (rw) qui sera sauvegardée. C'est cette couche rw qui sera effacée. Emplacement du dossier des conteneurs : Emplacement des conteneurs : Emplacement du dossier des «releases» : Emplacement des «releases» : Emplacement du dossier rw : Fusion de session.sfs et de la couche rw de la version précédente REMARQUE : si vous cliquez sur le bouton Effacer, une autre fenêtre vous proposera de conserver certaines choses, telles que les profils de navigateur, audio ou vidéo. AVIS: La partition de démarrage étant en lecture seule, vous ne pouvez pas revenir en arrière / avancer dans une version différente. Cependant, vous pouvez démarrer une version plus ancienne ou plus récente pour effectuer le changement de version, par exemple démarrer une version plus ancienne de CD d'EasyOS. Notez cependant que tout ce qui est installé dans /files (ou Fichiers) est en dehors de la couche rw et ne sera pas effacé. Notez cependant que tout ce qui est installé dans /mnt/wkg/home est en dehors de la couche rw et ne sera pas effacé. Notez que bien qu'il soit agréable de conserver tout l'historique des versions (releases), cela peut devenir incontrôlable si le stockage en mémoire est limité. Une clé Flash de 8 Go, par exemple, peut sembler beaucoup, mais peut rapidement se remplir. Notez que session.sfs est la fusion de session.sfs et de la couche rw de la version précédente de Easy Linux. Notez que l'objectif d'un instantané est qu'il peut être rétabli à n'importe quelle date ultérieurement. Veuillez saisir un court commentaire d'une ligne à propos de cet instantané : Les versions (releases) précédentes de Easy Linux, le cas échéant, tout autant que les instantanés pris par l'utilisateur, sont enregistrés dans le dossier <i>releases</i>. Les raisons pour cela sont variées. Parfois, une version ultérieure s'avère gênante. Il est donc simple de revenir en arrière jusqu'à ce que les problèmes de la version ultérieure soient résolus. Restaurer Restauration presque terminée Restauré vers l'instantané: Restauré vers version : Version annulée : Le retour aux versions de janvier 2019 au 22 décembre 2019 est interrompu. Autrement dit, les versions antérieures à 1.3 dans la série Pyro et 2.2 dans la série Buster. Revenir en arrière et avancer vers n'importe quel instantané dans la même version est valable. À partir de 1.3 et 2.2, toute restauration devrait fonctionner. Enregistrer la session de travail : Instantané Commentaires sur l'instantané Instantané créé Fichier de l'instantané : Instantané de la session de travail Les instantanés sont également utiles, car ils capturent l’état du système lorsque l’utilisateur l’a configuré de la manière souhaitée, auquel il est possible de revenir si un gâchis est créé ultérieurement. Quelques raisons de prendre un instantané Désolé, le conteneur est actuellement utilisé. La couche lecture-écriture ne peut pas être effacée. Abandon Désolé, le conteneur est actuellement utilisé. La couche lecture-écriture ne peut pas être effacée. Il est nécessaire de redémarrer le serveur X ou de redémarrer (voir le menu SESSION) pour arrêter le conteneur poste de travail. Abandon. Prendre un instantané ou effacer la session de travail, ou revenir à un instantané précédent, dans un conteneur Notes techniques Le paramètre <i>Profondeur</i> (Depth) définit une limite maximale au nombre de versions (releases) enregistrées. Les anciennes versions (releases) sont supprimées du dossier des «releases». La couche de lecture-écriture du conteneur a été effacée. Le dossier actuel de easy-<i>version</i> : La raison de conserver tout cet historique dans le dossier des versions (releases) est que l'utilisateur peut revenir à une version antérieure et/ou à un instantané. La couche rw contient toutes les modifications apportées par l'utilisateur. Thèmes, configuration du réseau, paquets installés, etc. sont tous dans cette couche. La couche rw est située à : La couche rw sera effacée. Cependant, comme cela est en cours d'utilisation, un redémarrage est requis pour prendre effet. L'instantané sera enregistré sous : Ce fichier contient tout Easy Linux Ceci est fait pour deux raisons principales, la sécurité et/ou pour fournir un environnement de travail qui ne compromet pas le Easy Linux principal. Un exemple de ce dernier serait la compilation et le test des paquets sources. C'est le noyau Linux Cela nécessite un redémarrage pour prendre effet Cela nécessite un redémarrage pour prendre effet. Ce fichier s'exécute à l'amorçage Ce sera copié dans : Cela ne sera pas effacé. C'est ici que sont conservés les fichiers personnels de l'utilisateur, tels que les téléchargements, les photos, les vidéos. ATTENTION Attention Vous ne pouvez pas effectuer une session de suppression, d'instantané ou de restauration lorsqu'un conteneur est en cours d'utilisation. Vous avez ajouté devx.sfs en tant que couche en lecture seule. Prenez un instantané avant de compiler et d’installer les paquets sources, puis vous pourrez tous les supprimer en revenant à l’instantané. Vous avez configuré la thématisation et le réseau. Plus tard, vous voulez vous débarrasser de ce que vous avez fait et revenir à l'état initial. et tous les fichiers SFS supplémentaires que vous souhaitez charger. est monté en liaison sur le dossier/files (ou Fichiers) 