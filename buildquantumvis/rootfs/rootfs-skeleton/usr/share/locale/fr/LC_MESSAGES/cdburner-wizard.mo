��          �   %   �      @  1   A  �  s  /   �     -     A     _      z     �     �  
   �     �     �  k   �     H  7   ]  8   �  6   �  &     ,   ,  (   Y  7   �  3   �     �       ;    1   I	  �  {	  /   e  &   �  (   �  ,   �  %     #   8     \     h     u     }  V   �     �  ;   �  1   1  /   c  7   �  7   �  6     5   :  3   p     �     �                                                                        	                
                                      /dev/cdrom is currently linked to:  ${CDROMLINK}. /dev/dvd and /dev/cdrom are links to the actual devices, for example, a link to /dev/sdc. These should point to the drives that you want to read from.
For example, my PC has two drives, a DVD read-only drive and a CD-burner drive. 
I point *both* /dev/dvd and /dev/cdrom to the DVD drive, although I could have pointed /dev/cdrom to the burner drive (a DVD drive can also read CDs, so I chose it as my default for reading both CDs and DVDs).

There are various applications for reading from CD or DVD. For example, Gxine can play audio CDs and video DVDs. Some of these applications require that /dev/cdrom 
or /dev/dvd point to the correct devices. /dev/dvd is currently linked to:    ${DVDLINK}. CD/DVD drive Wizard CD/DVD driver Wizard: FAILURE CD/DVD driver Wizard: HELP Choose which is the CDROM drive: Choose which is the DVD drive: Choose_cdrom Choose_dvd EXIT HELP If you disagree with these choices, click the "${CHOSECD}"
or "${CHOSEDVD}" button to change the selection. Optical Drive Wizard Puppy has probed your PC and found these CD/DVD drives: Puppy thinks the default CDROM drive is:     ${CDROMDEV} Puppy thinks the default DVD drive is:       ${DVDDEV} Welcome to my CD and DVD Drive Wizard! YOU JUST CHOSE ${CDROMD0} AS THE CDROM DRIVE YOU JUST CHOSE ${DVDD0} AS THE DVD DRIVE YOU MADE NO CHOICE FOR CDROM DRIVE, KEEPING ${CDROMDEV} YOU MADE NO CHOICE FOR DVD DRIVE, KEEPING ${DVDDEV} no optical drive found nothing Project-Id-Version: cdburner-wizard VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2012-11-16 09:50+0800
Last-Translator: root <jj@moulinier.net>
Language-Team: French
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 /dev/cdrom pointe actuellement vers : $CDROMLINK. /dev/dvd et /dev/cdrom sont des liens vers les périphériques, par exemple, un lien vers /dev/sdc. Ils doivent pointer vers les lecteurs que vous souhaitez utiliser pour lire.
Par exemple, mon PC a deux périphériques, un lecteur de DVD et un lecteur-graveur de CD. 
Je pointe à la fois /dev/dvd et /dev/cdrom vers le lecteur de DVD, bien que j'aurais pu lier /dev/cdrom au lecteur-graveur de CD (un lecteur de DVD peut aussi bien lire les CD, et je l'ai donc choisi par défaut pour la lecture des CD et DVD).

Il existe différentes applications pour la lecture des CD ou DVD. Par exemple, gxine peut lire des CD audio et DVD vidéo. La plupart de ces applications exigent que /dev/cdrom 
ou /dev/dvd pointent vers les bons périphériques. /dev/dvd pointe actuellement vers :   $DVDLINK. Assistant de lecteur/graveur de CD/DVD Assistant du pilote de CD et DVD : ECHEC Assistant de lecteur/graveur de CD/DVD: AIDE Choisir le lecteur/graveur de CDROM : Choisir le lecteur/graveur de DVD : Choix du CD Choix du DVD QUITTER AIDE Si pas d'accord, cliquez sur les boutons
 "${CHOSECD}" ou "${CHOSEDVD}" pour modifier. Assistant de disque optique Votre PC contient les lecteur/graveurs de CD/DVD suivants : Lecteur/graveur de CDROM par defaut:    $CDROMDEV Lecteur/graveur de DVD par defaut:      $DVDDEV                   Bienvenue dans l'Assistant CD et DVD! VOUS AVEZ CHOISI ${CDROMD0} COMME LECTEUR/GRAVEUR DE CD VOUS AVEZ CHOISI ${DVDD0} COMME LECTEUR/GRAVEUR DE DVD VOUS N'AVEZ FAIT AUCUN CHOIX, ON CONSERVE ${CDROMDEV} VOUS N'AVEZ FAIT AUCUN CHOIX, ON CONSERVE ${DVDDEV} aucun disque optique trouvé   aucun 