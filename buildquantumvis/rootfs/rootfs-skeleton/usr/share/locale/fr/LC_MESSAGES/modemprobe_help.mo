��          L      |       �     �      �     �     �  
     A    �  P            !   4     V                                         A driver starting with the text 'snd_' is an ALSA sound driver, but some of these also support on-board modems (port ttySL0). Thus, you cannot blacklist such a driver as that will also kill the sound.

<b>/dev/modem</b>
If this does not exist then at bootup Puppy will assign /dev/modem to the first modem driver that is found. If two modem drivers have loaded and you want to use the second, there are various ways to do this:

1. Totally manual
Manually create /dev/modem linked to the required port. You can do this in a terminal like this for example: # ln -sf ttyS0 /dev/modem You should also edit the 'Modem' entry in /etc/wvdial.conf, ex: Modem = /dev/ttyS0.

2. Blacklist and erase
You can click the BLACKLIST button and blacklist the driver that you do not want, then click the ERASE button which will delete /dev/modem and initialize the 'Modem' entry in /etc/wvdial.conf. Then at next bootup the correct modem should get selected.

<b>Hardware modems</b>
Puppy may autodetect some hardware modems at bootup, for example USB hardware modems, but serial modems and true-hardware plugin cards (ISA or PCI bus) are not autodetected at bootup. However, the PROBE button will scan for these, and you can even fall back to the individual 'ttyS0', 'ttyS1', etc., buttons if PROBE did not work right. ALSA modem driver PupDial modem detection PupDial modem probe help Puppy Help Project-Id-Version: modemprobe_help VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2014-12-12 15:18+0100
Last-Translator: esmourguit <jj@moulinier.net>
Language-Team: French
Language: fr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n > 1);
 <b>Pilote de modem ALSA</b>
Un nom de pilote commençant par 'snd_' signifie un pilote audio ALSA, mais certains d'entre eux prennent aussi en charge des modems (port ttySL0). Donc, ne mettez pas en liste noire un tel pilote, vous n'auriez plus de son.

<b>/dev/modem</b>
S'il n'existe pas, au démarrage il sera attribué /dev/modem au premier pilote de modem trouvé. Si deux pilotes de modem ont été chargés et que vous souhaitez utiliser le second, il y a plusieurs façons de faire :

1. Totalement manuel
Créer manuellement /dev/modem relié au port requis. Vous pouvez le faire dans un terminal, par exemple comme ça: # ln-sf ttyS0 /dev/modem. Vous devez également modifier l'entrée 'modem' dans /etc/wvdial.conf, ex: Modem = /dev/ttyS0.

2. Liste noire et suppression
Vous pouvez cliquer sur le bouton 'LISTE NOIRE' et mettre en liste noire le pilote que vous ne voulez pas, puis cliquer sur le bouton 'EFFACER' qui permet de supprimer /dev/modem et initialiser l'entrée 'Modem' dans /etc/wvdial.conf. Puis, au démarrage suivant, le bon modem devrait être sélectionné.

<b>Modems matériels</b>
Au démarrage il est possible de détecter certains modems matériels, comme les modems USB. Mais les modems série et les véritables cartes (bus ISA ou PCI) ne sont pas détectés au démarrage. Le bouton TESTER peut les rechercher et vous pouvez même retomber sur les boutons 'ttyS0', 'ttyS1', etc., si le test ne fonctionne pas correctement. Pilote modem ALSA PupDial détection de modem PupDial Aide pour tester un modem Aide 