��    
      l      �       �   a   �      S     e  ^   x  �   �     �     �  0   �  ]  �  <  +  Z   h     �     �  ]   �  �   Q  
   !     ,  C   4  �  x               
                          	    <b>When Xsane starts, your scanner (if it is connected and turned on) should be autodetected.</b> About SCSI drives Frontend for Xsane However, some entries in the drivers list (/etc/sane.d/dll.conf) are commented-out. These are: If your scanner is one of these, then Xsane will not auto-detect it.
-- in that case, click 'QUIT' button and open 'dll.conf' in a text
   editor and uncomment the appropriate entry. Parallel Quit To continue and run Xsane, answer this question: Xsane may be a bit 'insane' when detecting a SCSI scanner. There are various things that you may have to do:
1. Run 'sane-find-scanner' in a terminal window.
2. Make sure 'sg' module is loaded.
3. Specify the device on the commandline,
   ex: <b># xsane microtek2:/dev/sg3</b>
4. or maybe a symbolic link,
   ex: <b># ln -s /dev/sg3 /dev/scanner</b> Project-Id-Version: xsaneshell VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2014-12-10 16:05+0100
Last-Translator: esmourguit <jj@moulinier.net>
Language-Team: French
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 <b>Au lancement de Xsane, votre scanner sera détecté, s'il est connecté et allumé.</b> À propos des disques SCSI Interface pour Xsane Certaines entrées dans le fichier «/etc/sane.d/dll.conf» sont «commentées». Les voici : Si votre scanner y figure, alors Xsane ne le détectera pas. - Dans ce cas, cliquez sur «Quitter» et ouvrez le fichier «/etc/sane.d/dll.conf» dans un éditeur de texte et supprimez l'entrée appropriée. Parallèle Quitter Pour continuer et lancer Xsane, veuillez choisir le type de scanner Xsane peut être un peu «foufou» lors de la détection d'un scanner SCSI. Voici plusieurs choses que vous pourriez avoir à faire :
1. Lancer «sane-find-scanner» dans un terminal.
2. Vous assurer que le module «sg» est chargé.
3. Spécifier l'appareil sur la ligne de commande,
   Ex: <b># xsane microtek2 : /dev/sg3</b>
4. ou peut-être un lien symbolique,
   Ex : <b># ln -s /dev/sg3 /dev/scanner</b> 