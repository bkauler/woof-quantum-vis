��    >        S   �      H     I     \  
   k     v     �     �     �     �  G   �          6     P     _  %   |  #   �     �     �  c   �     H     a  �   z  �    :   �
  
   �
     �
  !   �
          *  G   7       ,   �  
   �     �  O   �          6     U     l     �     �  #   �  1   �      �          1     =  j  B  F   �     �  |     �   �  �   @  �   �     X  	   _  /   i  �   �  �  ^  �   P     �     �  O  �     I     [     m  !   �  (   �     �     �  	     [        k  "   �     �     �  0   �          $     B  �   G     �     �  �     �  �  O   �     �     �  .   
     9     N  O   c     �  F   �     �       S   "  )   v  '   �  "   �  !   �            0   /  E   `  +   �  %   �     �        �     Q   �!      �!  �   "  �   �"  �   j#  �   $  
   �$     �$  5   �$  �   %    �%  �   �'     w(     �(     "   	      :   3      )                    9   7   &                    <   !   '          +   2   ;       >      
   .                  5   ,                1          =       8   %   /       6               (   0          4             #                                 *            $       -       Account 1|Account2 Auto Reconnect Busy check C O N F I G U R E   W V D I A L CLOSE window but stay online Carrier check Choose modem Connect Connect to internet with a analog dialup or digital wireless (3g) modem Connect to the Internet DISCONNECT or stop trying Dialtone check Disconnect from the internet Enter the Phone or Access Number here Enter your SIM PIN only if required Enter your password here Help Init6-Init9 lines are available for user purposes; the commented examples can be used as described: Initialisation string 2: Initialisation string 3: It seems that the modem has changed.\n
It was '${wvMODEM}', it is now '${newMODEM}'\n
Do you want to update PupDial?\n
Recommend click UPDATE button... It seems that you have a modem, at port ${MYDEVM}\n
However, it is recommended that you now click the 'TEST' button\n
to test that it is working.\n
\n
Note 1: The test will also optionally probe for what is called an\n
'inialization string'. If you are running PupDial for the first time\n
or have changed modems, you will definitely need to click the 'TEST'\n
button and obtain an initialization string.\n
\n
Note 2: If you think that ${MYDEVM} might be the wrong modem,\n
click the 'No' button and the main PupDial GUI has a 'CHOOSE' button\n
that will enable you to test alternative modem interfaces.\n
\n
Recommend click 'TEST' to probe the modem... Make sure this box is checked to attempt auto reconnection Max speed: Modem Internet dialer Modem detected! Device interface: Modem setup Modem setup: NOTICE: If the log shows a failure to connect, please click left button No Only for 3G or cell/mobile phone connections Password : Phone number: PupDial - Internet connection with analog dialup or digital wireless modem (3g) PupDial modem Internet dialer PupDial: WvDial connection log PupDial: modem changed PupDial: modem found Quit R U N   W V D I A L Reading modem configuration file... Recommended to check this box if using a 3G modem Selected modem device interface: String for modem initialisation Stupid mode TEST The reason for asking this, is an internal modem will have been detected at bootup, but a 'hotpluggable' external modem may not have have been detected if plugged in after bootup. Also, if you have both, say an internal analog dialup modem, plus a USB modem, PupDial may choose the wrong one -- ticking or unticking the checkbox here will avoid that confusion... This documentation has 2 chapters:\n1. Run wvdial\n2. Configure wvdial Tick checkbox if external modem To force only 2G or 3G, uncomment the Init4 line and append 0 (2G) or 2 (3G), and substitute your operator's name for MYOPS. To force the 3G quality of service level, uncomment the Init6/Init7 line pair and set value two places each, for 384k/144k/64k, omitting the \"k\" (e.g., =1,4,64,384,64,384). To list all the APNs stored in the modem, uncomment the Init8 line; check the Connection status log for lines beginning with +CGDCONT:. To list the operator identifier stored in the modem, uncomment the Init9 line; check the Connection status log for a line beginning with +COPS: UPDATE Username: WARNING! No modem detected! You cannot dialout! Welcome to PupDial, written by Barry Kauler, with
contributions from Richard Erwin, for Puppy Linux.

A MODEM WAS NOT AUTOMATICALLY DETECTED, SO YOU
NEED TO CLICK THE 'CHOOSE' BUTTON. DO THIS NOW! Welcome to PupDial, written by Barry Kauler, with
contributions from Richard Erwin, for Puppy Linux.

There is a configuration file, /etc/wvdial.conf, that is read by
PupDial, and changes made to any of the above boxes will be saved
to wvdial.conf when you click the 'Exit' or 'Connect' buttons.
Note, you can also manually edit wvdial.conf with a text editor.

If you are using PupDial for the first time, it is recommended that
you click the help buttons, in particular the 'Modem setup' button. Welcome! First, a basic question: do you want to connect to the Internet using an internal fixed modem, or a removable (USB, serial, PCMCIA) modem? Wireless:   APN: Yes Project-Id-Version: pupdial VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2014-12-12 18:02+0100
Last-Translator: JJ Moulinier <jj@moulinier.net>
Language-Team: French <traduc@traduc.org>
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 Compte 1|Compte 2 Reconnexion auto. Vérification de l'occupation C O N F I G U R E R   W V D I A L FERMER la fenêtre, mais rester en ligne Vérification du transporteur Choisir un modem Connexion Connexion à Internet avec un modem analogique à numérotation ou numérique sans fil (3G) Connexion à Internet DÉCONNECTER ou arrêter d'essayer Vérification de la tonalité Déconnecter d'Internet Entrez le numéro de téléphone ou d'accès ici SIM PIN (si nécessaire) Entrez votre mot de passe ici Aide Les lignes init6-Init9 sont disponibles à  fin d'utilisation; les exemples commentés peuvent être utilisés de la manière suivante : Chaine d'initialisation 2 : Chaine d'initialisation 3 : Il semble que le modem a changé.\n
C'était '${wvMODEM}', et maintenant c'est '${newMODEM}'\n
Voulez-vous actualiser PupDial?\n
Il est recommandé de cliquer sur ACTUALISER ... Il semble que vous ayez un modem au port ${MYDEVM}\n
Cependant, il est recommandé de cliquer sur le bouton 'TESTER'\n
pour voir s'il fonctionne.\n
\n
Note 1: Le test examinera aussi, éventuellement, ce qu'on appelle une\n
'chaine d'initialisation'. Si vous utilisez PupDial pour la première fois\n
ou si vous avez changé de modem, vous devrez cliquer sur le bouton\n
'TESTER' pour obtenir une chaîne d'initialisation.\n
Note 2: Si vous pensez que  ${MYDEVM} n'est pas le bon modem, cliquez\n
sur le bouton 'Non' et la fenêtre principale de PupDial vous permettra de\n
tester les interfaces des modems de remplacement avec le bouton 'CHOISIR'.\n
\n
Il est recommandé de cliquer sur TESTER' pour tester le modem ... Assurez-vous que cette case est cochée pour tenter une reconnexion automatique Vitesse max. : Modem Internet à numérotation Modem détecté! Interface du périphérique : Paramètres du modem Paramètres du modem AVIS: Si le journal montre un échec de connexion, cliquer sur le bouton gauche Non Uniquement pour des connexions 3G ou par téléphone cellulaire/mobile Mot de passe Numéro de téléphone PupDial - Connexion Internet par modem analogique ou modem sans fil numérique (3g) Modem Internet à numérotation - PupDial PupDial: Journal de connexion de WvDial PupDial: le modem a été modifié PupDial: un modem a été trouvé Quitter L A N C E R   W V D I A L Lecture du fichier de configuration du modem ... Il est recommandé de cocher cette case si vous utilisez un modem 3 G Interface du périphérique modem choisie : Chaine pour l'initialisation du modem Mode Stupide TESTER Pourquoi cette question?, Parce qu'un modem interne a pu être détecté au démarrage, mais un modem externe 'branché à chaud' n'a peut-être pas été détecté s'il a été branché après le démarrage. Ainsi, si par exemple, vous avez à la fois, un modem RTC analogique interne et un modem USB, PupDial peut avoir choisi le mauvais - En cochant ou décochant cette case, cela évitera la confusion ... Cette documentation a deux chapitres :\n1. Exécuter wvdial\n2. Configurer wvdial Cochez ici pour un modem externe Pour forcer seulement 2G ou 3G, décommenter la ligne Init4 et ajouter 0 (2G) ou 2 (3G), et remplacer MYOPS par le nom de votre opérateur. Pour forcer la qualité du niveau de service 3G , décommenter les lignes init6/Init7 et définir la valeur de deux places chaque, pour 384k/144k/64k, en omettant \"k\" (e.g., =1,4,64,384,64,384). Pour lister tous les APN stockés dans le modem, décommenter la ligne Init8; vérifier le journal d'état de connexion pour les lignes commençant par +CGDCONT:. Pour répertorier l'identifiant de l'opérateur stocké dans le modem, décommenter la ligne Init9; vérifier le journal d'état de connexion pour la ligne commençant par +COPS: ACTUALISER Nom d'utilisateur Aucun modem détecté! Vous ne pouvez pas numéroter! Bienvenue à PupDial, écrit par Barry Kauler, avec les
contributions de Richard Erwin.

Un modem N'A PAS ÉTÉ DÉTECTÉ AUTOMATIQUEMENT, vous devez donc
CLIQUER SUR LE BOUTON 'Choisir un modem'. Faites-le MAINTENANT! Bienvenue à PupDial, écrit par Barry Kauler avec les
contributions de Richard Erwin.

Le fichier de configuration, /etc/wvdial.conf, est lu par PupDial. 
Les changements effectués dans chaque boite ci-dessus seront sauvés 
dans wvdial.conf quand vous cliquerez sur les boutons 'Quitter' ou
'Connexion'. N.B. vous pouvez aussi modifier wvdial.conf à la main.

Si vous utilisez Pupdial pour la première fois, il est recommandé de cliquer
sur les boutons d'Aide, plus particulièrement 'Paramètres du modem'. Bienvenue! Question fondamentale: voulez-vous vous connecter à Internet avec un modem interne fixe ou amovible (USB, série, PCMCIA)? Sans fil :   APN : Oui 