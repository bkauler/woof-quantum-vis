��    "      ,  /   <      �  �  �  5  ~  `   �  f     (  |  c   �  �   	  �   �  �   �	  �   O
  f     P   o  
   �     �     �  &   �  "     .   A     p     �     �  3   �  6   �     
  :        L     b  �  v              !  $   %  �  J  z    �  �  =  M  g   �  g   �  W  [  _   �  �     �   �  �   �  �   w  x   -  D   �     �     �       )   )  '   S  '   {     �     �     �  6   �  7         G   =   P      �      �   �  �   7  �"     �#     �#     �#  �  �#                                "                                               	                                    !            
                               

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

        Please select the drivers to probe:  : FOUND!! ALSA Sound Wizard: NOTICE ALSA configurator Building card database, please wait... Can't create temp file, exiting... Do you want to continue and run the Wizard?... Driver Selection No No card database is found. No legacy drivers are available
   for your machine Probing legacy cards..   This may take a few minutes.. Result Saving the mixer setup used for this in /etc/asound.state. Searching sound cards Soundcard Selection The ALSA Wizard unloads any sound drivers and then starts again.
This causes a problem if you decide to exit anywhere before the
Wizard has gone right to the end -- if you previously had working
sound, it will then not be working -- but a reboot will fix it.
Also, unloading of the audio drivers may affect some dialup modems,
and they may not work after running this Wizard -- again, a reboot
will fix it. This computer has very little RAM, perhaps not enough to run the "depmod" utility (which the ALSA Wizard needs to run). Shutdown first, to create a save-file for the session, and you may then have enough working memory at the next boot. Click button to exit Wizard... WARNING Yes You must be root to use this script. usage: alsaconf [options]
  -l|--legacy    check only legacy non-isapnp cards
  -m|--modinfo   read module descriptions instead of reading card db
  -s|--sound wav-file
                 use the specified wav file as a test sound
  -u|--uid uid   set the uid for the ALSA devices (default = 0) [obsoleted]
  -g|--gid gid   set the gid for the ALSA devices (default = 0) [obsoleted]
  -d|--devmode mode
                 set the permission for ALSA devices (default = 0666) [obs.]
  -r|--strict    set strict device mode (equiv. with -g 17 -d 0660) [obsoleted]
  -L|--log file  logging on the specified file (for debugging purpose only)
  -p|--probe card-name
                 probe a legacy non-isapnp card and print module options
  -P|--listprobe list the supported legacy card modules
  -c|--config file
                 specify the module config file
  -R|--resources list available DMA and IRQ resources with debug for legacy
  -h|--help      what you're reading Project-Id-Version: alsaconf VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2011-04-21 19:59+0300
PO-Revision-Date: 2012-04-04 11:44+0100
Last-Translator: root <L18L@ouppy.forum>
Language-Team: German
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
POT-Changing-Date: 2012-03-21 10:59+0100
Plural-Forms: nplurals=2; plural=(n != 1);
 

  In Ordbung, Soundtreiber ist konfiguriert.

           ALSA  Assistent
  wird jetzt die Karte zum Spielen vorbereiten.

Technisch: "/etc/init.d/alsa start" wird benutzt zum
  Initialisieren von ALSA, amixer zur Erhöhung der Lautstärke.

  Man kann die Lautstärke später mit einem Mixer-Programm wie
  Retrovol (Menü>Multimedia) ändern, oder jetzt mit einem Klick
  auf das Lautsprecher-Symbol in der Leiste den Schieberegler aktivieren.
   
                   ALSA-Assistent
                   Version %s

  Dieser Assistent ist ein Konfigurator für Treiber der
         Advanced Linux Sound Architecture (ALSA)
       (mit einigen Modifikationen für Puppy Linux).

  Alle laufenden Sound-Anwendungen jetzt schließen
  (wie Mplayer, mhWaveEdit, etc.).
   
         Folgende Karte(n) auf diesem System gefunden.
         Bitte eine zur Konfiguration wählen:
 
        Keine unterstützte PnP- oder PCI-Karte gefunden.

        ISA Sound-Karte/-Chips probieren?

 
       Der Mixer ist jetzt zum Abspielen eingerichtet.
       Soll ich jetzt versuchen, ein Sound-Beispiel abzuspielen?

                           ACHTUNG:
Lautstärke eventuell herunterdrehen oder <Nein> "sagen".
    Anderenfalls überprüfen, daß die Lautstärke aufgedreht ist,
         dann <Ja> wählen zum Abspielen des Testsounds...
 
   Erproben von legacy ISA Karten kann das
   System unstabil machen.

        Weitermachen?

 
 Anscheinend ist das eine Dell Dimension Maschine.
 Auf dieser  Maschine sollte ein CS4232 Treiber benutzt werden,
 obwohl ein CS46xx Chip erkannt wurde.

 Soll ich den Treiber snd-cs4232 probieren
 und ISA Konfigurieren? 
 Anscheinend ist das ein Thinkpad 600E oder 770 Notebook.
 Auf diesem Notebook, sollte ein CS4236 Treiber benutzt werden,
 obwohl ein CS46xx Chip erkannt wurde.

 Soll ich den Treiber snd-cs4236 probieren
 und ISA Konfigurieren? 
 Soll ich try all possible DMA and IRQ combinations?
 With this option, some unconventional configuration
 might be found, but it will take much longer time. 
===============================================================================

 ALSA Konfiguration ist jetzt fertig.
 Einstellung der Lautstärke mit Sound-Mixer.

 Viel Spaß!

 
Konfiguriere %s
Bitte hier mit < Ja > antworten, sodaß Treiber IMMER benutzt wird
Konfigurationsdatei %s modifizieren?            Erprobe legacy ISA Karten

        Bitte Treiber wählen:  : GEFUNDEN!! ALSA Sound-Assistent: HINWEIS ALSA Konfigurator Errichte Kartendatenbank, bitte warten... Kann temporäre Datei nicht erzeugen... Weitermachen mit diesem Assistenten?... Treiber-Auswahl Nein Keine Kartendatenbank gefunden. Keine legacy Treiber verfügbar
   für diese Maschine Probing legacy cards..   Kann ein paar Minuten dauern.. Resultat Benutzte Mischereinstellung in /etc/asound.state gespeichert. Suche Soundkarten Soundkarten-Auswahl Der ALSA-Assistent entlädt alle Sound-Treiber und startet dann neu.
Falls man abbricht bevor der Assistent ganz fertig ist, gibt es ein Problem:
Wenn der Sound vorher funktioniert hat, wird er dann nicht mehr funktionieren.
-- Er funktioniert dann erst nach einem Neustart des Computers wieder.
Auch kann das Entladen der Audiotreiber manche Modems beeinflussen,
und sie können vielleicht nicht mehr funktionieren. 
-- Wieder gilt: nach Neustart des Computers funktioniert es wieder. Dieser Computer hat sehr wenig RAM, vielleicht nicht genug für das Werkzeug "depmod" (das doeser Assistent benötigt). Deshalb bitte zuerst Herunterfahren, um eine Sicherungsdatei zu erzeugen, und beim nächsten Neustart kann dannn der Arbeitsspeicher ausreichend groß sein. Knopf-klick beendet Assistenten... WARNUNG Ja Nur root darf das. Gebrauch: alsaconf [Optionen]
  -l|--legacy    check only legacy non-isapnp cards
  -m|--modinfo   Modulbeschreibungen lesen anstatt Lesen der Karten-Datenbank
  -s|--sound wav-file
                 die spezifizierte wav-Datei als Testklang benutzen
  -u|--uid uid   set the uid for the ALSA devices (default = 0) [obsoleted]
  -g|--gid gid   set the gid for the ALSA devices (default = 0) [obsoleted]
  -d|--devmode mode
                 set the permission for ALSA devices (default = 0666) [obs.]
  -r|--strict    set strict device mode (equiv. with -g 17 -d 0660) [obsoleted]
  -L|--log file  logging on the specified file (for debugging purpose only)
  -p|--probe card-name
                 probe a legacy non-isapnp card and print module options
  -P|--listprobe die unterstützten supported legacy Kartenmodule listen
  -c|--config file
                 die Konfigurationsdatei spezifizieren
  -R|--resources verfügbare DMA- und IRQ-Resourcen listen mit debug for legacy
  -h|--help      was jetzt hier zu lesen ist 