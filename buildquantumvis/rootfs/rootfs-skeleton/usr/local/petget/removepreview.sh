#!/bin/bash
#(c) Copyright Barry Kauler 2009, puppylinux.com  QUANTUMVISMARKER
#2009 Lesser GPL licence v2 (http://www.fsf.org/licensing/licenses/lgpl.html).
#called from pkg_chooser.sh and petget.
#package to be removed is TREE2, ex TREE2=abiword-1.2.3 (corrresponds to 'pkgname' field in db).
#installed pkgs are recorded in /root/.packages/user-installed-packages, each
#line a standardised database entry:
#pkgname|nameonly|version|pkgrelease|category|size|path|fullfilename|dependencies|description|
#optionally on the end: compileddistro|compiledrelease|repo| (fields 11,12,13)
#If X not running, no GUI windows displayed, removes without question.
#v424 support post-uninstall script for .pet pkgs.
#v424 need info box if user has clicked when no pkgs installed.
#110211 shinobar: was the dependency logic inverted.
#110706 update menu if .desktop file exists.
#111228 if snapmergepuppy running, wait for it to complete.
#120101 01micko: jwm >=547 has -reload, no screen flicker.
#120103 shinobar, bk: improve file deletion when older file in lower layer.
#120107 rerwin: need quotes around some paths in case of space chars.
#120116 rev. 514 introduced icon rendering method which broke -reload at 547. fixed at rev. 574.
#120203 BK: internationalized.
#120323 replace 'xmessage' with 'pupmessage'.
#131220 installpkg.sh supports quirky6, saves overwritten files. now restore.
#131221 examine later-installed packages, if safe to uninstall.
#131222 redesign, consider later-installed packages. do not uninstall if other-installed depend on it.
#131230 uninstall to use busybox applets only (busybox compiled statically). including run this script with ash. see also recover in /sbin/init.
#131230 in busybox-applets-only section, use LANG=C.
#140204 may need to run ldconfig if libs removed. see also installpkg.sh
#140213 after uninstall, remove pkg from /audit/packages. see also installpkg.sh
#140214 improve updating of /etc/ld.so.conf. see also installpkg.sh
#160923 rename Quirky Package Manager back to Puppy Package Manager. 170815 now PKGget
#170823 indexgen.sh no longer used.
#180518 maybe remove from rox right-click open-with menu.
#190219 esmourguit: extra gettext.
#190902 fix 131221, 131222, only allow uninstall if nothing dependent on it.
#20230309 have removed /usr/local/debget
#20230629 .desktop gets removed before remove rox mime links.
#20240228 work in easyvoid
#20240306 /usr/bin/xbps-remove path req'd. see /etc/profile.d/xbps-aliases
#20240307 if an app has been installed to run non-root, delete the .bin and .bin0
#20240310 uninstall fixes.
#20240419 qv changes.
#20240906 jwm-mode aware.

export TEXTDOMAIN=petget___removepreview.sh
export OUTPUT_CHARSET=UTF-8

. /etc/rc.d/PUPSTATE  #111228 this has PUPMODE and SAVE_LAYER.
. /etc/DISTRO_SPECS #has DISTRO_BINARY_COMPAT, DISTRO_COMPAT_VERSION
. /root/.packages/DISTRO_PKGS_SPECS
. /etc/uimanager #20240906 has UI_DESK_MANAGER=jwm or rox

case "$DISTRO_TARGETARCH" in #20240228
 amd64) xARCH='x86_64' ;;
 *)     xARCH="$DISTRO_TARGETARCH" ;;
esac
export XBPS_ARCH="$xARCH"
mkdir -p /tmp/woofQV

EVflg=0
if [ -d /var/db/xbps/keys ];then #20240228
 EVflg=1
fi

RP="$(realpath ${0})"
if [ "${RP/*buildquantumvis*/yes}" == "yes" ];then
 #running in woofQV
 L1="${RP/buildquantumvis*/buildquantumvis}"
 RUNNINGWOOF=yes
else
 #running in quirky
 L1='/usr/local/petget'
 #...note, woofQV has copied pkg-fix and support folders into /usr/local/petget
 RUNNINGWOOF=no
fi

xARCH="$(arch)"
mkdir -p /tmp/woofQV
. /var/local/woofQV/VARS #has E1

DB_pkgname="$TREE2"
ORIGLANG="$LANG" #131230

#140204 DISTRO_ARCHDIR_SYMLINKS and DISTRO_ARCHDIR are defined in file DISTRO_SPECS...
xARCHDIR="$DISTRO_xARCHDIR" #20230904

#v424 info box, nothing yet installed...
#if [ "$DB_pkgname" = "" ];then
if [ "$DB_pkgname" = "" -a "`cat /root/.packages/user-installed-packages`" = "" ];then #fix for ziggi
 export REM_DIALOG="<window title=\"$(gettext 'PKGget Package Manager')\" image-name=\"/usr/local/lib/X11/pixmaps/pkg24.png\">
  <vbox>
   <pixmap><input file>/usr/local/lib/X11/pixmaps/error.xpm</input></pixmap>
   <text><label>$(gettext 'There are no user-installed packages yet, so nothing to uninstall!')</label></text>
   <hbox>
    <button ok></button>
   </hbox>
  </vbox>
 </window>
"
 [ "$DISPLAY" != "" ] && gtkdialog --program=REM_DIALOG
 exit 0
fi
if [ "$DB_pkgname" = "" ];then #fix for ziggi moved here problem is  #2011-12-27 KRG
 exit 0                        #clicking an empty line in the gui would have
fi                             #thrown the above REM_DIALOG even if pkgs are installed

export REM_DIALOG="<window title=\"$(gettext 'PKGget Package Manager')\" image-name=\"/usr/local/lib/X11/pixmaps/pkg24.png\">
  <vbox>
   <pixmap><input file>/usr/local/lib/X11/pixmaps/question.xpm</input></pixmap>
   <text><label>$(gettext "Click 'OK' button to confirm that you wish to uninstall package") '$DB_pkgname'</label></text>
   <hbox>
    <button ok></button>
    <button cancel></button>
   </hbox>
  </vbox>
 </window>
" 
if [ "$DISPLAY" != "" ];then
 RET1="`gtkdialog --program=REM_DIALOG`"
 grep -q '^EXIT.*OK' <<<${RET1}
 [ $? -ne 0 ] && exit
fi

if [ ! -f /root/.packages/${DB_pkgname}.files ];then
 firstchar="${DB_pkgname:0:1}"
 possiblePKGS=`find /root/.packages -type f -iname "${firstchar}*.files"`
 possible5=`echo "$possiblePKGS" | head -n5`
 count=`echo "$possiblePKGS" | wc -l`
 [ ! "$count" ] && count=0
 [ ! "$possiblePKGS" ] && possiblePKGS="$(gettext 'No pkgs beginning with') ${firstchar} $(gettext 'found')"
 if [ "$count" -le '5' ];then
  WARNMSG="$possiblePKGS"
 else
  WARNMSG="$(gettext 'Found more than 5 pkgs starting with') ${firstchar}.
$(gettext 'The first 5 are')
$possible5"
 fi
 pupmessage -bg red "$(gettext 'WARNING:')
$(gettext 'No file named') ${DB_pkgname}.files $(gettext 'found in')
/root/.packages/ $(gettext 'folder.')
 
$0
$(gettext 'refusing cowardly to remove the package.')

$(gettext 'Possible suggestions are')
$WARNMSG

$(gettext 'Possible solution:')
$(gettext 'Edit') /root/.packages/user-installed-packages $(gettext 'to match the pkgname')
$(gettext 'and start again.')
"
 #rox /root/.packages
 #defaulttextviewer /root/.packages/user-installed-packages
 exit 101
 ###+++2011-12-27 KRG
fi

#what about any user-installed deps...
remPATTERN='^'"$DB_pkgname"'|'
DEP_PKGS="`grep "$remPATTERN" /root/.packages/user-installed-packages | cut -f 9 -d '|' | tr ',' '\n' | grep -v '^\\-' | sed -e 's%^+%%' | cut -f 1 -d '&'`" #names-only, one each line. 190902 cut off &*

#131222 do not uninstall if other-installed depend on it... 190902 fix
echo -n '' > /tmp/petget/other-installed-deps
DB_nameonly="$(grep "${remPATTERN}" /root/.packages/user-installed-packages | cut -f 2 -d '|' | tail -n 1)"
THISWANTS="$(grep "\+${DB_nameonly}[,|&]" /root/.packages/user-installed-packages | cut -f 1 -d '|')"
[ "$THISWANTS" ] && echo "${THISWANTS}" >> /tmp/petget/other-installed-deps

if [ -s /tmp/petget/other-installed-deps ];then
 OTHERDEPS="$(sort -u /tmp/petget/other-installed-deps | tr '\n' ' ')"
 Mcu1="$(gettext 'Cannot uninstall:')" #190219
 Mcu2="$(gettext 'Sorry, but these other installed packages depend on the package that you want to uninstall:')" #190219
 Mcu3="$(gettext 'Aborting uninstall operation.')" #190219
 pupmessage -bg '#ff8080' -fg black -title "${Mcu1} ${DB_pkgname}" "${Mcu2}

${OTHERDEPS}

${Mcu3}"
 exit 1
fi

#131221 131222 20240419
#check install history, so know if can safely uninstall...
REMLIST="${DB_pkgname}"
mkdir -p /tmp/petget
echo -n "" > /tmp/petget/FILECLASHES
echo -n "" > /tmp/petget/CLASHPKGS

#131230 from here down, use busybox applets only...
export LANG=C

#20230629 preserve .desktop files, coz want to read them later...
DESKTOPFILES="`grep '\.desktop$' /root/.packages/${DB_pkgname}.files | tr '\n' ' '`"
for ONEDESKTOP in $DESKTOPFILES
do
 cp -f ${ONEDESKTOP} /tmp/${ONEDESKTOP##*/}
done

#delete files...
if [ $EVflg -eq 1 ];then #20240228
 #remove using xbps...
 #20240301 the .xbps may be different from .pet name...
 DB_nameonly="$(grep "^${DB_pkgname}|" /root/.packages/user-installed-packages | cut -f 2 -d '|')"
 if [ -f ${E1}/converted-pkgs/${DB_nameonly} ];then
. ${E1}/converted-pkgs/${DB_nameonly}
  xterm -hold -title PKGget -e /usr/bin/xbps-remove ${CONV_XBPS_PKGVER}
 else
  xterm -hold -title PKGget -e /usr/bin/xbps-remove ${DB_pkgname}
 fi
 vSTATE="$(LANG=C xbps-query --show ${DB_pkgname} --property state)"
 if [ "$vSTATE" == "installed" ];then
  Mi="$(gettext 'Failed to uninstall package:') ${DB_pkgname}"
  popup "background=#ffa0a0 terminate=5 timecount=dn name=remfail level=top|<big>${Mi}</big>"
  exit 2
 fi
 rm -f /audit/packages/${DB_pkgname}* 2>/dev/null #this is a symlink.
else
 busybox cat /root/.packages/${DB_pkgname}.files | busybox grep -v '/$' | busybox xargs busybox rm -f #/ on end, it is a directory entry.
 #do it again, looking for empty directories...
 busybox cat /root/.packages/${DB_pkgname}.files |
 while read ONESPEC
 do
  if [ -d "$ONESPEC" ];then
   [ "`busybox ls -1 "$ONESPEC"`" = "" ] && busybox rmdir "$ONESPEC" 2>/dev/null #120107
  fi
 done
fi

export LANG="$ORIGLANG"
#131230 ...end need to use busybox applets?

#170823 indexgen.sh no longer used...
##fix menu...
##master help index has to be updated...
#/usr/sbin/indexgen.sh #${WKGDIR}/${APKGNAME}

#180518 maybe remove from rox right-click open-with menu.
DESKTOPFILES="`grep '\.desktop$' /root/.packages/${DB_pkgname}.files | tr '\n' ' '`"
for ONEDESKTOP in $DESKTOPFILES
do
 build-rox-sendto -/tmp/${ONEDESKTOP##*/} #20230629
done

#110706 update menu if .desktop file exists...
if [ -f /root/.packages/${DB_pkgname}.files ];then
 if [ "`grep '\.desktop$' /root/.packages/${DB_pkgname}.files`" != "" ];then
  #Reconstruct configuration files for JWM, Fvwm95, IceWM...
  /usr/sbin/fixmenus
  jwm -reload
 fi
fi

#140204 no longer exporting LD_LIBRARY_PATH in /etc/profile, so must update /etc/ld.so.conf and /etc/ld.so.cache
#glibc template changed, 'ldconfig' now in main f.s., not in devx.
#note, similar code is in installpkg.sh
LDFLG=0 #140214 improve filtering, as in installpkg.sh...
for iLIB in `grep '/lib/$' /root/.packages/${DB_pkgname}.files | sort -u | grep -v -E ' |/usr/share|/var/|/diet/' | sed -e 's%/$%%' | tr '\n' ' '` #ex: /usr/lib/
do # -x means match whole line...
 [ "$(grep -x "$iLIB" /etc/ld.so.conf)" != "" ] && [ ! -d $iLIB ] && sed -i -e "/^${iLIB}$/d" /etc/ld.so.conf
 LDFLG=1
done
if [ "$xARCHDIR" ];then
 for iLIB in `grep "/lib/${ARCHDIR}/$" /root/.packages/${DB_pkgname}.files | sort -u | grep -v ' ' | sed -e 's%/$%%' | tr '\n' ' '` #ex: /usr/lib/
 do # -x means match whole line...
  [ "$(grep -x "$iLIB" /etc/ld.so.conf)" != "" ] && [ ! -d $iLIB ] && sed -i -e "/^${iLIB}$/d" /etc/ld.so.conf
  LDFLG=1
 done
fi
#140214 ubuntu has extra ld.so.conf files (similar code in installpkg.sh)...
for LDSOFILE in `grep '/lib/.*ld.so.conf$' /root/.packages/${DB_pkgname}.files | tr '\n' ' '`
do
 iLIB="$(dirname "$LDSOFILE")"
 [ "$(grep -x "$iLIB" /etc/ld.so.conf)" != "" ] && [ ! -d "$iLIB" ] && sed -i -e "/^${iLIB}$/d" /etc/ld.so.conf
 LDFLG=1
done
[ $LDFLG -eq 1 ] && ldconfig

#20240307 if an app has been installed to run non-root, delete the .bin and .bin0...
# (see also /usr/bin/xbps-remove.sh)
grep -q 'usr/share/applications' /root/.packages/${DB_pkgname}.files
if [ $? -eq 0 ];then
 for aDT in $(grep '/usr/share/applications/' /root/.packages/${DB_pkgname}.files)
 do
  [ -z "$aDT" ] && continue
  EXEC="$(grep '^Exec=' ${aDT} | cut -f 2 -d '=' | cut -f 1 -d ' ')"
  if [ "$EXEC" ];then
   [ -f /usr/bin/${EXEC} ] && rm -f /usr/bin/${EXEC}
   [ -f /usr/bin/${EXEC}.bin ] && rm -f /usr/bin/${EXEC}.bin
   [ -f /usr/bin/${EXEC}.bin0 ] && rm -f /usr/bin/${EXEC}.bin0
   sed -i "/^${EXEC}=/d" /root/.clients-status
   #20240310 hide home folder...
   if [ -d /home/${EXEC} ];then
    if [ -d /home/.${EXEC} ];then #precaution
     rm -rf /home/.${EXEC}
    fi
    mv -f /home/${EXEC} /home/.${EXEC}
   fi
   #20240310 remove a desktop icon if running non-root...
   grep -q "/home/${EXEC}/${EXEC}" /root/Choices/ROX-Filer/PuppyPin
   if [ $? -eq 0 ];then
    echo "<?xml version=\"1.0\"?>
<env:Envelope xmlns:env=\"http://www.w3.org/2001/12/soap-envelope\">
 <env:Body xmlns=\"http://rox.sourceforge.net/SOAP/ROX-Filer\">
  <PinboardRemove>
   <Path>/home/${EXEC}/${EXEC}</Path>
  </PinboardRemove>
 </env:Body>
</env:Envelope>" | rox -R
   fi
   #20240310 remove a desktop icon if running as root...
   grep -q "/usr/bin/${EXEC}" /root/Choices/ROX-Filer/PuppyPin
   if [ $? -eq 0 ];then
    echo "<?xml version=\"1.0\"?>
<env:Envelope xmlns:env=\"http://www.w3.org/2001/12/soap-envelope\">
 <env:Body xmlns=\"http://rox.sourceforge.net/SOAP/ROX-Filer\">
  <PinboardRemove>
   <Path>/usr/bin/${EXEC}</Path>
  </PinboardRemove>
 </env:Body>
</env:Envelope>" | rox -R
   fi
   #20240310 packages-templates may have renamed .desktop file when install...
   rm -f /usr/share/applications/${EXEC}.desktop 2>/dev/null
  fi
 done
fi

#20240307 if an app has been installed to run non-root, delete the .bin and .bin0...
# (see also /usr/bin/xbps-remove.sh)
Jflg=0 #20240906
grep -q -F 'usr/share/applications' /root/.packages/${DB_pkgname}.files
if [ $? -eq 0 ];then
 for aDT in $(grep '/usr/share/applications/' /root/.packages/${DB_pkgname}.files)
 do
  [ -z "$aDT" ] && continue
  [ -d "$aDT" ] && continue #20240906
  EXEC="$(grep '^Exec=' ${aDT} | cut -f 2 -d '=' | cut -f 1 -d ' ')"
  if [ -n "$EXEC" ];then
   [ -f /usr/bin/${EXEC} ] && rm -f /usr/bin/${EXEC}
   [ -f /usr/bin/${EXEC}.bin ] && rm -f /usr/bin/${EXEC}.bin
   [ -f /usr/bin/${EXEC}.bin0 ] && rm -f /usr/bin/${EXEC}.bin0
   sed -i "\%^${EXEC}=%d" /root/.clients-status
   #20240310 hide home folder...
   if [ -d /home/${EXEC} ];then
    if [ -d /home/.${EXEC} ];then #precaution
     rm -rf /home/.${EXEC}
    fi
    mv -f /home/${EXEC} /home/.${EXEC}
   fi
   #20240310 remove a desktop icon if running non-root...
   grep -q -F "/home/${EXEC}/${EXEC}" /root/Choices/ROX-Filer/PuppyPin
   if [ $? -eq 0 ];then
    echo "<?xml version=\"1.0\"?>
<env:Envelope xmlns:env=\"http://www.w3.org/2001/12/soap-envelope\">
 <env:Body xmlns=\"http://rox.sourceforge.net/SOAP/ROX-Filer\">
  <PinboardRemove>
   <Path>/home/${EXEC}/${EXEC}</Path>
  </PinboardRemove>
 </env:Body>
</env:Envelope>" | rox -R
   fi
   #20240310 remove a desktop icon if running as root...
   grep -q "/usr/bin/${EXEC}" /root/Choices/ROX-Filer/PuppyPin
   if [ $? -eq 0 ];then
    echo "<?xml version=\"1.0\"?>
<env:Envelope xmlns:env=\"http://www.w3.org/2001/12/soap-envelope\">
 <env:Body xmlns=\"http://rox.sourceforge.net/SOAP/ROX-Filer\">
  <PinboardRemove>
   <Path>/usr/bin/${EXEC}</Path>
  </PinboardRemove>
 </env:Body>
</env:Envelope>" | rox -R
   fi
   #20240310 packages-templates may have renamed .desktop file when install...
   rm -f /usr/share/applications/${EXEC}.desktop 2>/dev/null
  
   #20240906 jwm-mode
   if [ -f /root/.jwm/tray-icons ];then
    grep -q -F "exec:${EXEC}<" /root/.jwm/tray-icons
    if [ $? -eq 0 ];then
     sed -i "\%exec:${EXEC}%d" /root/.jwm/tray-icons
     #...these are the pending icons, remove also actual icon from tray...
     if [ "${UI_DESK_MANAGER}" == "jwm" ];then
      grep -q -F "exec:${EXEC}<" /root/.jwmrc-tray
      if [ $? -eq 0 ];then
       sed -i "\%exec:${EXEC}%d" /root/.jwmrc-tray
       Jflg=1
      fi
     fi
    fi
   fi
   
  fi
 done
fi
if [ $Jflg -eq 1 ];then #20240906
 jwm -restart
fi

#remove records of pkg...
rm -f /root/.packages/${DB_pkgname}.files
grep -v "$remPATTERN" /root/.packages/user-installed-packages > /tmp/petget-user-installed-pkgs-rem
cp -f /tmp/petget-user-installed-pkgs-rem /root/.packages/user-installed-packages

#v424 .pet pckage may have post-uninstall script, which was originally named puninstall.sh
#but /usr/local/petget/installpkg.sh moved it to /root/.packages/$DB_pkgname.remove
if [ -f /root/.packages/${DB_pkgname}.remove ];then
 /bin/sh /root/.packages/${DB_pkgname}.remove
 rm -f /root/.packages/${DB_pkgname}.remove
fi

#remove temp file so main gui window will re-filter pkgs display...
FIRSTCHAR="`echo -n "$DB_pkgname" | cut -c 1 | tr '[A-Z]' '[a-z]'`"
rm -f /tmp/petget/petget_fltrd_repo_${FIRSTCHAR}* 2>/dev/null
rm -f /tmp/petget/petget_fltrd_repo_?${FIRSTCHAR}* 2>/dev/null
[ "`echo -n "$FIRSTCHAR" | grep '[0-9]'`" != "" ] && rm -f /tmp/petget/petget_fltrd_repo_0* 2>/dev/null

#announce any deps that might be removable...
echo -n "" > /tmp/petget-deps-maybe-rem
cut -f 1,2,10 -d '|' /root/.packages/user-installed-packages |
while read ONEDB
do
 ONE_pkgname="`echo -n "$ONEDB" | cut -f 1 -d '|'`"
 ONE_nameonly="`echo -n "$ONEDB" | cut -f 2 -d '|'`"
 ONE_description="`echo -n "$ONEDB" | cut -f 3 -d '|'`"
 opPATTERN='^'"$ONE_nameonly"'$'
 [ "`echo "$DEP_PKGS" | grep "$opPATTERN"`" != "" ] && echo "$ONE_pkgname DESCRIPTION: $ONE_description" >> /tmp/petget-deps-maybe-rem
done
EXTRAMSG=""
if [ -s /tmp/petget-deps-maybe-rem ];then
 #MAYBEREM="`cat /tmp/petget-deps-maybe-rem`" # wrap=\"false\"
 #nah, just list the names, not descriptions...
 MAYBEREM="`cat /tmp/petget-deps-maybe-rem | cut -f 1 -d ' ' | tr '\n' ' '`"
 EXTRAMSG="<text><label>$(gettext 'Perhaps you do not need these dependencies that you had also installed:')</label></text> <text use-markup=\"true\"><label>\"<b>${MAYBEREM}</b>\"</label></text><text><label>$(gettext "...if you do want to remove them, you will have to do so back on the main window, after clicking the 'Ok' button below (perhaps make a note of the package names on a scrap of paper right now)")</label></text>"
fi

#140213 all installed pkgs kept here, see installpkg.sh
AUDITPKG="`find /audit/packages -maxdepth 1 -type f -name "${DB_pkgname}*" | tr '\n' ' '`"
[ "$AUDITPKG" ] && rm -f $AUDITPKG

#announce success...
export REM_DIALOG="<window title=\"$(gettext 'PKGget Package Manager')\" icon-name=\"gtk-about\">
  <vbox>
  <pixmap><input file>/usr/local/lib/X11/pixmaps/ok.xpm</input></pixmap>
   <text><label>$(gettext 'Package') '$DB_pkgname' $(gettext 'has been removed.')</label></text>
   ${EXTRAMSG}
   <hbox>
    <button ok></button>
   </hbox>
  </vbox>
 </window>
" 
if [ "$DISPLAY" != "" ];then
 gtkdialog --program=REM_DIALOG
fi


###+++2011-12-27 KRG
#emitting exitcode for some windowmanager depending on dbus
#popup a message window saying the program stopped unexpectedly
#ie (old) enlightenment
exit 0
###+++2011-12-27 KRG
###END###
