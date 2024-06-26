��          D      l       �   /  �     �     �
     �
  M  �
  �  I  �       �     �                          <b>ALSA modem driver</b>
A driver starting with the text 'snd_' is an ALSA sound driver, but some of these also support on-board modems (port ttySL0). Thus, you cannot blacklist such a driver as that will also kill the sound.

<b>/dev/modem</b>
If this does not exist then at bootup Puppy will assign /dev/modem to the first modem driver that is found. If two modem drivers have loaded and you want to use the second, there are various ways to do this:

1. Totally manual
Manually create /dev/modem linked to the required port. You can do this in a terminal like this for example: # ln -sf ttyS0 /dev/modem You should also edit the 'Modem' entry in /etc/wvdial.conf, ex: Modem = /dev/ttyS0.

2. Blacklist and erase
You can click the BLACKLIST button and blacklist the driver that you do not want, then click the ERASE button which will delete /dev/modem and initialize the 'Modem' entry in /etc/wvdial.conf. Then at next bootup the correct modem should get selected.

<b>Hardware modems</b>
Puppy may autodetect some hardware modems at bootup, for example USB hardware modems, but serial modems and true-hardware plugin cards (ISA or PCI bus) are not autodetected at bootup. However, the PROBE button will scan for these, and you can even fall back to the individual 'ttyS0', 'ttyS1', etc., buttons if PROBE did not work right. A driver starting with the text 'snd_' is an ALSA sound driver, but some of these also support on-board modems (port ttySL0). Thus, you cannot blacklist such a driver as that will also kill the sound.

<b>/dev/modem</b>
If this does not exist then at bootup Puppy will assign /dev/modem to the first modem driver that is found. If two modem drivers have loaded and you want to use the second, there are various ways to do this:

1. Totally manual
Manually create /dev/modem linked to the required port. You can do this in a terminal like this for example: # ln -sf ttyS0 /dev/modem You should also edit the 'Modem' entry in /etc/wvdial.conf, ex: Modem = /dev/ttyS0.

2. Blacklist and erase
You can click the BLACKLIST button and blacklist the driver that you do not want, then click the ERASE button which will delete /dev/modem and initialize the 'Modem' entry in /etc/wvdial.conf. Then at next bootup the correct modem should get selected.

<b>Hardware modems</b>
Puppy may autodetect some hardware modems at bootup, for example USB hardware modems, but serial modems and true-hardware plugin cards (ISA or PCI bus) are not autodetected at bootup. However, the PROBE button will scan for these, and you can even fall back to the individual 'ttyS0', 'ttyS1', etc., buttons if PROBE did not work right. ALSA modem driver PupDial modem probe help Project-Id-Version: modemprobe VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2014-03-10 18:15+0100
PO-Revision-Date: 2014-03-10 10:05+0200
Last-Translator: L18L
Language-Team: German
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 <b>ALSA Modemtreiber</b>
Ein Treiber, dessen Name mit 'snd_' beginnt, ist ein ALSA-Soundtreiber, aber  einige von diesen unterstützen auch On-board-Modems (port ttySL0). Somit darf man solch einen Treiber nicht 'blacklisten', da das auch den Sound verstummen liese.

<b>/dev/modem</b>
Falls dies nicht existiert, wird Puppy beim Neustart /dev/modem dem ersten gefundenen Modemtreiber zuweisen. Falls zwei Modemtreiber geladen wurden und der zweite benutzt werden soll, gibt es verschiedene Möglichkeiten:

1. Total manuell
Erzeuge den link /dev/modem zum erforderlichen Port manuell. 
In einem Terminal so zum Beispiel: # ln -sf ttyS0 /dev/modem 
Auch sollte der 'Modem'-Eintrag in /etc/wvdial.conf editiert werden, Bsp.: Modem = /dev/ttyS0.

2. Blacklist und löschen
Man kann den Button BLACKLIST klicken und den nicht gewünschten Treiber auf eine 'schwarze Liste' setzen, dann den Button LÖSCHEN, der /dev/modem löscht und den 'Modem'-Einjtrag in /etc/wvdial.conf initialisiert. Dann sollte beim nächsten Neustart das Korreekte Modem ausgewählt werden.

<b>Hardware-Modems</b>
Puppy kann einige Hardware-Modems bei Neustart automatisch erkennen, zum Beispiel USB Hardware-Modems, aber serielle Modems und true-hardware plugin Karten (ISA oder PCI bus) werden nicht automatisch erkannt. Jedoch wird der Button nach diesen scannen, und man kann sogar zurück auf die individuellen Buttons 'ttyS0', 'ttyS1', etc., falls PROBE nicht richtig funktioniert hat. Ein Treiber, dessen Name mit 'snd_' beginnt, ist ein ALSA-Soundtreiber, aber  einige von diesen unterstützen auch On-board-Modems (port ttySL0). Somit darf man solch einen Treiber nicht 'blacklisten', da das auch den Sound verstummen liese.

<b>/dev/modem</b>
Falls dies nicht existiert, wird Puppy beim Neustart /dev/modem dem ersten gefundenen Modemtreiber zuweisen. Falls zwei Modemtreiber geladen wurden und der zweite benutzt werden soll, gibt es verschiedene Möglichkeiten:

1. Total manuell
Erzeuge den link /dev/modem zum erforderlichen Port manuell. 
In einem Terminal so zum Beispiel: # ln -sf ttyS0 /dev/modem 
Auch sollte der 'Modem'-Eintrag in /etc/wvdial.conf editiert werden, Bsp.: Modem = /dev/ttyS0.

2. Blacklist und löschen
Man kann den Button BLACKLIST klicken und den nicht gewünschten Treiber auf eine 'schwarze Liste' setzen, dann den Button LÖSCHEN, der /dev/modem löscht und den 'Modem'-Einjtrag in /etc/wvdial.conf initialisiert. Dann sollte beim nächsten Neustart das Korreekte Modem ausgewählt werden.

<b>Hardware-Modems</b>
Puppy kann einige Hardware-Modems bei Neustart automatisch erkennen, zum Beispiel USB Hardware-Modems, aber serielle Modems und true-hardware plugin Karten (ISA oder PCI bus) werden nicht automatisch erkannt. Jedoch wird der Button nach diesen scannen, und man kann sogar zurück auf die individuellen Buttons 'ttyS0', 'ttyS1', etc., falls PROBE nicht richtig funktioniert hat. ALSA-Modemtreiber PupDial Hilfe zu Modem Auswahl 