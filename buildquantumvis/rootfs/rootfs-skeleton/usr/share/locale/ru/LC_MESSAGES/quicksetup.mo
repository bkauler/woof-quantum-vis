��    S      �  q   L        �    y  �  D  1  D  v     �     �     �     �     �     	          0     E  �   V  -   #     Q  �  W  "   �     �       M        i     n     �     �     �     �  	   �     �     �     �  8     8   S  n   �  X  �     T     d     u  $   �     �  �   �  �  L  �   �  &   �   	   �   2   �      !     !!     -!  	   C!     M!     j!     �!     �!  .   �!  !   �!  #   �!     "  �   "  j  �"  �   H$     �$  �  �$  �   �'  Y   L(  '   �(  )   �(  	   �(     )     )  7  )     R,     `,     o,     �,     �,  ;   �,  @   �,     -     .-     G-  ~   O-  B  �-  �  /  (  �7  k  �=  �  K@     F     2F  %   ?F  *   eF     �F  (   �F  8   �F  *   G  (   9G  c  bG  C   �H     
I  d  I  ?   ~M     �M     �M  �   �M  
   xN  =   �N  7   �N  ,   �N     &O  '   CO     kO     O  #   �O  8   �O  �   �O  �   yP  �    Q  $  �Q  '   �U     V     9V  >   RV     �V    �V  *  �W  =  �[  E   4]     z]  S   �]  .   �]  !   ^     2^     R^  ?   o^  7   �^  !   �^     	_  Z   _  @   q_  L   �_  %   �_  �  %`  a  �a  �   
d  +   �d  S  	e  �  ]i  �   �j  T   �k  E   l     el     }l     �l  r  �l      !r     Br  ,   `r     �r  &   �r  �   �r  �   ks  $   �s  (   t     Dt  �   Yt        D          L   '   S       E         O   )   6   J                 %      8   =              ,   Q       K                      P   A   5              3   	   #   "                     B   (   N          +       F   :       7   4   G   ?         !   M   2           I       1       @       H   &                         -   C   9           .                *   <   $      0   >   R   ;                     /   
       <b>Screen resolution</b>
The choices are in the format, for example, <b>1024x768</b>, which means 1024 pixels (dots) horizontally and 768 pixels vertically.

<b>Refresh frequency</b>
Also listed is the vertical refresh frequency, for example <b>1024x768 60.0</b> means that the screen is refreshing (redrawing) 60 times per second. For older cathode-ray-tube monitors, a value of at least 75 is required to minimize flicker. For modern LCD screens, 60 is satisfactory, and even preferred in most cases.

<b>Warning 1</b>
After testing a resolution, you will be given the opportunity to make it permanent if you wish. <b>IF THE NEW RESOLUTION MESSES UP THE SCREEN, WAIT 60 SECONDS OR PRESS CTRL-ALT-BACKSPACE</b>

<b>Warning 2</b>
This resolution selection box uses the <b>xrandr</b> utility to set the resolution, and is intended for testing only, not for a permanent change, as this does not really change the default resolution, instead it switches resolutions after X has started, which causes a delay and flicker at startup and may have other undesirable side-effects. With some X drivers/hardware it may not work at all. Instead, run the Video Wizard to choose a permanent resolution. <b>Video Upgrade Wizard</b>
What this offers depends on the particular build of Puppy Linux. It may offer upgrade PETs for the commercial nVidia and ATI Xorg drivers. In the case of Wary Puppy, there is an offer to upgrade Xorg from version 7.3 to 7.6. Some builds of Puppy do not offer any upgrades via this Wizard, but may have upgrade PETs available elswhere, such as via the Puppy Package Manager or the Puppy Forum.

<b>Note 1:</b> If you need to run either of these Wizards later on, they are available via the <b>setup</b> icon on the desktop, or the <b>Setup</b> category in the menu. 
<b>Note 2:</b> The <b>Xorg Video Wizard</b> via the <b>setup</b> icon is a full graphical application, with many more options than the text-mode version, such as finetuning screen dimensions and adjusting brightness. You might want to run that afterward to further finetune your X configuration. <b>Warning</b>
It is NOT recommended to choose <b>Permanent</b> here, as the default resolution is not really changed, instead it switches resolutions after X has started, which causes a delay and flicker at startup and may have other undesirable side-effects. Instead, run the Video Wizard to choose a permanent resolution. All computers have a hardware clock that runs continuously from a battery, even when the computer is turned off. This clock can be set either to the local time or to UTC.

<b>UTC/GMT</b>
UTC is Coordinated Universal Time, which is basically the same as GMT, Greenwich Mean Time. The latter is the time at the Royal Observatory in Greenwich, London -- this is a time that does not have daylight saving or summer time as does the rest of the UK. It is said to simplify things if the computer hardware clock is set to UTC.

<b>Local time</b>
By default, Puppy Linux assumes that the hardware clock is set to local time, as this is what MS DOS and Windows systems normally use. If you were to change the hardware clock to UTC, you would also have to ensure that all operating systems recognise that, else they will show the wrong time/date. Can you see this? Cancel Change Resolution Change resolution to Choose Locale Choose Timezone Choose keyboard layout Choose main language Choose time zone Click <b>Permanent</b> button to keep this resolution permanently.
Click <b>Session</b> button to keep this resolution for current session only.
Click <b>Cancel</b> button to revert to default resolution. Click the OK button to change the resolution. Close Computer keyboards have different layouts, depending on the country and language.

<b>Note:</b> After making a choice here, clicking the <b>OK</b> button will update the layout in X (graphical desktop) but not the console (when X not running) -- that requires a reboot.

<b>Technical</b>
The choice made here is saved in /etc/keymap. The value specifies a console layout, from the directory /lib/keymaps. When X starts, the startup script /usr/bin/xwin translates that to the equivalent for X, from directory /etc/X11/xkb/symbols -- note, if no match is found, X falls back to using <b>us</b> layout -- please report if that happens to you. Confirm the settings and click OK: Country Settings Country Wizard Dead mouse? <b>TAB</b> key to select this button then press <b>ENTER</b> key: Exit Hardware clock set to UTC Help: Keyboard Layout Help: Keyboard Numlock Help: Locale Help: Time Zone Help: UTC Help: UTF-8 Help: Xorg Wizards Help: Xrandr Screen Resolution If the Wizard fails to set desired resolution, try this: If the Wizards fail to set desired resolution, try this: If the new resolution does not work, wait 60 seconds, or hit the CTRL-ALT-BACKSPACE key combination to kill X. If you tick a checkbox, you are flagging your wish to run the Wizard, and it will happen after you click the <b>OK</b> button.

<b>Xorg Video Wizard</b>
This is a text-mode application (keyboard-driven, no mouse, and requires exiting from X (the graphical desktop) to run), that enables you to set the screen resolution, refresh frequency, correct mouse/touchpad, and find a correct hardware-specific driver. Note, the <b>vesa</b> driver is generic, for any video hardware, but is slow. In some cases there is more than one hardware-specific driver and you have to choose the best one -- for example: Keyboard Layout Keyboard numlock Language and Country Launch the NVIDIA X Server Settings. Main Language Make sure no other applications are running, and click the <b>Restart X</b> button, which will exit from the graphical desktop and restart it. Most keyboards have a group of keys on the right side of the keyboard that are labeled <b>0</b> to <b>9</b>. These are intended for when heavy entry of numbers is required. They are dual-purpose, that is can also serve as arrow-keys, Home, End, PgUp, PgDn -- and the latter is usually the default. That is, numlock defaults to off.

If the checkbox is ticked, numlock will be on when X starts.

<b>Technical</b>
The file /root/Startup/numlockx specifies whether numlock is on or off. if the file attribute is executable, then it will execute when X starts. The file contains either <b>numlockx on</b> or <b>numlockx off</b>, and may be edited directly if desired. Or, if the <b>Exit</b> button is clicked, the desktop will be retained, and changes marked with <b>restart</b> will not take effect. However, they will take effect the next time that X is started. Or, it will be canceled in 60 seconds. Permanent Please set these to suit your country and language Quick Country Setup Quick Setup Quick Setup: finished Restart X Run the Video Upgrade Wizard Run the Xorg Video Wizard Screen Resolution Session Set font, money and language for your location Set screen resolution with xrandr Set time and date for your location The The generic <b>vesa</b> video driver is currently being used. It is recommended that you run the Video Wizard to try and load a hardware-specific driver. Failing that, try the Video Upgrade Wizard: The locale setting provides money, date and font localization for your country.

The format is, for example, <b>en_US</b> where <b>en</b> designates the language and <b>US</b> designates the country in which it is spoken and written.

<b>Technical</b>
The chosen locale file is generated in /usr/lib/locale (if not already) and LANG variable set in /etc/profile. These are available resolutions that the <b>xrandr</b> utility can change the screen to. Please choose the one that you would like to test. These are the changed items: This needs to be set to ensure that Puppy knows the correct time and date.
If you cannot find an entry for your location, choose one of the <b>GMT</b> entries. Finding the correct entry is best, as it automatically applies DST (Daylight Saving Time), whereas the GMT entries are fixed offsets from the GMT (UTC) reference.

<b>Technical</b>
After making a choice, /etc/localtime will point to the appropriate timezone file in /usr/share/zoneinfo. However, note that the GMT files (in /usr/share/zoneinfo/Etc) actually have the opposite sign from the GMT entry that you have chosen -- this is just a technical detail, it does not affect the user in any way. Those marked with <b>restart</b> require a restart of X (the graphical desktop) to take effect. Recommend, if it is ok to continue without restarting X for now, choose that option (<b>Exit</b> button). Tick checkbox if hardware clock is set to UTC, untick if hardware clock set to local time Tick checkbox to support UTF-8 encoding Tick checkbox to turn on keyboard numlock Time Zone Timezone UTF-8 encoding UTF-8 is a Unicode standard in which international characters are represented in 8, 16 or more bits, and plain ASCII (8th bit = 0) text files are valid UTF-8 encoding. UTF-8 has become the defacto standard in Linux. The reason is, basically, that UTF-8 encoded files can be used anywhere in the world and do not need a particular <b>character set</b> translation.

<b>Note 1:</b> Many Puppy Linux users do not use UTF-8 as there is a slight speed penalty running applications -- all English users are ok running without UTF-8.
     
<b>Note 2:</b> Non-unicode rendering is achieved by 8-bit character sets, such as ISO-8859-1 for normal Latin1 English, or ISO-8859-2 for Eastern European Latin2 languages.

Basically, if your language is not a <b>Latin</b> derivative, such as all Asian languages, then you will need UTF-8. UpgradeWizard Video Settings Video Upgrade Wizard VideoWizard Welcome to %s! Welcome! Please set these to suit your country and language Welcome! Please set these to suit yourself, then click <b>OK</b> Xorg Video Wizard Xrandr Screen Resolution restart video driver is currently being used. Good, but if you need to adjust screen resolution or displacement, run the Video Wizard: Project-Id-Version: Racy-5.2
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2011-10-27 16:49+0300
PO-Revision-Date: 
Last-Translator: Sergey Rodin <rodin.s@rambler.ru>
Language-Team: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Poedit-Language: Russian
X-Poedit-Country: UKRAINE
 <b>Разрешение экрана</b>
Варианты выбора в формате, например, <b>1024x768</b>, что означает 1024 пикселя (точки) горизонтально и 768 пикселей вертикально.

<b>Частота обновления</b>
Также в списке частота обновления кадров, например, <b>1024x768 60.0</b> означает, что экран обновляется (перерисовывается) 60 раз в секунду. Для старых мониторов с электронно-лучевой трубкой, требуется значение, по крайней мере 75, чтобы уменьшить мерцание. Для современных LCD экранов 60 - это достаточно, и даже предпочтительно в большинстве случаев.

<b>Предупреждение 1</b>
После проверки разрешения вам будет дана возможность сделать его постоянным. <b>ЕСЛИ НОВОЕ РАЗРЕШЕНИЕ ИСПОРТИТ ИЗОБРАЖЕНИЕ, ПОДОЖДИТЕ 60 СЕКУНД ИЛИ НАЖМИТЕ CTRL-ALT-BACKSPACE</b>

<b>Предупреждение 2</b>
Для выбора разрешения используется утилита <b>xrandr</b> и она предназначена только для тестирования, а не для постоянного изменения разрешения т.к. она на самом деле не меняет разрешения по умолчанию, вместо этого переключает разрешение после запуска X, что вызывает задержку и мерцание при старте и может иметь другие нежелательные побочные эффекты. С некоторыми драйверами/оборудованием она может вообще не работать. Вместо этого, запустите Мастер настройки Xorg для выбора постоянного разрешения. <b>Мастер обновления видео</b>
То, что он предлагает, зависит от конкретной сборки Puppy Linux. Он может предложить обновить пакеты коммерческих драйверов nVidia и ATI. В случае Wary Puppy, он предлагает обновить Xorg с версии 7.3 до 7.6. Некоторые сборки Puppy не предлагают никаких обновлений с помощью этого мастера, но могут иметь пакеты обновления доступные в других местах, таких как Менеджер пакетов Puppy или форум Puppy.

<b>Примечание 1:</b> Если вам нужно запустить любой из этих мастеров позже, они доступны через значок <b>Настройка</b> на рабочем столе, или категорию <b>Настройка</b> в меню.
<b>Примечание 2:</b> <b>Мастер настройки Xorg</b> при запуске через <b>Настройку</b> -- это полное графическое приложение имеющее больше опций, чем текстовая версия: таких, как настройка параметров экрана или настройка яркости. Вы, возможно, захотите запустить его позже для дальнейшей более точной настройки X. <b>Предупреждение</b>
Не рекомендуется выбирать <b>Постоянно</b> т.к. разрешение по-умолчанию на самом деле не меняется, вместо этого оно переключается после запуска X, что вызывает задержку и мерцание при старте и может иметь другие нежелательные побочные эффекты. Вместо этого запустите Мастер настройки Xorg и выберите постоянное разрешение. Все компьютеры имеют аппаратные часы, которые постоянно работают от батарейки, даже когда компьютер выключен. Эти часы можно установить или на местное время или на UTC.

<b>UTC/GMT</b>
UTC - это всемирное координированное время, которое в основном такое же, как и GMT, среднее время по Гринвичу. Последнее -- это название Королевской обсерватории в Гринвиче, Лондон -- GMT не переводят на летнее время, в отличие от остальной части Великобритании. Говорят, что это упрощает вещи, если аппаратные часы установлены на UTC.

<b>Местное время</b>
По умолчанию, Puppy Linux подразумевает, что аппаратные часы установлены на местное время, т.к. это обычно используется в MS DOS и Windows. Если вы меняете аппаратные часы на UTC, вам стоит также убедиться, что все операционные системы это поддерживают, иначе они будут показывать неправильные время и дату. Вы это видите? Отмена Изменить разрешение Изменить разрешение на Выбрать локаль Выберите часовой пояс Выберите раскладку клавиатуры Выберите основной язык Выберите часовой пояс Нажмите <b>Постоянно</b> чтобы оставить это разрешение постоянным.
Нажмите <b>Сессия</b> чтобы оставить это разрешение только на эту сессию.
Нажмите <b>Отмена</b> чтобы вернуть разрешение по-умолчанию. Нажмите OK чтобы изменить разрешение. Закрыть Компьютерные клавиатуры имеют различные раскладки, в зависимости от страны и языка.

<b>Примечание:</b> После того, как вы сделали выбор, нажатие кнопки <b>OK</b> обновит раскладку в X (графический рабочий стол) но не в консоли (когда X не работает) -- для этого нужна перезагрузка.

<b>Технические подробности</b>
Выбор, сделанный здесь, сохраняется в /etc/keymap. Значение определяет раскладку в консоли, из каталога /lib/keymaps. Во время запуска X, скрипт /usr/bin/xwin переводит это в эквивалент для X, из каталога /etc/X11/xkb/symbols -- заметьте, если совпадений не найдено, X возвращается к раскладке <b>us</b> -- пожалуйста сообщите, если это случится с вами. Подтвердите настройки и нажмите OK: Настройки страны Выбор страны Не работает мышь? С помощью <b>TAB</b> выберите эту кнопку и нажмите <b>ENTER</b>: Выход Аппаратные часы установлены на UTC Справка: Раскладка клавиатуры Справка: Numlock клавиатуры Справка: локаль Справка: Часовой пояс Справка: UTC Справка: UTF-8 Справка: Мастера Xorg Справка: Разрешение экрана Xrandr Если мастеру не удаётся установить требуемое разрешение, попробуйте это: Если мастерам не удаётся установить желаемое разрешение, попробуйте это: Если новое разрешение не работает, подождите 60 секунд или нажмите комбинацию CTRL-ALT-BACKSPACE чтобы завершить работу X. Если вы установите флажок, вы обозначите своё желание запустить Мастер, и это произойдёт после того, как вы нажмёте <b>OK</b>.

<b>Мастер настройки Xorg</b>
Это консольное приложение (управляемое клавиатурой, без мыши, и для работы требует выхода из X (графического режима)), что позволит вам установить разрешение экрана, частоту обновления, настроить мышь/тачпад, и найти правильный драйвер для вашего оборудования. Заметьте, драйвер <b>vesa</b> общий, для любого видеооборудования, но он медленный. В некоторых случаях есть несколько подходящих драйверов и вам нужно выбрать лучший -- например: Раскладка клавиатуры Numlock клавиатуры Язык и страна Запустить настройки X сервера NVIDIA. Основной язык Убедитесь, что никакие другие приложения не запущены и нажмите кнопку <b>Перезагрузка X</b>, это приведёт к выходу из графического десктопа и к его перезапуску. На большинстве клавиатур есть группа клавиш с правой стороны клавиатуры, которые обозначены от <b>0</b> до <b>9</b>. Они нужны, когда нужно вводить много номеров. Они имеют двойное предназначение -- также могут служить, как стрелки, Home, End, PgUp, PgDn -- и последнее обычно по умолчанию. По умолчанию numlock выключен.

Если флажок установлен, numlock будет включен при запуске X.

<b>Технические подробности</b>
Файл /root/Startup/numlockx определяет включен numlock или нет, если файл исполняемый, тогда он будет выполнен при запуске X. Этот файл содержит или <b>numlockx on</b> или <b>numlockx off</b> и при желании его можно отредактировать. Или, если нажата кнопка <b>Выход</b>, десктоп продолжит работу и изменения отмеченные как <b>перезапуск</b> не будут применены. Однако, они будут применены при следующем запуске X. Или это будет отменено через 60 секунд. Постоянно Пожалуйста выберите подходящую страну и язык Быстрая настройка страны Быстрые настройки Quick Setup: завершено Перезагрузить X Запустить Мастер обновления видео Запустить Мастер настройки Xorg Разрешение экрана Сессия Настройка шрифтов, денег и языка для вашей локали Установить разрешение экрана с xrandr Настройка времени и даты для вашей локали Сейчас используется Сейчас используется общий драйвер <b>vesa</b>. Рекомендуется запустить Мастер настройки видео и попробовать загрузить специфичный для оборудования драйвер. Если это не удаётся, попробуйте Мастер обновления видео:  Настройки локали определяют валюту, дату и шрифты для вашей страны.

Используется формат, например, <b>en_US</b>, где <b>en</b> указывает язык, а <b>US</b> указывает страну, в которой на этом языке говорят и пишут.

<b>Технические подробности</b>
Выбранная локаль будет сгенерирована в /usr/lib/locale (если её там уже нет) и переменная LANG установлена в /etc/profile. Доступные разрешения, которые утилита <b>xrandr</b> может изменить. Пожалуйста выберите то, которое вы хотите проверить. Эти параметры изменены: Это нужно установить, чтобы быть уверенным, что Puppy знает правильные время и дату.
Если вы не можете найти запись для вашего местоположения, выберите одну из записей <b>GMT</b>. Лучше найти правильную запись т.к. она учитывает переход на зимнее/летнее время, тогда, как записи GMT фиксированы по отношению к GMT (UTC).

<b>Технические подробности</b>
После того, как выбор сделан, /etc/localtime будет указывать на подходящий файл часового пояса в /usr/share/zoneinfo. Однако, заметьте, что файлы GMT (в /usr/share/zoneinfo/Etc) фактически имеют обратный знак от выбранной вами записи GMT -- это техническая деталь, которая никак не касается пользователя. Элементы отмеченные словом <b>перезапуск</b> требуют перезапуска X (графического рабочего стола) для применения изменений. , Если пока-что можно продолжать без перезапуска X рекомендуется выбрать эту опцию (кнопку <b>Выход</b>). Установите флажок если аппаратные часы установлены на UTC, уберите если аппаратные часы установлены на местное время Установите флажок для поддержки кодировки UTF-8 Установите флажок чтобы включить numlock Часовой пояс Часовой пояс Кодировка UTF-8 UTF-8 - это стандарт Юникод в котором международные символы представлены в 8, 16 или более бит, и обычный текст ASCII (8th bit = 0) - также в кодировке UTF-8. UTF-8 стал де-факто стандартом в Линукс. Причина в том, что файлы в UTF-8 могут быть использованы где угодно в мире и не требуют отдельного перевода <b>наборов символов</b>
<b>Примечание 1:</b> Многие пользователи Puppy не используют UTF-8 т.к. при этом слегка теряется скорость приложений -- все английские пользователи могут нормально работать без UTF-8.
     
<b>Примечание 2:</b> Рендеринг без юникода достигается 8-ми битными наборами символов, такими как ISO-8859-1 для обычного Latin1 English, или ISO-8859-2 для Восточноевропейских Latin2 языков.

В основном, если ваш язык, как, например, все азиатские языки, не происходит от <b>латыни</b>, тогда вам будет нужен UTF-8. МастерОбновления Настройки видео Мастер обновления видео МастерXorg Добро пожаловать в %s! Добро пожаловать! Пожалуйста измените настройки, чтобы подходили для вашей страны и языка Добро пожаловать! Пожалуйста выберите подходящие настройки и нажмите <b>OK</b> Мастер настройки Xorg Xrandr разрешение экрана перезапуск видео драйвер. Хорошо, но если вам нужно настроить разрешение экрана или смещение, запустите Мастер настройки Xorg: 