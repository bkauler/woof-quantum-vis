��    $      <  5   \      0  �  1  5  �  `   �  f   M  (  �  c   �  �   A  �   	  �   �	  �   �
  f   @  P   �  
   �                  &   2  "   Y  .   |     �     �     �     �  3   �  6   $  	   [     e  :   l     �     �  �  �    h     t     |  $   �  Q  �  �  �  <  �  e   �  v   -  ,  �  s   �  �   E    ;  �   @  �   �  s   �  T   +     �     �     �     �  <   �  0   �  /   ,     \     q  6   u  !   �  6   �  G        M  	   U  O   _     �     �  �  �  5  �  	   �      �   8   �      "                                          
                                               	                                                             $         !      #          

     OK, sound driver is configured.

                  ALSA  WIZARD
          will prepare the card for playing now.

Technical: "/etc/init.d/alsa start" will be used to
           initialise ALSA, amixer used to raise volume.

     You can change the volume later via a mixer
     program such as Retrovol (Multimedia menu), or
     click on speaker icon in tray for volume slider.
   
                   ALSA  WIZARD
                   version %s

            This Wizard is a configurator for
    Advanced Linux Sound Architecture (ALSA) driver.
       (with some modifications for Puppy Linux)

  If any are running, you should close all sound
  apps now (like Mplayer, mhWaveEdit, etc.).
   
         Following card(s) are found on your system.
         Choose a soundcard to configure:
 
        No supported PnP or PCI card found.

 Would you like to probe legacy ISA sound cards/chips?

 
       The mixer is set up now for for playing.
       Shall I try to play a sound sample now?

                           NOTE:
If you have a big amplifier, lower your volumes or say no.
    Otherwise check that your speaker volume is wound up,
         then select <Yes> to play test sound...
 
   Probing legacy ISA cards might make
   your system unstable.

        Do you want to proceed?

 
 Looks like you having a Dell Dimension machine.
 On this machine, CS4232 driver should be used
 although CS46xx chip is detected.

 Shall I try to snd-cs4232 driver and probe
 the legacy ISA configuration? 
 Looks like you having a Thinkpad 600E or 770 notebook.
 On this notebook, CS4236 driver should be used
 although CS46xx chip is detected.

 Shall I try to snd-cs4236 driver and probe
 the legacy ISA configuration? 
 Shall I try all possible DMA and IRQ combinations?
 With this option, some unconventional configuration
 might be found, but it will take much longer time. 
===============================================================================

 Now ALSA is ready to use.
 For adjustment of volumes, use your favorite mixer.

 Have a lot of fun!

 
Configuring %s
PLEASE ANSWER YES HERE SO PUPPY WILL USE DRIVER ON NEXT BOOT
Do you want to modify %s?            Probing legacy ISA cards

        Please select the drivers to probe:  : FOUND!! -s ALSA Sound Wizard: NOTICE ALSA configurator Building card database, please wait... Can't create temp file, exiting... Do you want to continue and run the Wizard?... Driver Selection No No card database is found. No legacy cards found No legacy drivers are available
   for your machine Probing legacy cards..   This may take a few minutes.. Probing:  Result Saving the mixer setup used for this in /etc/asound.state. Searching sound cards Soundcard Selection The ALSA Wizard unloads any sound drivers and then starts again.
This causes a problem if you decide to exit anywhere before the
Wizard has gone right to the end -- if you previously had working
sound, it will then not be working -- but a reboot will fix it.
Also, unloading of the audio drivers may affect some dialup modems,
and they may not work after running this Wizard -- again, a reboot
will fix it. This computer has very little RAM, perhaps not enough to run the "depmod" utility (which the ALSA Wizard needs to run). Shutdown first, to create a save-file for the session, and you may then have enough working memory at the next boot. Click button to exit Wizard... WARNING Yes You must be root to use this script. Project-Id-Version: quirky-150
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2011-04-21 19:59+0300
PO-Revision-Date: 2014-12-23 08:23+0100
Last-Translator: ASRI
Language-Team: French
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
X-Generator: Poedit 1.5.4
 

       Le gestionnaire de son est configuré.

                L'ASSISTANT ALSA
      va préparer la carte pour fonctionner.

Technique: "/etc/init.d/alsa start" sera utilisé pour
   initialiser ALSA, amixer pour augmenter le volume.

   Vous modifierez le volume plus tard avec un programme
	de mixage comme Retrovol (menu Multimédia), ou
   d'un clic sur l'icône HP dans la barre des tâches.
  
                   ASSISTANT ALSA
                   version %s

    Cet assistant sert pour configurer le pilote
    Advanced Linux Sound Architecture (ALSA).
    (avec quelques modifications pour Puppy Linux)

  Fermez toutes les applications utilisant du son,
  actuellement actives , (Mplayer, mhWaveEdit, etc.) 
       Les cartes suivantes ont été trouvées,
       choisissez une carte audio à configurer :.
 
      Aucune carte PnP ou PCI supportée n'a été trouvée.

       Voulez vous chercher une puce/carte audio ISA?

 
      Le mixeur est configuré pour fonctionner.
      Voulez-vous un essai de son maintenant?

                           NOTE:
	Si vous avez un ampli puissant, baissez le volume.
    ou cliquez sur No. Ou vérifiez que le volume du HP
        est bas, puis cliquez sur Yes pour un essai de son...
 
  L'examen des cartes ISA génériques peut
  		rendre votre système instable.

        Voulez-vous poursuivre?

 
 Il semble que vous possédiez un Dell Dimension.
 Sur cette machine, le pilote CS4232 devrait être utilisé
 bien que ce soit la puce CS46xx qui est détectée.

Doit-on essayer le pilote snd-cs4232 et tester
la configuration générique ISA? 
 Il semble que vous possédiez un portable Thinkpad 600E ou 770.
 Sur ce portable, le pilote CS4236 devrait être utilisé
 bien que ce soit la puce CS46xx qui est détectée.

 Doit-on essayer le pilote snd-cs4236 et tester
 la configuration générique ISA? 
 Essayer toutes les combinaisons DMA et IRQ possible?
 Par cette option, une config. non conventionnelle
 peut être découverte, mais ça va prendre du temps. 
===============================================================================

ALSA est maintenant prêt pour son utilisation.
Pour ajuster le volume, utilisez votre mixeur favori.

Et maintenant ECLATEZ-VOUS!
 
Configuration de %s
REPONDEZ OUI ICI, ET TOUTOU UTILISERA LE PILOTE AU PROCHAIN DEMARRAGE
Voulez-vous modifier %s?        Examen des cartes ISA génériques

      Choisissez les pilotes à examiner:  : TROUVE!! -s Assistant audio ALSA : AVIS Configuration ALSA Construction de la base de données des cartes, patientez... Impossible de créer le fichier temp, abandon... Voulez-vous continuer et lancer l'Assistant?... Sélection du pilote Non Aucune base de données des cartes n'a été trouvée. Aucune carte générique trouvée Aucun pilote générique valable
   pour votre machine Examen des cartes génériques... Cela peut prendre quelques minutes... Examen: Résultat La sauvegarde de configuration du mixeur est dans le fichier /etc/asound.state. Recherche des cartes audio Choix des cartes audio L'Assistant ALSA décharge n'importe quel pilote audio puis redémarre.
Cela crée un problème si vous décidez de quitter avant que l'assistant 
n'ait terminé -- si vous aviez eu du son auparavant, vous n'en aurez plus 
-- mais un redémarrage arrangera tout.
Egalement, décharger un pilote audio peut affecter certains modems à 
numérotation, et ils pourraient ne pas fonctionner après avoir utilisé cet
Assistant -- un redémarrage arrangera tout également. Ce PC a vraiment peu de RAM, peut-être pas suffisamment pour lancer l'utilitaire 'depmod' (dont l'assistant ALSA a besoin). D'abord  fermez cette session pour créer un fichier de sauvegarde, vous aurez alors suffisament de mémoire au prochain démarrage. Cliquez sur le bouton pour quitter cet assistant... ATTENTION Oui Vous devez être administrateur pour utiliser ce script. 