��    X      �     �      �  4   �  ?   �  ,       ;	     R	     b	  "   	  &   �	     �	     �	  !   
     &
     <
     V
     u
     �
  �   �
  @   >  <        �  �   �  N   �  N     P   ]  *   �     �     �     �  #     !   '  )   I  '   s  %   �     �     �     �     �  ?   �     9  )   B  $   l  H   �     �  :   �       .   6     e  9   j  -   �     �  M   �  6   3  �   j  �   �  �  �  {    9   �     �     �  3   �  :        Y    n  $   �  -   �  �  �     �  0   �  1        >  4   Q  .   �     �  4   �  	   �  �     �   �  �   <  6   *  �   a  �  �  �   �"  9   �#  Y  �#     J%  ?   N%     �%  C  �%  P   �&  >   1'  ^  p'     �(     �(     �(     )     1)     Q)     p)      �)     �)  "   �)      �)     
*     *  �   6*  N   �*  J   -+     x+    �+  U   �,  U   �,  ^   G-  1   �-     �-     �-     �-  2   	.  2   <.  9   o.  3   �.  3   �.     /     "/     0/     B/  V   S/     �/  (   �/  )   �/  J   0     O0  J   W0  .   �0  9   �0     1  9   1  -   K1     y1  a   �1  ;   �1  �   (2  �   �2  �  o3  �  5  H   �6  "   �6     "7  6   '7  J   ^7  !   �7  3  �7  2   �8  1   29  ^  d9     �<  %   �<  C   �<     ?=  7   R=  ,   �=     �=  D   �=     >  �   >  �   �>    ^?  ?   y@  �   �@  N  qA  �   �E  5   �F  v  �F     mH  0   pH     �H           S      L   @      C          *           3       K              B   ;   N       1   P   I   (      >           9   R                %           T   &       7   -       ?   .   U           V         0          6   /   O                 =   W   8   M       H       <   4   X       :      D      ,          	   #                                                 '       2   )   J      +                   F   Q      5   !   
   E              "           $          A   G             (see fsresize doc page how to restore f.s.)          Changes have been backed up in /tmp/fsresizebackup.dat $SOURCEPART will be copied to $DESTPART.gz, compressed with gzip.
Compression may be greatly improved if the unused part of $SOURCEPART
is zeroised. This involves temporarily mounting it on /mnt/tmp,
writing zeroes to the unused areas, then unmounting it.
Would you like to do this size optimisation? ${TITLE} choose remote ${TITLE}: ERROR ${TITLE}: choose destination ${TITLE}: choose destination drive ${TITLE}: choose destination partition ${TITLE}: choose source drive ${TITLE}: choose source file ${TITLE}: choose source partition ${TITLE}: final check ${TITLE}: grow filesystem ${TITLE}: optimise compression ${TITLE}: probe ZIP ${TITLE}: run fdisk ${WARNING1}WARNING2: $SOURCEPART file has been uncompressed as $UNCOMPRPATHNAME.
          Pudd will delete it, but aborting before completion may prevent this. ...HOWEVER, Puppy detects an error probing the USB partitions!!! ...HOWEVER, Puppy detects an error probing the partitions!!! ...done ...for a destination partition, make sure that it is at least as big as the source.
...for a destination file, make sure that the mounted partition where it will reside
   has enough free space. A summary of the space in the local mounted partitions: ...if USB partitions are missing or incorrect, click the "Probe USB" button... ...if ZIP partitions are missing or incorrect, click the "Probe ZIP" button... ...if floppy disk partition missing or incorrect, click "Probe FLOPPY" button... Backup finished. Press ENTER key to exit:  Choose drive Choose file Choose partition Choose the drive to be copied from: Choose the drive to be copied to: Choose the drive to be examined by fdisk: Choose the partition to be copied from: Choose the partition to be copied to: Choose_drive Choose_file Choose_partition Choose_remote Click on "Run_fdisk" button to create/edit/delete partitions... Continue DO THAT RIGHT NOW, THEN PRESS ENTER KEY:  ERROR, $REMOTEADDR IS NOT REACHABLE! ERROR: Puppy experienced a problem trying to unmount partition ${CATERR} EXIT Error uncompressing ${SOURCEPART}. Click button to quit... First check and fix f.s.... For a large partition, this may take awhile... HELP Here is what Puppy knows about ${DESTPART} ${DESTCHOICE}: Here is what Puppy knows about ${SOURCEPART}: IDE (internal) ZIP If all is well, click a button to choose source drive/partition/image-file... If everything looks ok, click the "Continue" button... If no need to run fdisk, click a button to choose destination...
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
    that is, there is only one filesystem that occupies the entire drive). Parallel port ZIP Please choose what type of ZIP drive you have... Pudd: new or choose existing (replace) dest. file Puppy universal dd Read error, starting again and will ignore errors... Read error, starting again, ignoring errors... Remote address: Resizing $4 filesystem to fill $3 Kbyte partition... Run_fdisk Sorry, the destination drive is too small. The source 
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
POT-Creation-Date: 2014-02-22 09:36+0100
PO-Revision-Date: 2014-02-221 11:29+0100
Last-Translator: root <root@localhost>
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
          (siehe Doku-Seite zu fsresize, wie man ein Dateisystem wiederherstellt)          Änderungen sind backed up in /tmp/fsresizebackup.dat $SOURCEPART wird, komprimiert mit gzip, auf $DESTPART.gz kopiert.
Kompression kann großartig verbessert werden, falls der unbenutzte Teil von 
$SOURCEPART genullt wird. Dies umfasst temporäres Einhängen auf /mnt/tmp,
Schreiben von Nullen in die unbenutzten Bereiche, dann wieder Aushängen.
Soll diese Optimierung zur Größe jetzt gemacht werden? ${TITLE}: entfernt wählen ${TITLE}: FEHLER ${TITLE}: Ziel wählen ${TITLE}: Ziellaufwerk wählen ${TITLE}: Zielpartition wählen ${TITLE}: Quellaufwerk wählen ${TITLE}: Quelldatei wählen ${TITLE}: Quellpartition wählen ${TITLE}: finaler Check ${TITLE}: Dateisystem vergrößern ${TITLE}: Kompression optimieren ${TITLE}: probe ZIP ${TITLE}: fdisk starten ${WARNING1}WARNING2: Datei $SOURCEPART wurde dekomprimiert als $UNCOMPRPATHNAME.
          Pudd wird sie löschen, aber abbrechen vor beenden kann das verhindern this. ...JEDOCH hat Puppy einen Fehler beim Erproben der USB-Partitionen entdeckt!!! ...JEDOCH hat Puppy einen Fehler beim Erproben der Partitionen entdeckt!!! ...getan ...für eine Zielpartition sicherstellen, dass sie mindestens so groß ist wie die Quelle.
...für eine Zieldatei sicherstellen, dass die eingehängte Partition, wo die Datei hin soll
   genug freien Speicherplatz hat. Eine Zusammenfassung für die lokal eingehängten Partitionen: ...falls USB-Partitionen fehlen oder falsch sind, den Button "Probe USB" anklicken... ...falls ZIP-Partitionen fehlen oder falsch sind, den Button "Probe ZIP" anklicken... ...falls Disketten-Partitionen fehlen oder falsch sind, den Button "Probe FLOPPY" anklicken... Backup fertig. Enter-Taste drücken zum Beenden:  Laufwerk wählen Datei wählen Partition wählen das Laufwerk, von dem kopiert werden soll, wählen das Laufwerk, auf das kopiert werden soll, wählen das Laufwerk, das von fdisk geprüft werden soll, wählen die Partition, von der kopiert werden soll, wählen die Partition, auf die kopiert werden soll, wählen Laufwerk wählen Datei wählen Partition wählen Entfernt_wählen Auf Button "fdisk_starten" klicken zum Erzeugen/Bearbeiten/Löschen von Partitionen... Weiter JETZT SOFORT, dann Enter-Taste drücken: FEHLER, $REMOTEADDR IST NICHT ERREICHBAR! ERROR: Puppy hatte Probleme beim Versuch, Partition ${CATERR} auszuhängen BEENDEN Fehler bei Dekomprimieren von ${SOURCEPART}. Button klicken zum Beenden... Zuerst Check und Korrektur des Dateisystems... Bei einer großen Partition kann das eine Weile dauern... HILFE Hier ist was Puppy über ${DESTPART} ${DESTCHOICE} weiß: Hier ist was Puppy über ${SOURCEPART} weiß: IDE (intere) ZIP Wenn alles gut ist, einen Button klicken zur Auswahl von Quellaufwerk, -partition, -Imagedatei... Falls alles gut ausschaut, den Button "Weiter" anklicken... Falls kein Bedarf an fdisk besteht, mittels Button ein Ziel wählen...
(Hinweis: Falls Ziel nicht auf diesem PC ist, Button "Entfernt_wählen" klicken)... Falls das Ziel ein Laufwerk/Partition ist, muss es mindestens so groß sein wie das 
Quell-Laufwerk/Partition -- Pudd wird ein paar Infos dazu im nächsten Fenster zeigen. Falls das Ziel eine Datei ist, wird mit dem Programm "gzip" komprimiert. Das
bedeutet, dass die Datei ungefähr die halbe Größe des Quell-Laufwerks/Partition haben
 wird. Obwohl die Zieldatei komprimiert ist, muß man sie noch dekomprimieren, falls 
man sie jemals als loopback einhängen will, und Pudd wird sie auch dekomprimieren,
falls sie auf ein anderes Laufwerk/Partition kopiert werden soll. Falls das Ziel ein Laufwerk/Partition ist, wird Pudd anbieten, das Dateisystem zu 
vergrößern, um die Partition zu füllen. Dies geschieht jedoch nur, wenn die Quellpartition
ein ext2, ext3, ext4, oder fat12/16/32 (auch msdos oder vfat genannt) Dateisystem ist.
(HINWEIS: Zieldateisystem spielt keine Rolle, da es überschrieben wird)
(WARNUNG: Vergrößerungs-Code für fat ist noch nicht ausgereift. Nicht für kritisches benutzen!) Den NETCAT LISTENER auf dem ENTFERNTEN PC töten, und IHN WIEDER starten Letzte Möglichkeit zum aufhören! Nein Jetzt wird $2 auf $1 kopiert, bitte geduldig warten... Jetzt wird $2 auf den entfernten PC kopiert, bitte sehr geduldig warten... Jetzt Dateisystem vergrößern... Jetzt die Wahl des Ziels. Dieses Pudd-Programm wird zuerst versuchen, das "dd"
Programm im normalen Modus zu benutzen, aber falls die Quelle einen Fehler hat, wird abgebrochen.
Pudd wird dann einen anderen Modus von dd versuchen, der Lese-Fehler ignoriert, was bedeutet
dass das Ziel auch Fehler haben wird. Jetzt werden unbenutzte Bereiche von $2 genullt... Ok, ${SOURCEPART} ist als Quellpartition gewählt Okay, alls erstes eine Entscheidung zur Quelle:
 1. Falls die Quelle eine Datei ist, muss es ein komplettes Dateisystem sein, wie von  einem 
    vorherigen Gebrauch von Pudd zum Kopieren einer Partition oder Laufwerk auf eine Datei  --
    solch eine "Datei" ist nicht wie eine gewöhnliche Text- oder Grafik-Datei, es ist ein     Abbild einer Partition  oder kompletten Laufwerks.
    Eine Image-Datei kann auf Partition oder Laufwerk kopiert werden, eine ordinäre Datei nicht.
 2. Falls die Quelle ein Laufwerk ist, z.B. /dev/sda, wird das ganze Laufwerk kopiert. Falls jedoch
    die Quelle eine Partition ist, z.B. /dev/sda1, dann wird nur kopiert (sda1, sda2, u.s.w. sind
    Partitionen im Laufwerk sda. Manche Laufwerke haben keine individuellen Partitionen, z.B.: /dev/fd0,
    das heißt, es gibt nur ein Dateisystem, das das gesamte Laufwerk belegt). Parallel-Port ZIP Bitte den Typ ZIP-Laufwerk wählen... Pudd: neue Datei oder existierende (wird ersetzt) Zieldatei wählen Puppy Universal dd Lese-Fehler, starte neu, und werde Fehler ignorieren... Lese-Fehler, starte neu, ignoriere Fehler... Entfernte Adresse: Vergrößere Dateisystem $4 zum Auffüllen der $3 Kbyte Partition... fdisk_starten Sorry, das Ziellaufwerk ist zu klein. Die Quelle 
$SOURCEPART hat $SOURCESIZE KBytes aber das Ziel 
$DESTPART hat nur $DESTSIZE KBytes. Nocheinmal versuchen... Sorry, die Zielpartition ist zu klein. Die Quelle 
$SOURCEPART hat $SOURCESIZE KBytes aber das Ziel 
$DESTPART hat nur $DESTSIZE KBytes. Nocheinmal versuchen... Sorry, diese Datei enthält kein Dateisystem. 
Pudd beabsichtigt nicht, ordinäre Dateien zu kopieren. Eine Datei mit einem Dateisystem darin ist ein
Image eines Laufwerks oder einer Partition, und kann zurück auf ein Laufwerk oder ein Partition koiert werden. Versuch's nochmal...  Teste Hardware.
 Bitte warten, das kann eine Weile dauern...
  Das sind die Partitionen, die Puppy kennt 
(Hinweise: eingehängte Partition nicht angezeigt. 
Eine eingehängte Partition sollte ausgehängt sein bevor von ihr/auf sie kopiert wird): Zur Übertragung auf einen entfernten Computer, muß auf dem entfernten Computer das Programm\nnetcat/nc program gestartet werden. Falls das Ziel ein Laufwerk oder eine Partition ist,\nmuss es ausgehängt sein. Die Einrichtung könnte so einfach wie ein Ethernet cross-over\nKabel zwischen zwei PCs sein, oder über das Internet.\nHier ist, was auf dem entfernten PC ausgeführt werden muß:\n # nc -l -p ${REMOTEPORT} < /dev/null | gunzip -c | dd of=DESTDEV bs=512\n...wobei DESTDEV sas ist, worauf geschrieben werden solll, zum Beispiel  /dev/hda1\n...man kann den Parameter bs= weglassen, oder ihn 1024 für ext2/3 machen.\n...Ich denke für msdos/vfat ist bs=512 korrekt.\n...Der Parameter -l bedeutet, dass nc auf am Port hereinkommende Daten lauschen wird.\n...DAS MUSS JETZT GEMACHT WERDEN!\n\nDer lokale PC  muß wissen, wo der entfernte PC ist, und die Adresse kann\neine URL oder IP sein. Zum Beispiel, www.goosee.com, oder 196.108.56.10.\nDie Port-Nummern lokal und entfernt müssen identisch sein. Ich schlage 1234 vor.\n\nBITTE das ENTFERNTE programm nc starten VOR dem Klick auf Button OK WARNUNG1: Vorsicht, wohin die Datei geschrieben wird. Falls es ein Image einer Partition ist
          dann sollte es auf eine Partition geschrieben werden. Ein Image eines gesamten Laufwerks, sollte
          auf ein gesamtes Laufwerk geschrieben werden. WARNUNG: Neuer Code, für nichts kritisches benutzen! Willkommen bei Pudd, dem Puppy-Universalprogramm zur Laufwerk/Partition/Imagedatei Sicherungs-/Wiederherstellsprogram!
This program will copy any drive, partition, or image-file to another drive, partition
or file, on the same PC or over a network. You can use Pudd to make copies of floppy
disks, to make clones of a drive/partition, or to rescue a failing drive/partition. Ja ${SOURCEPART} soll auf ${DESTXTN} kopiert werden keins davon 