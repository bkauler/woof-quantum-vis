��    F      L  a   |         �     �  �    `	  �  i    N  	  b  �  l     d     v  1   �  M  �  B     =   U  E   �     �  G   �  Z   @  b   �  ?   �  -   >      l  A   �  M   �          &     +     A  2   F  7   y  6   �  
   �     �        	     
     
        %  *   *     U     Z     s          �     �  	   �  A   �  m     
   o     z  2   �  N   �       /     3   E     y     �     �     �     �  +   �  ,   �  ,   *  !   W  !   y     �     �  $   �  &   �       3  0  �   d  �  /  �  "  7  �$  -  �'  M  *  -  _,     �-  !   �-  /   �-  {  �-  S   t/  S   �/  [   0  %   x0  h   �0  d   1  l   l1  K   �1  F   %2  <   l2  J   �2  R   �2     G3     Y3     i3     �3  6   �3  D   �3  P   4     T4     b4     |4     �4     �4     �4     �4  "   �4     �4      �4     5     +5     :5     Y5     j5     x5  �   �5     *6     @6  K   N6  V   �6     �6  /   �6  N   '7     v7  !   �7     �7  	   �7     �7  6   �7  9   �7  9   28  -   l8  2   �8  *   �8     �8  5   9  :   M9     �9        +          ,   :   .       %              6                       B             A                      '   9      7      "              3   F   &       D       $   E   4                 >      
   ;   0   #       (      2   <      -   *             )   8       =   @   5   /                                        	       C   ?   1      !                


Playback: 

1. For Playback, you need to turn up the PCM device volume and at least the Master device volume. Note that key 'M' is also used to Mute devices.
 

4. For Microphone recording, you should also activate Mic as the capture device. If using alsamixer, use space bar to activate the desired capture device.

You often need to turn up the amplitude setting of the Capture device to around maximum, but be careful you do not unwittingly turn up the Playback Mic volume (which you should inactivate) rather than the Capture one. Otherwise you may end up recording sound fed back to your mic from your blaring speakers! If using alsamixer, pressing the Tab key, such that you come to the alsamixer Capture window, before setting capture devices, may help you to avoid unnecessarily increasing the playback amplitude controls rather than the record ones.
 

5. As an alternative to recording from the microphone, you could select some other device to capture from (e.g. Line in). If you select Mix as the capture device (or perhaps Mono Mix, depending on what your sound card provides) you can record most any sound passing through your sound card (for example: streaming radio as in 01micko pupRadio program).

6. For audio Playback to work, you need to turn up the PCM device volume and at least the Master device volume. Note that key M is also used to Mute devices.
-----
 

Commandline Arguments:

rec target_directory outfile [duration] : record to outfile.
pauserec : pause/continue recording (toggle).  
stoprec : stop recording.
play target_directory infile [duration] : play infile.
pauseplay : pause/continue playback (toggle).
stopplay : stop playback.
quit : clean up all and quit program.
--help : this brief usage help.
-? : this brief usage help.
- : read arguments from stdin (e.g. pipe)

If no options are entered the precord GUI
will start.\n 
-----
Precord Plugins:

Version 6.0.0 and above provides a revolutionary (!) slave application 'plugin' facility (one per main precord function). The facility allows precord to start up and shutdown virtually any application or script in response to precord button presses. For information on usage of slave plugins, read READMEplayslavedemo.txt. A copy of that is provided in hidden directory .pcreole in your home directory.
-----
Tips:

To keep Precord as the top window, right-click on its window bar, and select 
Layer -> Top 
-----
Section C: Alsa setup

Recording:

1. For louder microphone recordings: 

   Press MIXER button to bring up audio mixer and the VU meter. Activate Mic boost. Using it greatly boosts your microphone sound recording level.
   
   If using alsamixer to do this, use the cursor keys, move far over to the right hand side of the alsamixer window, and keep going right (often off the edge of the window). Around that location you may (or should?) find the 'Mic Boost' control (keyboard key 'M' toggles its activation).

 
Section D.

Pscheduler:

If Pscheduler is available, you can Add (or Edit) Task(s) of the form 

  precord rec target_directory outfile [duration]

to schedule when a recording session should start.

You can schedule any of the commands described by:
precord --help

Note: Be careful with timed recordings. Once Pschedule is called up by precord, Pschedule will by default automatically make recordings every minute if you do not put in any values or fail to cancel the Pschedule entry properly.
-----
 0 = no time limit AUDIO RECORD CONFIGURATION: Advanced User Interface and Precord configuration After you have configure precord 
via the GUI, you can also control it
from the commandline using:

precord [option] [path to file] [file] [duration]

where [duration] is a time limit for the record
capture or play process:
 
0 or blank means no time limit;
entering no duration results in use of
duration pre-configured for record.
 Auto generated date-stamped file name YearMonthDayHourMinuteSecond Browse and select the target directory for the file to record Browse and select the target directory for the file to record or play Browse for SOURCE File to play Browse, drag and drop, copy and paste, or type name of the file to play Browse, drag and drop, copy and paste, or type the target directory for the file to record Browse, drag and drop, copy and paste, or type the target directory for the file to record or play Click this checkbox for date-stamped record to chosen directory Copy Date-stamped Record entry to Play entry2 Copy Record entry to Play entry1 Drag and drop, copy and paste, or type name of the file to record Drag and drop, copy and paste, or type the name of the file to record or play Duration File General Configuration Help If you soundcard is not card 0 click this checkbox If you soundcard is not subdevice 0 click this checkbox Opens Rox filemanager at target directory of recording PAUSE play PAUSE record PLAY PLAY File PLAY File1 PLAY File2 Play Pop up MIXER, VU display and video preview QUIT RECORD Date-stamped file RECORD File Record Return to Small GUI Run Pschedule task on time STOP play STOP record. If no record in process, pop up MIXER and VU display Section A. Commandline usage:

In a console enter command:
precord --help
for brief commandline usage.
-----
 Setup Help Target Directory Tick checkbox beside filename for datestamp record audio quality for: mp3 vbr, aac_q or ogg_q; compression_level for flac (N1=12) channel mp3, ogg, wav, acc and flac recorder and player sample rate for wav; bitrate for mp3, aac or ogg_mm select audio format select for stereo recording select mp3 mode select soundcard stereo use Average Bit Rate mode when mp3 encoding use Constant Bit Rate mode when mp3 encoding use Variable Bit Rate mode when mp3 encoding use aac bitrate mode encoder type use aac quality mode encoder type use flac lossless encoder type use mp3 encoder type use ogg managed maximum encoder type use ogg unmanaged quality encoder type use wav encoder type Project-Id-Version: precord VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2013-01-01 12:29+0100
Last-Translator: root <jj@moulinier.net>
Language-Team: French
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 


Lecture: 

1. Pour la lecture, vous avez besoin de monter le volume de PCM et au moins le volume Principal (Master). Notez que la touche 'M' est aussi utilisée pour désactiver les périphériques.
 

2. Pour enregistrer à partir du microphone, vous devez aussi activer le périphérique de capture 'Mic' (barre espace pour activer) et parfois/souvent?) le périphérique générique  appelé 'Capture'.

3. Vous devez régler le plus haut possible le périphérique utilisé pour 'Capture'. Mais faites attention de ne pas augmenter le volume de lecture plus haut que celui de capture 'Mic' sans le vouloir, vous risqueriez avoir un    effet retour dans les haut-parleurs très inconfortable! Si vous utilisez AlsaMixer, en appuyant sur la touche 'tabulation' (comme pour la fenêtre alsamixer pour la 'capture'), ça peut vous aider  à éviter d'augmenter inutilement le volume de la lecture plutôt que celui de l' enregistrement.
 

4. Comme alternative à l'enregistrement depuis le micro, vous pourrait choisir un autre périphérique d'entrée (par exemple, 'Line in'). Si vous sélectionnez 'Mix' (ou peut-être 'Mono Mix') en tant que périphérique de capture vous pourrez enregistrer presque tout ce qui passe par votre carte son (par exemple: des flux radio).

5. Pour que la lecture fonctionne, vous devez activer et lancer PCM ainsi que votre contrôle de volume principal.

6. Vous pourrez voir dans la fenêtre d'affichage VU si (et quand) votre réglage son est correctement configuré (mais désactivez l'affichage VU avant d'enregistrer sinon vous aurez un enregistrement blanc!).
 

Arguments de ligne de commande :

rec outfile [duration] : enregistrer hors fichier.
pauserec : faire une pause/continuer l'enregistrement (alternativement).
stoprec : arréter l'enregistrement après un bref délai.
play target_directory infile [duration] : lire dans le fichier.
stoprecnow : arréter l'enregistrement immédiatement.
play infile [duration] : lire dans fichier.
pauseplay : faire une pause/continuer la lecture (alternativement).
stopplay : arréter la lecture.
quit : tout vider et quitter le programme.
--help : ce court texte d'aide.
-? : ce court texte d'aide.
-v : numéro de version de precord.
- : read arguments from stdin (e.g. pipe)

Precord conserve automatiquement le
suivi du processus ID en cours d'exécution.

Si aucune option n'est entrée l'Interface
Graphique de Precord se lancera.\n 
-----
Plugins de Precord:

La version 6.0.0 et supérieures offre une application esclave(!) révolutionnaire 'plugin' (une par fonction principale de Precord ). Cela permet à Precord de lancer et arréter pratiquement n'importe quelle application ou script en fonction des actions sur les boutons de Precord. Pour plus d'informations sur l'utilisation des plugins esclave, lisez /usr/share/precord/READMEplayslavedemo.txt.
-----
Conseils:

Pour garder Precord apparent en permanence, cliquez-droit sur sa barre de titre, et sélectionnez 
 'Layer' -> Top 
-----
Section C: Configurer Alsa

Enregistrement :

1. Pour des enregistrements  plus fort avec le microphone: 

   Pressez le bouton MIXER pour afficher alsamixer et le VU-mètre. Activez Mic boost, son utilisation augmente considérablement le niveau d'enregistrement du micro.
   
	Si vous utilisez AlsaMixer, à l'aide des touches du curseur, déplacez-vous le plus possible vers le côté droit de la fenêtre d'Alsamixer (en principe à l'extrémité droite de la fenêtre), vous devriez trouver le contrôle 'Mic Boost'. Pressez la touche du clavier 'M' pour activer 'Mic Boost'.

 
-----
Section B: Programmation

Si Pschedule est disponible, vous pouvez ajouter (ou éditer) une(des) tâche(s) sous la forme

  precord rec outfile.mp3 [durée]

pour programmer le début d'une session d'enregistrement.

Vous pouvez programmer chacune des commandes décrites dans : precord --help
 0 = sans limite de temps CONFIGURATION DE L'ENREGISTREMENT Interface Utilisateur Avancée et Configuration Après avoir configuré Precord via 
l'interface graphique, vous pouvez aussi le
contrôler en ligne de commande en utilisant :

precord [option] [[chemin du fichier] [fichier] [durée]

où [durée] est un délai fixé pour
l'enregistrement ou la lecture :

0 signifie sans limite;
entrer aucune durée entraine l'utilisation d'une
durée préconfigurée pour l'enregistrement.
 Nom de fichier automatiquement généré horodaté AnnéeMoisJourHeureMinuteSeconde Rechercher et sélectionner le répertoire de destination du fichier à enregistrer Rechercher et sélectionner le répertoire de destination du fichier à enregistrer ou lire Rechercher le fichier SOURCE à jouer Rechercher, glisser/déposer, copier et coller, ou taper le nom (y compris le chemin) du fichier à lire Rechercher, glisser-déposer, copier-coller, ou tapez le répertoire cible du fichier à enregistrer Recherchez, glissez-déposez, copiez-collez, ou tapez le répertoire cible du fichier à enregistrer ou lire Cliquez la case pour horodater un enregistrement dans le répertoire choisi Copier une Entrée Enregistrement horodaté vers une Entrée Lecture 2 Copier une Entrée Enregistrement vers une Entrée Lecture 1 Glisser-déposer, copier-coller, ou tapez le nom du fichier à enregistrer Glissez-déposez, copiez-collez, ou tapez le nom du fichier à enregistrer ou lire Durée (secondes) LIRE le fichier Configuration Générale Aide Si votre carte son n'est pas la carte 0 cochez la case Si votre carte son n'est pas le sous-périphérique 0 cochez la case Ouvre le gestionnaire de fichiers ROX dans le répertoire cible d'enregistrement PAUSE lecture PAUSE de l'enregistrement LIRE le fichier LIRE le fichier Lire le fichier 1 Lire le fichier 2 Lecture Afficher les fenêtres MIXER et VU QUITTER ENREGISTRER un fichier horodaté ENREGISTRER le fichier Enregistrement Retour à l'Interface Minimale Lancer Pschedule ARRET lecture ARRET de l'enregistrement Section A: Utilisation de la ligne de commande

Dans une console entrez la commande : precord --help
pour une utilisation brève en ligne de commande.
 Aide de configuration Dossier cible Cliquez la case pour horodater un enregistrement dans le répertoire choisi Qualité audio pour : mp3 vbr, aac_q ou ogg_q; niveau de compression pour flac (N1=12) Canal Enregistreur/lecteur mp3, ogg, wav, acc et flac Fréquence d'échantillonnage pour wav, débit binaire pour mp3, aac ou ogg_mm Format audio Choisir l'enregistrement stéréo Mode mp3 Carte son stéréo utiliser un mode de débit binaire moyen en codage mp3 utiliser un mode de débit binaire constant en codage mp3 utiliser un mode de débit binaire variable en codage mp3 utiliser un type de codage en mode débit aac utiliser un type de codage en mode de qualité aac utiliser un type de codage sans perte FLAC utiliser un type de codage mp3 utiliser un type de codage ogg géré en mode maximum utiliser un type de codage ogg en mode qualité non géré utiliser un type de codage wav 