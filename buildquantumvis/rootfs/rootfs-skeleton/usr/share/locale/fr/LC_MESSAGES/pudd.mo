��    ]           �      �  4   �  ?     ,  ^     �	     �	     �	  "   �	  &   �	     
     7
  !   T
     v
     �
     �
     �
     �
  �   �
  @   �  <   �       �     N     N   ^  P   �  *   �     )     6     B  #   S  !   w  )   �  '   �  %   �               *     ;  ?   I     �  )   �  �   �  $   _  H   �     �  :   �       .   )     X  9   ]  -   �     �  M   �  6   &  �   ]  �   �  �  �  {    9   �     �     �  3   �  :        L    a  $   w  -   �  �  �     �  0   �     �       	     	     1   &     X  4   k  .   �     �  4   �  	     �     �   �  �   V  6   D  �   {  �     �   �#  9   �$  Y  
%     d&  ?   h&     �&     �&  A   �'  ?   (  X  Y(     �)     �)  !   �)  )   �)  /   )*  !   Y*  $   {*  '   �*     �*  +   �*  #   +     8+     O+  �   g+  Q   ,  M   c,     �,  /  �,  ]   �-  ^   H.  [   �.  5   /     9/     H/     X/  #   j/  "   �/  )   �/  &   �/  #   0     &0     -0  	   50     ?0  S   G0  	   �0  +   �0  �   �0  )   �1  O   �1     �1  P   2  (   S2  D   |2     �2  ?   �2  1   3     83  a   J3  =   �3  �   �3  �   �4  }  85  �  �6  :   _8     �8     �8  (   �8  5   �8     9  $  49  ,   Y:  +   �:    �:     �=  *   �=     >     >  
   #>  
   .>  H   9>     �>  5   �>  5   �>     ?  D   ?     Y?  �   f?  �   @  
  �@  D   �A  �   	B    �B     �F  8   �G  �  �G     xI  :   |I     �I           X      Q   A      D          +           4   J   P              C   <   S       2   U   N   (      ?           :   W                %           Y   &       8   .       @   /   Z           [         1          7   0   T         I       >   \   9   R       H       =   5   ]   G   ;      E      -          	   #                                     *           '       3   )   O      ,   M               K   V      6   !   
   F              "           $          B   L             (see fsresize doc page how to restore f.s.)          Changes have been backed up in /tmp/fsresizebackup.dat $SOURCEPART will be copied to $DESTPART.gz, compressed with gzip.
Compression may be greatly improved if the unused part of $SOURCEPART
is zeroised. This involves temporarily mounting it on /mnt/tmp,
writing zeroes to the unused areas, then unmounting it.
Would you like to do this size optimisation? ${TITLE} choose remote ${TITLE}: ERROR ${TITLE}: choose destination ${TITLE}: choose destination drive ${TITLE}: choose destination partition ${TITLE}: choose source drive ${TITLE}: choose source file ${TITLE}: choose source partition ${TITLE}: final check ${TITLE}: grow filesystem ${TITLE}: optimise compression ${TITLE}: probe ZIP ${TITLE}: run fdisk ${WARNING1}WARNING2: $SOURCEPART file has been uncompressed as $UNCOMPRPATHNAME.
          Pudd will delete it, but aborting before completion may prevent this. ...HOWEVER, Puppy detects an error probing the USB partitions!!! ...HOWEVER, Puppy detects an error probing the partitions!!! ...done ...for a destination partition, make sure that it is at least as big as the source.
...for a destination file, make sure that the mounted partition where it will reside
   has enough free space. A summary of the space in the local mounted partitions: ...if USB partitions are missing or incorrect, click the "Probe USB" button... ...if ZIP partitions are missing or incorrect, click the "Probe ZIP" button... ...if floppy disk partition missing or incorrect, click "Probe FLOPPY" button... Backup finished. Press ENTER key to exit:  Choose drive Choose file Choose partition Choose the drive to be copied from: Choose the drive to be copied to: Choose the drive to be examined by fdisk: Choose the partition to be copied from: Choose the partition to be copied to: Choose_drive Choose_file Choose_partition Choose_remote Click on "Run_fdisk" button to create/edit/delete partitions... Continue DO THAT RIGHT NOW, THEN PRESS ENTER KEY:  Do you want to grow the filesystem to fill the partition?\n(after it is copied to the partition)\n(ext2, ext3, ext4 and fat12/16/32 (msdos/vfat) filesystems only) ERROR, $REMOTEADDR IS NOT REACHABLE! ERROR: Puppy experienced a problem trying to unmount partition ${CATERR} EXIT Error uncompressing ${SOURCEPART}. Click button to quit... First check and fix f.s.... For a large partition, this may take awhile... HELP Here is what Puppy knows about ${DESTPART} ${DESTCHOICE}: Here is what Puppy knows about ${SOURCEPART}: IDE (internal) ZIP If all is well, click a button to choose source drive/partition/image-file... If everything looks ok, click the "Continue" button... If no need to run fdisk, click a button to choose destination...
(Note, if destination not on current PC, click "Choose_remote" button)... If the destination is a drive/partition, it must be at least as large as the source
drive/partition -- Pudd will display some info about this in the next window. If the destination is a file, it will be compressed with the "gzip" program. This
means that the file will be about half the size of the source drive/partition.
Well, even though the destination file is compressed, you will still need to 
uncompress it if you ever want to mount it by loopback device, and Pudd also will
uncompress it if it has to be copied to another drive/partition. If the destination is a partition, Pudd will offer to grow the filesystem to fill
the partition. However, this only applies if the source partition is an ext2,
ext3, ext4, or fat12/16/32 (this includes what we call msdos and vfat) filesystem.
(NOTE: destination f.s. does not matter as will be overwritten)
(WARNING: fat resize code is immature. Do not use on anything critical!) KILL THE NETCAT LISTENER ON REMOTE PC, AND START IT AGAIN Last chance to backout! No Now copying $2 to $1, please wait very patiently... Now copying $2 to remote PC, please wait very patiently... Now resizing f.s.... Now to choose the destination. This Pudd program will first try to use the "dd"
program in normal mode, but if the source has an error it will abort.
Pudd will then try an alternate mode of dd to ignore read errors, which means
that the destination will have errors in it also. Now zeroising unused areas of $2 ... Ok, you have chosen a source of ${SOURCEPART} Okay, the first thing to do is decide on the source:
 1. If the source is a file, it must be a complete filesystem, such as produced by a 
    previous usage of Pudd to copy a partition or drive  to a file -- such a "file" is
    not like an ordinary text or graphic file, it is an image of a partition or complete
    drive. An image file can be copied to a partition or drive,  an ordinary file cannot.
 2. If the source is a drive, for example /dev/sda, the entire drive is copied. However, if
    source is a partition, example: /dev/sda1, then it only is copied (sda1, sda2, etc. are
    partitions in drive sda. Some drives do not have individual partitions, ex: /dev/fd0,
    that is, there is only one filesystem that occupies the entire drive). Parallel port ZIP Please choose what type of ZIP drive you have... Port: Probe FLOPPY Probe USB Probe ZIP Pudd: new or choose existing (replace) dest. file Puppy universal dd Read error, starting again and will ignore errors... Read error, starting again, ignoring errors... Remote address: Resizing $4 filesystem to fill $3 Kbyte partition... Run_fdisk Sorry, the destination drive is too small. The source 
$SOURCEPART is $SOURCESIZE Kbytes but the destination 
$DESTPART is $DESTSIZE Kbytes. Try again... Sorry, the destination partition is too small. The source 
$SOURCEPART is $SOURCESIZE Kbytes but the destination 
$DESTPART is $DESTSIZE Kbytes. Try again... Sorry, this file does not have a filesystem inside it. 
Pudd is not intended for copying ordinary files. A file with a filesystem inside it is an
image of a drive or partition, and may be copied back to a drive or partition. Try again... Testing hardware.
Please wait, this may take awhile... These are the partitions that Puppy knows about (Note: mounted partitions not
shown. A mounted partition should be unmounted before copying from/to it): To transfer to a remote computer, you have to start the netcat/nc program\nrunning on the remote computer. If the destination is a drive or partition,\nit must be unmounted. The setup could be as simple as a ethernet cross-over\ncable between two PCs, or over the Internet.\nThis is what you need to execute on the remote PC:\n # nc -l -p ${REMOTEPORT} < /dev/null | gunzip -c | dd of=DESTDEV bs=512\n...where DESTDEV is whatever you want to write to, for example /dev/hda1\n...you may be able to leave the bs= parameter off, or make it 1024 for ext2/3.\n...I think for msdos/vfat, bs=512 is correct.\n...the -l parameter means that nc will listen for data incoming at the port.\n...THIS MUST BE DONE RIGHT NOW!\n\nThe local PC needs to know where the remote PC is, and the address may be\na URL or IP. For example, www.goosee.com, or 196.108.56.10.\nThe Port number at local and remote must be the same. I suggest 1234.\n\nPLEASE START THE REMOTE nc PROGRAM RUNNING BEFORE CLICKING OK BUTTON WARNING1: be careful what you write that file to. If it is an image of a partition
          then it should be written to a partition. If an image of a whole drive, then it
          should be written to a whole drive. WARNING: Immature code, do not use for anything critical! Welcome to Pudd, the Puppy universal dd drive/partition/image-file backup/rescue program!
This program will copy any drive, partition, or image-file to another drive, partition
or file, on the same PC or over a network. You can use Pudd to make copies of floppy
disks, to make clones of a drive/partition, or to rescue a failing drive/partition. Yes You have chosen to copy ${SOURCEPART} to destination ${DESTXTN} none of these Project-Id-Version: Pudd VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2014-12-23 16:40+0100
Last-Translator: ASRI
Language-Team: French <jj@moulinier.net>
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Generator: Poedit 1.5.4
          (voir la page doc de fsresize comment restaurer le s.f.)        Sauvegardes des changements dans /tmp/fsresizebackup.dat $SOURCEPART sera copié sur $DESTPART.gz, compressé avec gzip.
La compression sera grandement ameliorée si la partie non utilisée
de $SOURCEPART est proche de 0. Ceci implique de la monter
temporairement sur /mnt/tmp, pour y écrire des 0 sur les
espaces inutilisés, puis de la démonter.
Voulez-vous faire cette optimisation de la taille ? ${TITLE} choisir distant ${TITLE} : ERREUR ${TITLE} : choisir la destination ${TITLE} : choix du disque de destination ${TITLE} : choix de la partition de destination ${TITLE} : choix du disque source ${TITLE} : choisir le fichier source ${TITLE} : choix de la partition source ${TITLE} : vérification finale ${TITLE} : étendre le système de fichiers ${TITLE} : optimiser la compression ${TITLE} : test du ZIP ${TITLE} : lancer fdisk ${WARNING1}ATTENTION 2 : Le fichier $SOURCEPART a été décompressé en $UNCOMPRPATHNAME.
          Pudd va l'effacer, mais abandonner avant la fin peut empêcher cela. ...CEPENDANT, il a été détecté une erreur en examinant les partitions USB !!! ...CEPENDANT, il a été détecté une erreur en examinant les partitions !!! ... fini ... pour une partition de destination, assurez-vous qu'elle est au moins aussi grande que la source.
... pour un fichier de destination, assurez-vous que la partition montée sur laquelle il est, possède
suffisamment d'espace disponible. Voici une vue de l'espace des différentes partitions montées : ... si des partitions USB sont absentes ou incorrectes, cliquez sur le bouton "Tester USB"... ...  si des partitions ZIP sont absentes ou incorrectes, cliquez sur le bouton "Tester ZIP"... ...  si la disquette est absente ou incorrecte, cliquez sur le bouton "Tester disquette"... Sauvegarde effectuée. Pressez ENTREE pour quitter :  Choisir disque Choisir fichier Choisir partition Choisissez le disque d'où copier : Choisir le disque de destination : Choisir le disque à examiner par fdisk : Choisissez la partition d'où copier : Choisir la partition d'où copier : Disque Fichier Partition Distant Cliquez sur le bouton "Lancer_fdisk" pour créer/modifier/effacer les partitions... Continuer FAITES-LE MAINTENANT, PUIS PRESSEZ ENTREE : Voulez-vous étendre le système de fichier pour remplir la partition ?\n(après il est copié sur la partition)\n(systèmes ext2, ext3 et fat12/16/32 (msdos/vfat) seulement) ERREUR, $REMOTEADDR N'EST PAS JOIGNABLE ! ERREUR : il y a eu un problème en essayant de démonter la partition ${CATERR} Quitter Erreur en décompressant ${SOURCEPART}. Cliquez sur le bouton OK pour quitter... En premier test puis organise le S.F ... Test du matériel en cours.
Patientez, cela peut prendre du temps... Aide Voici ce qui a été trouvé sur la ${DESTPART} ${DESTCHOICE} : Voici ce qui a été trouvé dans ${SOURCEPART} : ZIP IDE (interne) Si tout est bon, cliquez sur le bouton pour choisir la source : disque/partition/fichier-image... Si tout vous semble bon, cliquez sur le bouton "Continuer"... S'il est inutile de lancer fdisk, cliquez sur un bouton pour choisir la destination...
(Note, si la destination n'est pas sur ce PC, cliquez sur le bouton "Distant")... Si la destination est un disque/partition, il doit être au moins aussi grand que le disque/partition source 
-- Pudd fournira des infos dans la prochaine fenêtre. Si la destination est un fichier, il sera compressé avec le programme "gzip". C'est
à dire qu'il fera environ la moitié (en taille) du disque/partition source.
Bien, même si le fichier destination est compressé, vous devrez
le décompresser si vous voulez le monter par 'loopback device', et Pudd le décompressera
également s'il doit le copier sur un autre disque/partition. Si la destination est une partition, Pudd offre d'étendre le système de fichier pour remplir 
la partition. Cependant, cela s'applique seulement si la partition source a un système ext2,
ext3, ou fat12/16/32 (ce qui inclut msdos et vfat).
(Remarque : si le système de fichiers de destination est sans importance, car il sera écrasé)
(ATTENTION : code de redimensionnement fat immature. Ne pas l'utiliser sans raison !) STOPPER AUDITEUR NETCAT SUR LE PC DISTANT PUIS LE RELANCER Dernier point de retour ! Non Copie de $2 to $1, veuillez patienter... Copie de $2 vers le PC distant, veuillez patienter... Redimensionnement de S.F ... Maintenant choisissons la destination. Cette partie de Pudd va d'abord essayer d'utiliser le programme "dd"
en mode normal, mais si la source a une erreur il s’arrêtera.
Pudd essaiera un autre mode de dd pour ignorer les erreurs, ce qui veut dire
que la destination aura aussi des erreurs. Ecriture des zéros dans les vides de $2 ... Vous avez choisi la source de ${SOURCEPART} Premièrement déterminer la source :
  1. Si la source est un fichier, ce doit être un système de fichier complet, comme Pudd  l'a déjà fait lors d'une 
copie d'une partition ou disque dans un fichier -- c'est à  dire qu'un 'fichier' n'est pas un fichier ordinaire
  genre texte ou graphique, c'est une IMAGE d'une partition ou d'un disque complet.  Un fichier image peut 
tre copié sur une partition ou sur un disque, un fichier ordinaire non.
  2. Si la source est un disque, par exemple /dev/sda, le disque entier est copié.  Cependant, si la source est 
une partition, exemple : /dev/sda1, (seules sont copiées les  partitions du disque 
sda). Certains disques ne possèdent pas de partitions individuelles, ex : /dev/fd0, cela veut dire qu'une seule
  partition occupe le disque. ZIP port parallèle Choisir le type de lecteur ZIP utilisé... Port : Tester Disquette Tester USB Tester ZIP Pudd : nouveau ou choisir (remplacer) un fichier de destination existant Puppy universal dd Erreur de lecture, relance en ignorant les erreurs... Erreur de lecture, relance en ignorant les erreurs... Adresse distante : Redimensionnement de SF $4 pour remplir la partiton de $3 Koctets... lancer fdisk Désolé, le disque destination est trop petit. La source 
$SOURCEPART fait $SOURCESIZE Koctets mais la destination 
$DESTPART fait $DESTSIZE Koctets. Ré-essayez... Désolé, la partition de destination est trop petite. La source 
$SOURCEPART fait $SOURCESIZE Koctets mais la destination 
$DESTPART fait $DESTSIZE Koctets. Ré-essayez... Désolé, ce fichier ne possède pas de système de fichier interne. 
Pudd ne sait pas copier les fichiers ordinaires. Un fichier avec un système de fichier interne
est une image d'une partition/disque et peut être recopié sur une partition/disque. Ré-essayez... Test du matériel en cours.
Patientez, cela peut prendre du temps... Voici les partitions trouvées (remarque : les partitions montées ne sont pas affichées
; une partition montée sera démontée avant d'être copiée) : Pour transférer sur un ordinateur distant, vous devez lancer le programmenetcat/nc sur le PC distant. Si la destination est un disque ou une partition,\nil doit être démonté. Ce doit être aussi simple qu'avec un cable éthernet\nentre deux PC ou sur Internet.\nVoici ce dont vous avez besoin pour l'exécution sur un ordi distant:\n # nc -l -p ${REMOTEPORT} </dev/null | gunzip -c | dd of=DESTDEV bs=512\n...où DESTDEV est l'endroit où vous voulez écrire, par exemple /dev/hda1\n...vous devrez laissez le paramètre bs=off, ou lui mettre 1024 pour ext2/3.\n...Je pense que pour msdos/vfat, bs=512 est correct.\n...le paramètre -1 signifie que nc surveillera les données entrantes dans le port.\n...CE DOIT ÊTRE FAIT TOUT DE SUITE!\n\nLe PC local doit savoir où se trouve le PC distant et l'adresse doit être\nune URL ou IP. Exemple, www.goosee.com, ou 196.108.56.10.\nLes numéros des ports locaux et distant doivent être les mêmes. Disons 1234.\nLANCEZ LE PROGRAMME DISTANT nc AVANT DE CLIQUER SUR LE BOUTON OK ATTENTION 1 : soyez prudent en écrivant ce fichier vers sa destination.
          Si c'est une image d'une partition, elle doit être écrite sur une partition.
          Si c'est une image d'un simple disque, elle doit être écrite sur un simple disque. ATTENTION : code immature, ne pas utiliser sans raison ! Bienvenue dans Pudd, le programme universel de sauvegarde et de sauvetage des disques, partitions, fichiers-image !
Ce programme permet la copie d'un disque/partition/fichier-image sur un autre disque, partition
ou fichier, dans un  même PC ou en réseau. Vous pouvez utiliser Pudd pour effectuer des copies de disquettes,
cloner des disques/partitions, ou restituer des disques et partitions endommagés. Oui Vous avez décidé de copier ${SOURCEPART} vers ${DESTXTN} aucun des deux 