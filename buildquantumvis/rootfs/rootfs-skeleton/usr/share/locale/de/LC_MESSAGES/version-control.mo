��    [      �     �      �     �     �  :   �  p   :  �   �  �   {	     =
  
   C
  
   N
     Y
     h
     y
     �
     �
  �   �
  �   <  �     w   �  �   V    �     �               ,  7   G  h        �     �          (     7  e   K  +   �  5   �  4     (   H     q     �     �     �     �  5   �  Z   (  �   �  k   Q  `   �  9     �   X  �   �     �     �     �     �     �    	           :     B     K     ]     n  �   }  "   9  Y   \  �   �  `   u     �  �   �  /   k  '   �  �   �  y   M     �  g   �     K     j  �   �     Q  %   j  &   �     �     �  g   �     K     T     \  V   d  �   �  �   n  6   �  4  &      [!  "   v!  @   �!  �   �!    u"  �   x#  
   [$  
   f$  	   q$     {$     �$     �$     �$     �$  �   �$  �   �%  �   z&  �   o'  �   (  s  �(     +*     B*     K*     g*  G   �*  z   �*     G+     X+     x+     �+     �+  �   �+  3   I,  ,   },  ;   �,  *   �,  %   -     7-  #   R-     v-     �-  >   �-  v   �-  �   d.  �   \/  �   �/  J   h0  �   �0  �   C1     2     2  !   82     Z2     u2  6  �2     �3     �3     �3     �3     4     ,4  �   B4  '   15  y   Y5  �   �5  �   �6     Y7  �   m7  3   8  (   88  �   a8  �   9  !   �9  x   �9  (   M:  #   v:  �   �:     �;  3   �;  4   �;     <     *<  x   B<     �<     �<     �<  r   �<  �   G=  �   ;>  >   �>                9   8                    2   >   Z   *      H      "               T      ,       U       5              V   N   0   Y          	   .   X       7   =   ;          O   !   %   3   P       @   K   [      W                L   1   /   R   E   S           B   (      <   '   #   :              G   ?         C                       -       6          
   4   M   $             &       I   Q   D      )       A       J                                 F   +                /home is a symlink to: /mnt/wkg/home is a symlink to: <i>Depth</i> is stored in /var/local/version-history-depth A container is a copy of Easy Linux, to run applications isolated from the main Easy Linux and other containers. A container is not really a copy, it just seems that way. It is built upon a layered filesystem, with <i>easy.sfs</i> and other read-only layers that are shared with the main Easy Linux and other containers. As version upgrades occur, the amount of storage occupied by older versions may get excessive, hence the <i>Depth</i> parameter sets a maximum depth for the history. Older versions are deleted. Close Container: Containers Current status Current version: Depth: ERROR: Container ERROR: container Each container has its own read-write layer, and this may be erased, or a snapshot taken. If there is a previous snapshot, then it can be rolled-back to. Easy Linux also supports containers, which are in the <i>containers</i> folder. Snapshots of current work in each container may also be saved, in this case inside the appropriate container folder. Easy Linux keeps a record of everything. The user may take a snapshot of the current work at any time, and there will be upgrades to later versions. All snapshots and old versions are saved in the <i>releases</i> folder. Easy Linux runs on a layered filesystem, with read-only (ro) layer <i>easy.sfs</i>, and a read-write (rw) layer on top. Easy Linux runs on a layered filesystem, with read-only (ro) layers <i>easy.sfs</i> and <i>session.sfs</i>, and a read-write (rw) layer on top. Easy Linux runs on a layered filesystem. This has one or more read-only layers on the bottom, including <i>easy.sfs</i> that has the entire Easy Linux files.
The top layer is read-write, and this has all of the changes you have made, such as new files and installed packages. Easy Version Control Erase Erase almost completed Erase the working session: Files found inside each easy-<i>version</i> folder are: Folders within the repository are named easy-<i>version</i>, where <i>version</i> is the release number. Help: Containers Help: Easy Version Control Help: Erase session Help: Rollback Help: take snapshot Here you may choose to take a snapshot of the session, or roll back to an earlier snapshot or version If there are any snapshots, they are named: It is the content of this folder that will be erased. It is this read-write (rw) layer that will be saved. It is this rw layer that will be erased. Location of containers folder: Location of containers: Location of releases folder: Location of releases: Location of rw folder: Merge of session.sfs and rw layer of previous version Note however, anything installed to /home is outside the rw layer, and will not be erased. Note that although it is nice to keep all of the history in the releases, this can get out of hand if memory storage is limited. A Flash stick of 8GB for example, may seem like a lot, but can quickly fill. Note that session.sfs is the merge of session.sfs and the rw-layer from the previous version of Easy Linux. Note that the purpose of taking a snapshot, is that it can be rolled back to at any future date. Please type a short one-line comment about this snapshot: Previous versions (releases) of Easy Linux, if any, as well as any snapshots taken by the user, are saved in the <i>releases</i> folder. Reasons for doing this are varied. Sometimes, a later version proves to be troublesome, therefore it is a simple matter to rollback, until the problems with the later version are sorted out. Rollback Rollback almost completed Rolled-back to snapshot: Rolled-back to version: Rolled-back version: Rolling back to versions from January 2019 to December 22, 2019, is broken. That is, versions prior to 1.3 in the Pyro series and 2.2 in the Buster series. Rolling back and forward to any snapshot in the same version is OK. From 1.3 and 2.2 onwards, all of rollback should work. Save the working session: Session Snapshot Snapshot comments Snapshot created Snapshot file: Snapshots are also useful, as they capture the state of the system when the user has it setup in a particular desired way, which can be rolled back to if there is a mess created later on. Some reasons for taking a snapshot Sorry the container is currently in use. The read-write layer cannot be erased. Aborting. Sorry the container is currently in use. The read-write layer cannot be erased. It is required to restart the X server or reboot (see the Shutdown menu) to stop the desk container. Aborting. Take a snapshot or erase the working session, or rollback to an earlier snapshot, in a container Technical notes The <i>Depth</i> parameter sets a maximum limit to number of versions recorded. Older versions are deleted from the releases folder. The container read-write layer has been erased. The current easy-<i>version</i> folder: The reason for keeping all of this history in the releases folder, is that the user can roll back to any earlier version and/or snapshot. The rw layer has all changes made by the user. Theming, network setup, installed packages, etc, are all in this rw layer. The rw layer is located at: The rw layer will be erased. However, as this is currently in use, a reboot is required to take effect. The snapshot will be saved as: This has all of Easy Linux This is done for two main reasons, security, and/or to provide a working environment that does not compromise the main Easy Linux. An example of the latter would be compiling and testing source packages. This is the Linux kernel This requires a reboot to take effect This requires a reboot to take effect. This runs at bootup This will be copied to: This will not be erased. This is where user personal files are kept, such as downloads, photos, videos. Version: WARNING Warning You cannot perform a session erase, snapshot, or rollback, when a container is in use. You have added the devx.sfs as a read-only layer. Take a snapshot before compiling and installing source packages, then later can remove them all by rolling back to the snapshot. You have setup theming and network. Later on, you want to get rid of whatever you have done, and go back to this original state. and any extra SFS files that are desired to be loaded. Project-Id-Version: easy-version-control 2.3.8
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2020-08-12 12:59+0000
Last-Translator: fido@localhost
Language-Team: none
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=(n != 1);
 /home ist ein symlink auf: /mnt/wkg/home ist ein symlink auf: <i>Tiefe</i> ist in /var/local/version-history-depth gespeichert Ein Container ist eine Kopie von Easy Linux, um Anwendungen auszuführen, die von den Hauptcontainern von Easy Linux und anderen Containern isoliert sind. Ein Container ist nicht wirklich eine Kopie, es scheint nur so zu sein. Er basiert auf einem mehrschichtigen Dateisystem mit <i>easy.sfs</i> und anderen schreibgeschützten Ebenen, die mit dem Haupt-Easy Linux und anderen Containern gemeinsam genutzt werden. Bei Versionsaktualisierungen kann der von älteren Versionen belegte Speicherplatz übermäßig groß werden. Daher legt der Parameter <i>Tiefe</i> eine maximale Tiefe für den Verlauf fest. Ältere Versionen werden gelöscht. Schließen Container: Container Momentaner Status Momentane Version: Tiefe: FEHLER: Container FEHLER: Container Jeder Container verfügt über eine eigene Lese- und Schreibebene, und diese kann gelöscht oder ein Snapshot erstellt werden. Wenn ein früherer Snapshot vorhanden ist, kann er zurückgesetzt werden. Easy Linux unterstützt auch Container, die sich im Ordner <i>container</i> befinden. Momentaufnahmen der aktuellen Arbeit in jedem Container können ebenfalls gespeichert werden, in diesem Fall im entsprechenden Containerordner. Easy Linux zeichnet alles auf. Der Benutzer kann jederzeit eine Momentaufnahme der aktuellen Arbeit machen und Upgrades auf spätere Versionen durchführen. Alle Momentaufnahmen und alten Versionen werden im Ordner <i>releases</i> gespeichert.  Easy Linux läuft auf einem mehrschichtigen Dateisystem, mit einer schreibgeschützten (ro) Schicht <i> easy.sfs</i> und einer Read-Write (rw) Schicht oben. Easy Linux läuft auf einem geschichteten Dateisystem mit schreibgeschützten (ro) Schichten <i>easy.sfs</i> und <i>session.sfs</i> und eine Read-Write-Schicht (rw) oben. Easy Linux läuft auf einem mehrschichtigen Dateisystem. Dieses enthält eine oder mehrere schreibgeschützte Ebenen an der Unterseite, einschließlich <i>easy.sfs</i>, das die gesamten Easy Linux-Dateien enthält. 
Die oberste Ebene ist Lesen und Schreiben. Hier werden alle Änderungen vorgenommen, die Sie vorgenommen haben, z. B. neue Dateien und installierte Pakete. Easy Versionskontrolle Löschen Löschen fast abgeschlossen Löschen der Arbeitssitzunmg Dateien, die in jedem easy-<i>Version</i>-Ordner gefunden werden, sind: Ordner innerhalb des Repositoriums werden als easy-<i>Version</i> bezeichnet, wobei <i>Version</i> die Versionsnummer ist. Hilfe: Container Hilfe: EasyOS Versionskontrolle Hilfe: Sitzung löshen Hilfe: Rollback Hilfe: Momentaufnahme machen Hier können Sie einen Schnappschuss der Sitzung erstellen oder zu einem früheren Schnappschuss oder einer früheren Version zurückkehren. Wenn es Momentaufnahmen gibt, werden diese benannt: Es wird der Inhalt dieses Ordners gelöscht. Es ist diese Lese-/Schreibebene (rw), die gespeichert wird. Es ist diese rw-Ebene, die gelöscht wird. Speicherort des Ordners 'containers': Speicherort der Container: Speicherort des Ordners 'releases': Speicherort von 'releases': Speicherort des rw-Ordners: Zusammenführung von session.sfs und rw der vorherigen Version Beachten Sie jedoch, dass alles, was in /home installiert ist, außerhalb der rw-Ebene liegt und nicht gelöscht wird. Beachten Sie, dass es zwar schön ist, den gesamten Verlauf in den Releases beizubehalten, dies kann aus dem Ruder laufen, wenn der Speicherplatz begrenzt ist. Ein Flash-Stick mit 8 GB kann zum Beispiel viel erscheinen, sich aber schnell füllen.  Beachten Sie, dass session.sfs die Zusammenführung von session.sfs und der rw-Schicht aus der vorherigen Version von Easy Linux ist. Beachten Sie, dass der Zweck einer Momentaufnahme darin besteht, dass sie an jedem zukünftigen Zeitpunkt zurückgesetzt werden kann. Zu diesem Schnappschuss bitte einen kurzen einzeiligen Kommentar eingeben: Frühere Versionen (Releases) von Easy Linux sowie etwaige vom Benutzer erstellte Schnappschüsse werden im Ordner <i>releases</i> gespeichert. Die Gründe dafür sind vielfältig. Manchmal erweist sich eine spätere Version als problematisch, daher ist es einfach, ein Rollback durchzuführen, bis die Probleme mit der späteren Version behoben sind. Rollback Rollback fast abgeschlossen Zurückgerollt zum Schnappschuss: Zurückgerollt zu Version: Zurückgerollte Version: Das Zurücksetzen auf Versionen von Januar 2019 bis 22. Dezember 2019 ist fehlerhaft.Das heißt, Versionen vor 1.3 in der Pyro-Serie und 2.2 in der Buster-Serie.Das Zurück- und Vorwärtsrollen zu einem Schnappschuss in derselben Version ist in Ordnung.Ab 1.3 und 2.2 sollte das gesamte Rollback funktionieren. Speichern der Arbeitssitzung: Sitzung: Momentaufnahme Momentaufnahme Kommentare Momentaufnahme erzeugt Momentaufnahme-Datei: Snapshots sind auch nützlich, da sie den Status des Systems erfassen, wenn der Benutzer das System auf eine bestimmte gewünschte Weise eingerichtet hat. Dies kann rückgängig gemacht werden, wenn später ein Durcheinander erzeugt wird. Einige Gründe für eine Momentaufnahme Es tut uns leid, dass der Container gerade verwendet wird. Die Lese-Schreib-Schicht kann nicht gelöscht werden. Abbruch. Sorry, der Container wird gerade verwendet. Die Schreib-Lese-Schicht kann nicht gelöscht werden.Es ist ein Neustart des X-Servers oder ein Neustart (siehe Menü Herunterfahren) erforderlich, um den Desk-Container zu stoppen. Abbruch. Erstellen Sie einen Schnappschuss oder löschen Sie die Arbeitssitzung oder machen Sie einen Rollback zu einem früheren Schnappschuss in einem Container. Technische Hinweise Mit dem Parameter <i>Tiefe</i> wird die Anzahl der aufgezeichneten Versionen festgelegt. Ältere Versionen werden aus dem Ordner 'releases' gelöscht. Die Container-Lese-/Schreibschicht wurde gelöscht. Der aktuelle easy-<i>version</i> Ordner: Der Grund für die Aufbewahrung des gesamten Verlaufs im Veröffentlichungsordner ist, dass der Benutzer zu jeder früheren Version und/oder Momentaufnahme zurückkehren kann. Die Ebene rw hat alle vom Benutzer vorgenommenen Änderungen. Theming, Netzwerkeinrichtung, installierte Pakete usw. befinden sich alle in dieser rechten Ebene. Die rw-Schicht befindet sich auf: Die rw-Ebene wird gelöscht. Da diese jedoch gerade verwendet wird, ist ein Neustart erforderlich, um wirksam zu werden. Die Momentaufnahme wird gespeichert als: Dies enthält alles von Easy Linux: Dies geschieht aus zwei Gründen: der Sicherheit und/oder der Bereitstellung einer Arbeitsumgebung, die die wichtigsten Easy Linux-Systeme nicht beeinträchtigt. Ein Beispiel für Letzteres wäre das Kompilieren und Testen von Quellpaketen. Dies ist der Linux-Kernel Dies erfordert einen Neustart, um wirksam zu werden Dies erfordert einen Neustart, um wirksam zu werden. Dies läuft beim Hochfahren Dies wird kopiert nach: Dies wird nicht gelöscht. Hier werden persönliche Dateien des Benutzers aufbewahrt, z. B. Downloads, Fotos und Videos. Version: Warnung Warnung Sie können keine Sitzungslöschung, Momentaufnahme oder Rollback durchführen, wenn ein Container verwendet wird. Sie haben die devx.sfs als schreibgeschützte Ebene hinzugefügt.Machen Sie einen Schnappschuss, bevor Sie die Quellpakete kompilieren und installieren. Später können Sie sie alle wieder entfernen, indem Sie zum Schnappschuss zurückkehren.  Sie haben Themen und Netzwerke eingerichtet. Später möchten Sie alles, was Sie getan haben, loswerden und in diesen ursprünglichen Zustand zurückkehren. und alle zusätzlichen SFS-Dateien, die geladen werden sollen. 