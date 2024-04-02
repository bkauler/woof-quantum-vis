#!/bin/sh
#called from /usr/sbin/quicksetup
#170812 generate welcome.htm, , only view if passed param = "run"
#180409 images/desktop1.jpg now desktop1.png
#181028 rename 'repository' folder to 'releases'.
#181219 updated images, links.
#190110 also called from 3buildeasydistro. prefix call with LANG=$NEWLANG
#190221 url fix.
#190408 thud: so weird, surfer crashes with new-line at end of file (after </html>).
#200620 6 BLOBs made translatable
#20210525 changed forum link.
#20220525 optional without containers.
#20220526 current css for text over image not work in helpsurfer, just use image. see: 3buildeasydistro
#         note: <!-- BLOB1 --> comment disabled as cannot nest comments.
#20221111 improve explanation boot and working drives.
#20230214 desktop image translated text overlay by svg.
#20230530 no longer have separate sfs icon on desktop. pkg icon has 4 package managers.
#20240322 quirkyvoid.

export TEXTDOMAIN=easyhelp
export OUTPUT_CHARSET=UTF-8

PARAM1="$1"

#20220525
EOS_SUPPORT_CONTAINERS='0' #old 1=yes, 0=no
. /root/.packages/build-choices #has EOS_SUPPORT_CONTAINERS
. /etc/DISTRO_SPECS #20240322

#190110
##LANG might not be correct at first bootup, after having changed language in QuickSetup
##and not yet restarted X. so get it like this:
#NEWLANG="`grep '^LANG=' /etc/profile | tr -d "'" | tr -d '"' | cut -f 2 -d '='`"
#xNEWLANG=${NEWLANG:0:2} #ex: de
NEWLANG="$LANG"
xNEWLANG="${NEWLANG%_*}"

if [ ! -f /usr/share/locale/${xNEWLANG}/LC_MESSAGES/easyhelp.mo ];then
 xNEWLANG=en
fi
export LANGUAGE="$xNEWLANG"

###20230214###
S01="$(gettext '4 package')"
S02="$(gettext 'managers')"
S03="$(gettext 'or right-click on desktop')"
S04="$(gettext 'Containerized')"
S05="$(gettext 'RAM to drive')"
S06="$(gettext 'Save session')"
S07="$(gettext 'latest version')"
S08="$(gettext 'Update QV to')"
S09="$(gettext 'over the network')"
S10="$(gettext 'Share files &amp; printers')"
S11="$(gettext 'Connect to the Internet')"
S12="$(gettext 'Menu: bottom-left of screen,')"
S13="$(gettext 'apps')"
OVERLAYSVG="/usr/share/doc/easy/images/overlay.svg"
if [ -f $OVERLAYSVG ];then
 rm -f $OVERLAYSVG
fi
cat >> ${OVERLAYSVG} <<_EOF1
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg width="640" height="480" viewBox="0 0 169.33334 127" version="1.1" xmlns="http://www.w3.org/2000/svg">
<style>
  .mainfont {
    font-style:normal;font-variant:normal;font-weight:bold;font-size:5.6px;font-family:'DejaVu Sans';fill:#ff0000;fill-opacity:1;stroke:none;stroke-width:0;stroke-dasharray:none;
  }
  .mainline {
    fill:#ff0000;fill-opacity:1;stroke:#ff0000;stroke-width:1.05833;stroke-dasharray:none;stroke-opacity:1;
  }
</style>

<text
     class="mainfont"
     x="55.018375"
     y="19.375782"
     id="text6"><tspan
       x="55.018375"
       y="19.375782"
       id="tspan4">3 package</tspan></text><text
     class="mainfont"
     x="54.59116"
     y="25.497089"
     id="text10"><tspan
       x="54.59116"
       y="25.497089"
       id="tspan8">managers</tspan></text><text
     class="mainfont"
     x="20.686241"
     y="106.62888"
     id="text14"><tspan
       x="20.686241"
       y="106.62888"
       id="tspan12">or right-click on desktop</tspan></text><text
     class="mainfont"
     x="34.905773"
     y="58.326523"
     id="text30"><tspan
       x="34.905773"
       y="58.326523"
       id="tspan28">latest version</tspan></text><text
     class="mainfont"
     x="34.52084"
     y="51.277962"
     id="text34"><tspan
       x="34.52084"
       y="51.277962"
       id="tspan32">Update QV to</tspan></text><text
     class="mainfont"
     x="25.150906"
     y="76.819824"
     id="text38"><tspan
       x="25.150906"
       y="76.819824"
       id="tspan36">over the network</tspan></text><text
     class="mainfont"
     x="19.260212"
     y="69.074661"
     id="text42"><tspan
       x="19.260212"
       y="69.074661"
       id="tspan40">Share files &amp; printers</tspan></text><text
     class="mainfont"
     x="9.4059362"
     y="88.152443"
     id="text46"><tspan
       x="9.4059362"
       y="88.152443"
       id="tspan44">Connect to the Internet</tspan></text><text
     class="mainfont"
     x="1.9313998"
     y="99.25724"
     id="text50"><tspan
       x="1.9313998"
       y="99.25724"
       id="tspan48">Menu: bottom-left of screen,</tspan></text><path
     class="mainline"
     d="m 15.113493,28.042394 7.496394,34.626201"
     id="path56" /><path
     class="mainline"
     d="M 42.208066,13.135145 53.75887,20.168034"
     id="path62" /><path
     class="mainline"
     d="M 25.856377,27.524055 38.050676,44.727933"
     id="path64" /><path
     class="mainline"
     d="M 5.395398,28.692405 12.451394,81.20975"
     id="path66" /><path
     class="mainline"
     d="m 7.362791,100.69911 1.784856,23.20313"
     id="path68" />

</svg>
_EOF1

#merge the desktop images...
#note, desktop0.png is created by 3buildeasydistro
rsvg-convert ${OVERLAYSVG} -o /usr/share/doc/easy/images/overlay.png
pngoverlay.sh /usr/share/doc/easy/images/desktop0.png /usr/share/doc/easy/images/overlay.png /usr/share/doc/easy/images/desktop1.png

###########################################
BLOB0="$(gettext 'Easy Operating System')"
BLOB1="$(gettext 'Containerized<br>apps')"
BLOB2="$(gettext 'Install<br>mega-apps')"
BLOB3="$(gettext 'Share files & printers<br>over the network')"
BLOB4="$(gettext 'Connect to the Internet')"
BLOB5="$(gettext 'Menu: bottom-left of screen,<br>or<br> right-click on desktop')"

MSGh1="$(gettext 'Welcome,')"
MSGh2="$(gettext 'you are using QV for the first time!')"
MSGb1="$(gettext 'QV is a "new paradigm" for an Operating System, a blend of the best ideas from EasyOS, Puppy Linux and Quirky Linux, and a fundamental rethink of security, maintainability and ease-of-use.')"
MSGb2="$(gettext 'Reading this for the first time, you want a quick overview, to grasp the basic ideas behind QV, what is special, practical usage, and why should you even bother to switch from the OS you are currently using?')"
MSGd1="$(gettext 'The desktop')"
MSGd2="$(gettext 'Firstly, the desktop. It looks pretty much like any desktop, a bit retro, but we consider that to be a good thing. Rather than lengthy explanations, the best way to discover what the desktop can offer you, is just to explore. Have fun, poke around in the menu, click the icons in the tray, mouse-over will also pop-up useful information.')"
MSGd3="$(gettext 'Here is a snapshot of the desktop with brief comments to get you started:')"
MSGd4="$(gettext 'Explore the tray applets:')"
MSGd5="$(gettext 'Mouse-over each one, left-click and right-click on them to discover more.')"
MSGd6="$(gettext 'Discover the drive partitions:')"
MSGd7="$(gettext 'Click to mount, click "close-box" to unmount.')"
MSGd8a="$(gettext 'In these example pictures, QV is installed on a USB Flash drive, that identifies itself as sdb. There are two partitions, sdb1 is the <i>boot</i> partition, and sdb2 is the <i>working</i> partition. Note the orange rectangle -- this means sdb2 is mounted and cannot be unmounted.')"
MSGd8b="$(gettext 'Drive sda is an internal drive, and sda2 is mounted, and can be unmounted by clicking on the "x".')"
MSGd8c="$(gettext 'Try for yourself: click any partition, and it will mount and the file manager will open.')"
MSGd9="$(gettext 'Using QV is easy; however, to discover the hidden power, it is necessary to have some appreciation of what is going on underneath...')"
MSGw1="$(gettext 'How QV works')"
MSGw2="$(gettext 'It has already been stated that sdb1 is the boot-partition in the above pictures. That contains the Limine boot loader, which is the very first menu you see at power-on. The boot loader is responsible for loading the Linux kernel and the first stage of the Linux operating system. The kernel is named "vmlinuz", the first-stage file is "initrd"; they are in the boot-partition. The QV operating system is in sdb2, the working-partition.')"
MSGw3="$(gettext 'After bootup, if you open the file manager, and look at "/", the top-level of the directories, this is what you see: looks as you would expect, yes?')"
MSGw4a="$(gettext 'However, if you look in sdb2, the working-partition, this is what you see:')"
MSGw4c="$(gettext 'What are those folders for, and whereabouts is "/"?')"
MSGw5="$(gettext 'Some hints as to what those folders do:')"
MSGw6a="$(gettext 'Encrypted folder for containers, as Easy is a container-friendly OS and can run apps securely')"
MSGw6b="$(gettext 'Folder where you keep all your own files, such as photos, downloads, documents. Optionally encrypted.')"
MSGw6c="$(gettext 'For anything. AppImages and Flatpaks install here. Build area for woofQV.')"
MSGw6d="$(gettext 'Each app may run as its own user; home folders are in here. Optionally encrypted.')"
MSGw7="$(gettext 'The quick answer to whereabouts of that "/", is that it is in a btrfs subvolume inside the working-partition. Which might be a meaningless explanation! In which case, read this online web page:')"

MSGw8="$(gettext 'You can just blissfully go ahead and use Easy, however, if you are intrigued by how "/" is created, and the purpose of those folders in the working partition, please read this online web page:')"
MSGw9="$(gettext 'As you are reading this, you must already have Easy installed. Probably on a USB Flash drive, which is fine. However...')"
MSGi1="$(gettext 'How to install Easy')"
MSGi2="$(gettext 'There is absolutely no problem with running Easy indefinitely from a USB Flash stick, however, you are likely to reach that point where you would like to install Easy on the internal hard drive of your PC.')"
MSGi3="$(gettext 'No problem! In the "Setup" menu, there is "Easy Installer". Run that, and you will be guided through installing Easy to a hard drive.')"
MSGi4="$(gettext 'There is also an online web page that will clarify the details:')"
MSGx1="$(gettext 'More help')"
MSGx2="$(gettext 'Easy has more local help documents like this one. There are also more online help documents. Also a forum. Take your pick:')"
MSGx3a="$(gettext 'Local help:')"
MSGx3b="$(gettext 'Online blog:')"
MSGx3c="$(gettext 'Online forum:')"
MSGx4="$(gettext 'Regards,')"

MSGk1="$(gettext 'Or, you may have a desktop with less icons, even all icons in the tray:')"
MSGk2="$(gettext 'In the "/" snapshot, notice /files -- apps default to open|save|download here, but it is a link to /mnt/sdb2/easyos/files. So /files is not in RAM, it is for permanent storage of your personal files.')"

MSGz1="$(gettext 'Brief introduction to Quirky Linux')"
MSGz2="$(gettext 'How to install Easy OS on your hard drive')"

NEWFILE="/usr/share/doc/easy/welcome_${xNEWLANG}.htm"
[ -f ${NEWFILE} ] && rm -f ${NEWFILE}

cat >> ${NEWFILE} <<_EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
 <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
 <meta content="Barry Kauler" name="author">
 <meta content="easy puppy quirky linux qv btrfs fscrypt operating system pc" name="description">
 <!-- BK makes table width scale to fit device screen width... -->
 <!-- <meta name="viewport" content="width=device-width"> -->
 <meta name="viewport" content="width=655px">
 <title>${BLOB0}</title>
 <style>
 .t {
	 position:absolute;
	 background-color:#DBDBFF;
	 color:#DB0000;
	 background-color:#EEEEEE;
	 margin:0;padding:6px 2px;
	 font:sans-serif 18px/28px bold;
	 text-align:center;
	 border:4px solid red;border-radius:10px;
  }
 </style>
</head>
<body>
 <table cellspacing="2" cellpadding="2" border="0" width="655" align="center">
  <tbody>
   <tr>
    <td valign="top">
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr>
        <td valign="top"><img src="../logo96.png" alt="easy logo" width="96" height="96"><br>
        </td>
        <td valign="top">&nbsp;&nbsp; <br>
         <b><font size="+3">${MSGh1}</font></b><br>
         <font size="+3">${MSGh2}</font>
        </td>
       </tr>
      </tbody>
     </table>
     <br>
     ${MSGb1} <br>
     <br>
     ${MSGb2} <br>
     <h2>${MSGd1}</h2>
     ${MSGd2} <br>
     <br>
     ${MSGd3} <br>
     
 <img src="images/desktop1.png" alt="desktop1" width="640" height="480"> 
<!--     <div style="position:relative;width:640px;height:480px;background:url(images/desktop1.png);background-repeat: no-repeat;">
		 <div class="t" style="top:96px;left:480px;width:144px;">${BLOB1}</div> --BLOB1--
		 <div class="t" style="top:70px;left:204px;width:144px;">${BLOB2}</div>
		 <div class="t" style="top:150px;left:98px;width:216px;">${BLOB3}</div>
		 <div class="t" style="top:230px;left:8px;width:248px;">${BLOB4}</div>
		 <div class="t" style="top:330px;left:4px;width:292px;">${BLOB5}</div> -->
     </div> <!-- 200620 -->

     <br>
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr>
        <td valign="top">${MSGk1}
        </td>
        <td valign="top"><img src="images/icon-free-desk.jpg" alt="applets" width="560" height="315">
        </td>
       </tr>
      </tbody>
     </table>

     <br>
     ${MSGd4}
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr>
        <td valign="top">${MSGd5}
        </td>
        <td valign="top"><img src="images/tray-applets.png" alt="applets" width="314" height="32">
        </td>
       </tr>
      </tbody>
     </table>
     <br>
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr>
        <td valign="top">
         ${MSGd6} <br>
         ${MSGd7}
        </td>
        <td valign="top"><img src="images/drive-icons.png" alt="drive-icons" width="259" height="76"><br>
        </td>
       </tr>
      </tbody>
     </table>
     <br>
     ${MSGd8a} <br>
     ${MSGd8b} <br>
     ${MSGd8c} <br>
     <br>
     ${MSGd9} <br>
     <h2>${MSGw1}</h2>
     ${MSGw2}<br>
     <br>
     ${MSGw3}<br>
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr>
        <td valign="top"><img src="images/top-of-rootfs.png" alt="top-of-layers" width="608" height="314"><br>
        </td>
       </tr>
      </tbody>
     </table>
     <br>
     ${MSGw4a}<br>
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr>
        <td valign="top">
         <img src="images/working-partition-top.png" alt="working-partition-top"><br>
        </td>
        <td valign="top"><img src="images/working-partition-down.png" alt="working-partition"><br>
        </td>
       </tr>
      </tbody>
     </table>
     ${MSGw4c}
     <br><br>
     ${MSGw5} <br>
     <table cellspacing="2" cellpadding="2" border="0" width="100%">
      <tbody>
       <tr><td valign="top"><b>containers</b></td><td valign="top">${MSGw6a}</td></tr>
       <tr>
        <td valign="top"><b>data</b>
        </td>
        <td valign="top">${MSGw6c}
        </td>
       </tr>
       <tr>
        <td valign="top"><b>files</b>
        </td>
        <td valign="top">${MSGw6b}
        </td>
       </tr>
       <tr>
        <td valign="top"><b>home</b>
        </td>
        <td valign="top">${MSGw6d}
        </td>
       </tr>
      </tbody>
     </table>
     <br>
     ${MSGw7}<br>
     <br>
     <font size="+1"><a href="https://bkhome.org/news/202403/quirky-has-returned.html">${MSGz1}</a>
     </font><br>
     <br>
     <br>
     <h2>${MSGx1}</h2>
     ${MSGx2} <br>
     <br>
     <table cellspacing="2" cellpadding="2" border="0">
      <tbody>
       <tr>
        <td valign="top"><b>${MSGx3a}</b>
        </td>
        <td valign="top"><font size="+1"><a href="help.htm">help.htm</a></font>
        </td>
       </tr>
       <tr>
        <td valign="top"><b>${MSGx3b}</b><br>
        </td>
        <td valign="top"><font size="+1"><a href="https://bkhome.org/news/">https://bkhome.org/news/</a></font></td>
       </tr>
       <tr>
        <td valign="top"><b>${MSGx3c}</b><br>
        </td>
        <td valign="top"><font size="+1"><a href="https://forum.puppylinux.com/viewforum.php?f=63">https://forum.puppylinux.com/</a></font></td>
       </tr>
      </tbody>
     </table>
     <br>
     ${MSGx4}<br>
     Barry Kauler<br>
    </td>
   </tr>
  </tbody>
 </table>
 <br>
</body>
</html>
_EOF

if [ "$EOS_SUPPORT_CONTAINERS" == "0" ];then #20220525
 sed -i '/BLOB1/d' $NEWFILE #remove text about containers.
 sed -i '/>containers</d' $NEWFILE
fi

#20240323
if [ "${DISTRO_NAME_SHORT}" != "QV" ];then
 sed -i -e "s%QV%${DISTRO_NAME_SHORT}%g" $NEWFILE
fi

#190408 thud: so weird, surfer crashes with new-line at end of file...
busybox truncate -s $(($(stat -c %s ${NEWFILE})-1)) ${NEWFILE}

ln -snf welcome_${xNEWLANG}.htm /usr/share/doc/easy/welcome.htm
[ "$PARAM1" == "run" ] && exec defaultlocalbrowser /usr/share/doc/easy/welcome.htm

###END###
