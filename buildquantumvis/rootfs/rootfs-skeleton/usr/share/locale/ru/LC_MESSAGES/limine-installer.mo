��    S      �  q   L        K     _   ]  s   �     1  6   Q     �  /   �  C   �  '   	     -	  +   F	  
   r	     }	     �	     �	     �	  $   �	  	   �	     �	  �   �	  x   �
  Y   "     |  ,   �  i   �  4   #  ~   X  -   �  K     I   Q     �  <   �  E   �  �   <  �   �     �  !   �  #   �      �          7     U  �   s  �   M  H   �  ~   G     �  8   �  �     O   �  	   �  s   �  f   m  "   �  ,   �  6   $  G   [  D   �  ^   �  7   G       �   �  �   D  =   �  0   $     U     �  �   �  H   �       )     �   5  i   �  #   B  0   f  �   �     Y  G   y  E   �  /        7  -   E  �  s  t   �  �   o  �      3   �   ]   �      O!  \   d!  x   �!  Y   :"  6   �"  _   �"     +#  2   9#      l#     �#     �#  :   �#  
   �#     �#  d  $  �   w%  �   1&  !   �&  }   '  �   �'  P   :(  �   �(  O   l)  `   �)  J   *  &   h*  r   �*  k   +    n+  ,  �,  0   �-  7   �-  E   .  B   e.  6   �.  T   �.  I   4/  �  ~/  Q  1  �   b2    �2  7   �3  �   54  <  �4  �   6     �6  �   �6  �   �7  .   q8  9   �8  X   �8  O   39  m   �9  ~   �9  M   p:  <   �:    �:    <  k   5=  a   �=  �   >     �>  f  ?  �   s@     A  N   A  1  gA  �   �B  6   �C  I   �C  h  D  -   zE  a   �E  _   
F  E   jF      �F  G   �F            0   +         L                  "   5       6       ;   <          M       :   9   8   G   ,   J          >      A   #      ?   K   C                     N          3         (   D       &                     =          /   O   *      2           P       B   )      -   .          @          I           Q   '   S                                
   H   R   F       !   4   7   %           E   	       1   $       (An ESP partition has a vfat filesystem and the boot and esp flags are set) (Note: there will be one more window, a final sanity check, before completing the installation) Alternatively, delete or rename folder /EFI/limine in the ESP partition, and UEFI will fallback to previous bootup. As root in a terminal, execute: Boot the computer, and you should get the Limine menu. CONTINUE Choose which one you want to install Limine to. Click INSTALL button to create an entry in the UEFI firmware nvram. Click INSTALL button to install Limine: Click OK button to exit: Click button to see generated menu entries: Error log: Failed to mount /dev/ File missing: GENERATE Here are the ESP partitions: Here are the found OS installations: IMPORTANT INSTALL If anything is wrong, or for any other reason, you may revert to the previous boot menu. Press the hot-key at power-on to start the UEFI-Setup, and change the boot order. If limine.cfg has one of these parameters, Limine will be confused if it finds the parameter in more than one partition. If not, press the hot-key at power-on to start the BIOS-Setup, and change the boot order. Important notes In UEFI-Setup, secure-boot must be disabled. It seems that the computer has UEFI firmware. This requires that you install Limine into a ESP partition. It seems that the computer has legacy-BIOS firmware. It seems that you have a UEFI computer, but have booted up in legacy-BIOS mode. You must bootup in UEFI mode. Cannot continue. Limine can be uninstalled, with some caveats. Limine has been installed into the GPT (GUID Partition Table) of the drive. Limine has been installed into the MBR (Master Boot Record) of the drive. Limine has been installed to: Limine has created this file, that can be used to uninstall: Limine package mising, required version greater than or equal to 3.12 Limine will be installed into the GUID Partition Table (GPT) of the drive. Note: Limine does have a mechanism to uninstall and restore the original GPT -- with some caveats. Limine will be installed into the Master Boot Record (MBR) of the drive. Note: Limine does have a mechanism to uninstall and restore the original MBR -- with some caveats. LimineInstaller: ESP install LimineInstaller: Limine installed LimineInstaller: check dependencies LimineInstaller: conflicts found LimineInstaller: pre-install LimineInstaller: sanity check LimineInstaller: scan results NOTICE: The Limine Installer is provided in good faith; however, the authors accept no liability in case anything goes wrong. You continue with the understanding that you take full responsibility for the consequences. NOTICE: The Limine Installer is provided in good faith; however, the authors accept no liability in case anything goes wrong. You take full responsibility for the consequences. Note: Gparted may be used to change the UUID and label of any partition. Note: in some grub2 installations, the ESP-flag of the boot partition is not set. If so, set it using Gparted, then try again. Nothing found. Aborting. Please wait, scanning for installed operating systems... Reboot the computer, hold down the hot-key to enter UEFI-Setup, and set the ESP partition in which Limine is installed as the default. Search online for <i>windows disable fast startup</i> to find out how to do it. See file: Strange, cannot find a boot partition. A partition with boot-flag set is required, for installing Limine. Aborting. Strange, this seems to be a computer with UEFI-firmware, but there is no ESP boot partition. Aborting. Success, Limine has been installed The Limine EFI file has been installed here: The Limine configuration file has been installed here: The efibootmgr utility has failed to enter Limine into the UEFI nvmram. The efibootmgr utility is not working, cannot complete installation. The first step of installation has been done, limine.sys and limine.cfg have been copied here: The limine-deploy utility has failed to install Limine. Then, click the INSTALL button: There was a pre-existing BOOTIA32.EFI file, that has been renamed to BOOTIA32.BAK. You may revert the Limine installation simply by renaming it back to BOOTIA32.EFI There was a pre-existing BOOTX64.EFI file, that has been renamed to BOOTX64.BAK. You may revert the Limine installation simply by renaming it back to BOOTX64.EFI These are drives that contain a partition with boot-flag set: These dependency requirements have not been met: This is not really a sanity-check, as the installation has already taken place. It is information about what has just happened. This utility is required: This will make Limine the default at bootup. However, if for some reason you want to change back to how bootup was before Limine was installed, this is quite easy, as will be explained in the final window. Tick those you want Limine menu entries for, then click GENERATE button: VIEW WARNING, conflicting partition parameters Windows is installed on this computer. If Windows 10 or 11, you must disable fast-startup. If this is not done, Windows may become corrupted in a dual-boot setup. You are running a 32-bit OS on a computer with 64-bit CPU. Please run a 64-bit Linux OS. Cannot continue. You chose not to continue. Quiting. You have chosen to install Limine to this drive: You may continue, but you must remove the conflict before booting with Limine bootloader. If the conflict is on a USB drive, remove it before booting with Limine installed to an internal drive. efibootmgr utility is required. lsblk utility from util-linux is too old, does not understand PARTUUID. lsblk utility from util-linux is too old, does not understand PTUUID. lsblk utility from util-linux package required. nothing found uniq utility from coreutils package required. Project-Id-Version: limine-installer VERSION
Report-Msgid-Bugs-To: 
PO-Revision-Date: 2023-04-01 20:12+0300
Last-Translator: root <root@localhost>
Language-Team: Russian
Language: ru
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 (Раздел ESP имеет файловую систему vfat, и установлены флаги boot и esp) (Заметка: будет еще одно окно - окончательная проверка перед завершением установки) Кроме того, удалите или переименуйте папку /EFI/limine в разделе ESP, и UEFI вернется к предыдущей загрузке. Как корень в терминале, execute: Загрузите компьютер, и вы должны получить меню Limine. ПРОДОЛЖИТЬ Выберите, на какой из них вы хотите установить Limine. Нажмите кнопку УСТАНОВИТЬ, чтобы создать запись в прошивке UEFI nvram. Нажмите кнопку УСТАНОВИТЬ, чтобы установить Limine: Нажмите кнопку OK, чтобы выйти: Нажмите кнопку, чтобы увидеть сгенерированное меню: Ошибка: Не удалось смонтировать /dev/ Файл отсутствует: СОЗДАТЬ Вот ESP разделы: Вот найденные установленные ОС: ВАЖНО УСТАНОВИТЬ Если что-то не так или по любой другой причине, вы можете вернуться к предыдущему меню загрузки. Нажмите горячую клавишу при включении питания, чтобы запустить UEFI-Setup, и измените порядок загрузки. Если limine.cfg имеет один из этих параметров, Limine запутается, если найдет параметр в нескольких разделах. Если нет, нажмите горячую клавишу при включении питания, чтобы запустить BIOS-Setup, и измените порядок загрузки. Важные примечания В программе установки UEFI безопасная загрузка должна быть отключена. Похоже, что компьютер имеет прошивку UEFI. Для этого необходимо установить Limine в раздел ESP. Похоже, что компьютер имеет прошивку legacy-BIOS. Кажется, что у вас компьютер UEFI, но вы загрузились в режиме legacy-BIOS. Вы должны загрузиться в режиме UEFI. Не удается продолжить. Limine можно удалить, с некоторыми оговорками. Лимин был установлен в GPT (таблица разделов GUID) диска. Limine был установлен в MBR (Master Boot Record) диска. Limine был установлен в: Limine создал этот файл, который можно использовать для удаления: Изменение пакета Limine, требуемая версия больше или равна 3.12 Limine будет установлен в таблицу разделов GUID (GPT) диска. Примечание: У Limine есть механизм удаления и восстановления оригинального GPT - с некоторыми оговорками. Лимин будет установлен в главную загрузочную запись (MBR) диска. Примечание: У Limine есть механизм удаления и восстановления оригинального MBR - с некоторыми оговорками. ЗагрузчикLimine: Установка ESP УстановщикLimine: Limine установлен УстановщикLimine: проверка зависимостей Установщик Limine: найденные конфликты УстановщикLimine: предустановка УстановщикLimine: Проверка на работоспособность УстановщикLimine: Результаты сканирования ЗаМЕТКА: Установщик Limine сделан качественно; однако авторы не несут никакой ответственности в случае, если что-то пойдет не так. Вы продолжаете с пониманием того, что берете на себя полную ответственность за последствия. ЗАМЕТКА: Установщик Limine сделан качественно; однако авторы не несут никакой ответственности в случае, если что-то пойдет не так. Вы берете на себя полную ответственность за последствия. Заметка: Gparted может использоваться для изменения UUID и метки любого раздела. Заметка: в некоторых установках grub2 ESP-флаг загрузочного раздела не установлен. Если это так, установите его с помощью Gparted, а затем повторите попытку. Ничего не найдено. Прерывание. Пожалуйста, подождите, сканирование на наличие установленных операционных систем... Перезагрузите компьютер, удерживайте нажатой клавишу горячей клавиши, чтобы войти в UEFI-Setup, и установите раздел ESP, в котором установлен Limine, в качестве раздела по умолчанию. Выполните поиск в Интернете для windows, <i>Windows отключение быстрого запуска</i>, чтобы узнать, как это сделать. См. файл: Странно, не могу найти загрузочный раздел. Для установки Limine требуется раздел с установленным загрузочным флагом. Прерывание. Странно, что это вроде бы компьютер с UEFI-прошивкой, но нет загрузочного раздела ESP. Прерывание. Успех, Limine был установлен Файл Limine EFI был установлен зесь: Конфигурационный файл Limine был установлен здесь: Утилита efibootmgr не смогла ввести Limine в UEFI nvmram. Утилита efibootmgr не работает, не возможно завершить установку. Первый шаг установки был сделан, limine.sys и limine.cfg были скопированы сюда: Утилите limine-deploy не удалось установить Limine. Затем нажмите кнопку УСТАНОВИТЬ: Уже существовал предустановленный BOOTIA32.EFI файл, который был переименован в BOOTIA32.BAK. Вы можете вернуть установку Limine, просто переименовав ее обратно в BOOTIA32.EFI Уже существовал предустановленный BOOTX64.EFI файл, который был переименован в BOOTX64.BAK. Вы можете вернуть установку Limine, просто переименовав ее обратно в BOOTIA64.EFI Это диски, которые содержат раздел с загрузочным флагом set: Эти требования к зависимостям не были удовлетворены: На самом деле это не проверка на здравомыслие, так как установка уже состоялась. Это информация о том, что только что произошло. Эта утилита required: Это сделает Limine по умолчанию при загрузке. Однако, если по какой-то причине вы хотите вернуться к тому, как была загрузка до установки Limine, это довольно просто, как будет объяснено в последнем окне. Отметьте те пункты меню Limine, для которых вы хотите, затем нажмите кнопку СОЗДАТЬ: ПРОСМОТР ВНИМАНИЕ, конфликтующие параметры раздела На этом компьютере установлен Windows. Если это Windos 10 или 11, вам необходимо отключить быстрый запуск. Если этого не сделать, Windows может быть поврежден при двойной загрузке. Вы используете 32-разрядную ОС на компьютере с 64-разрядным процессором. Пожалуйста, запустите 64-разрядную Linux ОС. Не удается продолжить. Вы решили не продолжать. Уход. Вы решили установить Limine на этот раздел: Вы можете продолжить, но вы должны удалить конфликт перед загрузкой с загрузчиком Limine. Если конфликт находится на USB-накопителе, удалите его перед загрузкой с Limine, установленным на внутренний диск. Требуется утилита efibootmgr. Утилита lsblk от util-linux слишком старая, не понимает PARTUUID. Утилита lsblk от util-linux слишком старая, не понимает PTUUID. Требуется утилита lsblk из пакета util-linux. ничего не найдено Требуется утилита required из пакета coreutils. 