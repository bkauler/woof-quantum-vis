#!/bin/sh
#(c) Copyright Barry Kauler 2009, puppylinux.com  QUANTUMVISMARKER
#2009 Lesser GPL licence v2 (http://www.fsf.org/licensing/licenses/lgpl.html).
#called from /usr/local/petget/downloadpkgs.sh and petget.
#passed param is the path and name of the downloaded package.
#/tmp/petget_missing_dbentries-Packages-* has database entries for the set of pkgs being downloaded.
#w456 warning: petget may write to /tmp/petget_missing_dbentries-Packages-alien with missing fields.
#w478, w482 fix for pkg menu categories.
#w482 detect zero-byte pet.specs, fix typo.
#100110 add support for T2 .tar.bz2 binary packages.
#100426 aufs can now write direct to save layer.
#100616 add support for .txz slackware pkgs.
# 20aug10 shinobar: excute pinstall.sh under original LANG environment
#  6sep10 shinobar: warning to install on /mnt/files # 16sep10 remove test code
# 17sep10 shinobar; fix typo was double '|' at reading DESCRIPTION
# 22sep10 shinobar clean up probable old files for precaution
# 22sep10 shinobar: bugfix was not working clean out whiteout files
#110503 change ownership of some files if non-root.
#110523 support for rpm pkgs.
#110705 fix rpm install.
#110817 rcrsn51: fix find syntax, looking for icons. 110821 improve.
#111013 shinobar: aufs direct-write to layer not working, bypass for now.
#111013 revert above. it works for me, except if file already on top -- that is another problem, needs to be addressed.
#111207 improve search for menu icon.
#111229 /usr/local/petget/removepreview.sh when uninstalling a pkg, may have copied a file from sfs-layer to top, check.
#120102 install may have overwritten a symlink-to-dir.
#120107 rerwin: need quotes around some paths in case of space chars. remove '--unlink-first' from tar (was introduced 120102, don't think necessary).
#120126 noryb009: fix typo.
#120219 was not properly internationalized (there was no TEXTDOMAIN).
#120523 may need to run gio-query-modules and/or glib-compile-schemas. (refer also rc.update and 3builddistro)
#120628 fix Categories= assignment in .desktop files. see also 2createpackages in woof.
#120818 Categories management improved. pkg db now has category[;subcategory] (see 0setup), xdg enhanced (see /etc/xdg and /usr/share/desktop-directories), and generic icons for all subcategories (see /usr/local/lib/X11/mini-icons).
#120901 .desktop files, get rid of param on end of Exec, ex: Exec=gimp-2.8 %U
#120907 post-install hacks.
#120926 apply translation for .desktop file if langpack installed.
#121015 01micko: alternative code to delete %-param off end of Exec line in .desktop file.
#121109 fixing Categories field in .desktop may fail, as DB_category field may not match that in .desktop file, so leave out that $tPATTERN match in $PUPHIERARCHY.
#121109 menu category was not reported correctly in post-install window.
#121119 change in layout of /etc/xdg/menus/hierarchy caused regex pattern bug.
#121119 if only one .desktop file, first check if a match in /usr/local/petget/categories.dat.
#121120 bugfix of 121119.
#121123 having a problem with multiarch symlinks in full-installation, getting replaced by a directory.
#121206 default icon needs .xpm extension. note puppy uses older xdg-utilities, Icon field needs image ext.
#121217 still getting reports multiarch symlinks getting overwritten.
#130112 some deb's have a post-install script (ex: some python debs).
#130112 multiarch symlinks now optional. see also 2createpackages, 3builddistro.
#130114 revert 130112 "multiarch symlinks now optional".
#130126 'categories.dat' format changed.
#130219 grep, ignore case.
#130305 rerwin: ensure tmp directory has all permissions after package expansion.
#130314 install arch linux pkgs. run arch linux pkg post-install script.
#131220 modify for Quirky6. install pkg to temp location first, so can save any overwritten files. see also removepreview.sh
#131229 remove ${DIRECTSAVEPATH} after installation.
#131229 detect if not enough room in /tmp.
#140103 seems ok to expand large .pet in a f2fs partition (when not enough room in /tmp).
#140104 fix for copying symlink to dir, etc.
#140109 alias rm=/usr/local/petget/rm.sh for pinstall.sh script. rm.sh is a new script.
#140125 handle ARCHDIR.
#140204 no longer exporting LD_LIBRARY_PATH in /etc/profile, so must update /etc/ld.so.conf and /etc/ld.so.cache
#140208 check enough space to install pkg.
#140214 improve updating of /etc/ld.so.conf. see also removepreview.sh
#140215 saving all installed packages in /audit/packages. for complete system rebuilding. see also delayedrun, take-reference-snapshot, removepreview.sh.
#150203 careful icon symlink doesn't link to itself: (see also 2createpackages)
#150419 added devuan support. refer: dimkr: https://github.com/puppylinux-woof-CE/woof-CE/pull/528/files
#150730 added 'configure' option to debian postinst
#151115 hack, livecd/frugal do not mount /tmp with tmpfs.
#170103 fix dangerous change of folder to symlink.
#170515 fix for OE .tar.xz pkgs.
#170629 tweaks.
#171109 run update-desktop-database
#180518 maybe add to rox right-click open-with menu.
#180624 /usr/local/peget/installpkg.sh runs 'df' which may fail
#200402 Exec= must not contain a path.
#200712 support .pkg.tar.zst (arch linux pkgs), .tar.zst.
#20210612 replaced all yaf-splash with gtkdialog-splash. note, still ok to kill yaf-splash, see gtkdialog-splash script.
#20210915 Exec=<path>/AppRun in .desktop file stuffs things up. 
#20220903 sync with dpkg|apt
#20221023 may be running as zeus super-user.
#20230213 check if .mo files in /usr/share/locale.in
#20230215 remove duplicates in /usr/share/applicatins|applications.in & locale|locale.in (see also 3buildeasydistro)
# ***TODO*** restore them if uninstall pkg.
#20230222 major rethink /usr/share/locale.in only exist in rootfs-skeleton
#20230309 have removed /usr/local/debget
#20230708 apply /root/.packages/packages-templates/<app> if exists.
#20230711 check .desktop file exists.
#20230718 some fixes
#20230831 support Void Linux .xbps pkg.
#20230904 set xARCHDIR
#20230918 got rid of remnants of EasyPak, DEBSHERE, eppm
#20240114 fix 20230708
#20240229 easyvoid. 20240302 20240306 20240418
#2024626 careful rev broken if LANG=C and utf8 chars.

#information from 'labrador', to expand a .pet directly to '/':
#NAME="a52dec-0.7.4"
#pet2tgz "${NAME}.pet"
#tar -C / --transform 's/^\(\.\/\)\?'"$NAME"'//g' -zxf "${NAME}.tar.gz"
#i found this also works:
#tar -z -x --strip=1 --directory=/ -f bluefish-1.0.7.tar.gz
#v424 .pet pkgs may have post-uninstall script, puninstall.sh

export TEXTDOMAIN=petget___installpkg.sh
export OUTPUT_CHARSET=UTF-8


APPDIR=$(dirname $0)
[ -f "$APPDIR/i18n_head" ] && source "$APPDIR/i18n_head"
LANG_USER=$LANG
export LANG=C
. /etc/rc.d/PUPSTATE  #this has PUPMODE and SAVE_LAYER.
. /etc/DISTRO_SPECS #has DISTRO_BINARY_COMPAT, DISTRO_COMPAT_VERSION

. /etc/xdg/menus/hierarchy #w478 has PUPHIERARCHY variable.

#20240229
EVflg=0
if [ -d /var/db/xbps/keys ];then
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

export XBPS_ARCH="$xARCH"

mkdir -p ${E1}/converted-pkgs
mkdir -p ${E1}/sandbox

#140125 DISTRO_ARCHDIR_SYMLINKS and DISTRO_ARCHDIR are defined in file DISTRO_SPECS...
xARCHDIR="$DISTRO_xARCHDIR" #20230904
if [ "${xARCHDIR:0:1}" == "/" ];then
 ARCHDIR="${xARCHDIR:1:99}"
 #...this means if xARCHDIR=/x86_64-linux-gnu then path is /usr/lib/x86_64-linux-gnu
else
 ARCHDIR=''
fi

DLPKG="$1"
DLPKG_BASE="`basename $DLPKG`" #ex: scite-1.77-i686-2as.tgz
DLPKG_PATH="`dirname $DLPKG`"  #ex: /root

exit_func() {
 [ $DISPLAY ] && pupkill $YAFPID1
 exit $1
}

# 6sep10 shinobar: installing files under /mnt is danger
install_path_check() {
  FILELIST="/root/.packages/${DLPKG_NAME}.files"
  [ -s "$FILELIST" ] || return 0 #120126 noryb009: typo
  grep -q '^/mnt' "$FILELIST" || return 0
  pupkill $YAFPID1 #131222
  MNTDIRS=$(cat "$FILELIST" | grep '^/mnt/.*/$' | cut -d'/' -f1-3  | tail -n 1)
  LANG=$LANG_USER
  MSG1=$(gettext "This package will install files under")
  MSG2=$(gettext "It can be dangerous to install files under '/mnt' because it depends on the profile of installation.")
  MSG3=""
  if grep -q '^/mnt/home' "$FILELIST"; then #old puppy thing.
    DIRECTSAVEPATH=""
  fi
  # dialog
  export DIALOG="<window title=\"$T_title\" icon-name=\"gtk-dialog-warning\">
  <vbox>
  <text use-markup=\"true\"><label>\"$MSG1: <b>$MNTDIRS</b>\"</label></text>
  <text><input>echo -en \"$MSG2 $MSG3\"</input></text>
  <text><label>$(gettext "Click 'Cancel' not to install(recommended). Or click 'Install' if you like to proceed.")</label></text>
  <hbox>
  <button cancel></button>
  <button><input file stock=\"gtk-apply\"></input><label>$(gettext 'Install')</label><action type=\"exit\">INSTALL</action></button>
  </hbox>
  </vbox>
  </window>"
  RETPARAMS=`gtkdialog --program=DIALOG --center` || echo "$DIALOG" >&2
  eval "$RETPARAMS"
  LANG=C
  [ "$EXIT" = "INSTALL" ]  && return 0
  rm -f "$FILELIST" 
  exit_func 1 #exit 1
}

# 22sep10 shinobar clean up probable old files for precaution
rm -f /pet.specs /pinstall.sh /puninstall.sh /install/doinst.sh 2>/dev/null

#get the pkg name ex: scite-1.77 ...
dbPATTERN='|'"$DLPKG_BASE"'|'
DLPKG_NAME="`cat /tmp/petget_missing_dbentries-Packages-* | grep "$dbPATTERN" | head -n 1 | cut -f 1 -d '|'`"

#131222 do not allow duplicate installs... 150103 quieten...
PTN1='^'"$DLPKG_NAME"'|'
if [ "`grep "$PTN1" /root/.packages/user-installed-packages 2>/dev/null`" != "" ];then
 if [ ! $DISPLAY ];then
  echo "$(gettext 'Sorry, this package is already installed. Aborting.')"
 else
  pupmessage -bg '#ff8080' -fg black -title "$(gettext 'Package:') ${DLPKG_NAME}" "$(gettext 'Sorry, but this package is already installed. Cannot install it twice.')"
 fi
 exit 1
fi

#131220  131229 detect if not enough room in /tmp...
DIRECTSAVEPATH="/tmp/petget/directsavepath"
SIZEB=`stat --format=%s ${DLPKG_PATH}/${DLPKG_BASE}`
SIZEK=`expr $SIZEB \/ 1024`
EXPK=`expr $SIZEK \* 4` #estimated worst-case expanded size. 170629 change 5 to 4.
NEEDK=$EXPK #140208 need this much free space in f.s.
TMPK=`df -k /tmp | grep '^tmpfs' | tr -s ' ' | cut -f 4 -d ' '` #free space in /tmp
[ ! $TMPK ] && TMPK=$EXPK #151115 hack, livecd/frugal do not mount /tmp with tmpfs.
if [ $EXPK -gt $TMPK ];then
  DIRECTSAVEPATH="/data/sandbox" #20240418
  NEEDK=`expr $NEEDK \* 2` #140208
fi
if [ "$DIRECTSAVEPATH" ];then
 rm -rf $DIRECTSAVEPATH 2> /dev/null 
 mkdir -p $DIRECTSAVEPATH
fi

#140208 check enough space to install pkg...
#as the pkg gets expanded to an intermediate dir, maybe in main f.s...
#180624 df may fail in a container...
busybox df -k / >/dev/null 2>&1
if [ $? -eq 0 ];then
 PARTK=`df -k / | grep '/$' | tr -s ' ' | cut -f 4 -d ' '` #free space in partition.
else
 PARTK=${NEEDK} #assume ok.
fi
if [ $NEEDK -gt $PARTK ];then
 ABORTMSG1="$(gettext 'Package:') ${DLPKG_BASE}"
 ABORTMSG2="$(gettext 'Sorry, there is not enough free space in the partition to install this package')"
 if [ $DISPLAY ];then
  pupmessage -bg pink -fg black -title "${ABORTMSG1}" "${ABORTMSG2}"
 else
  echo "${ABORTMSG1}
${ABORTMSG2}"
 fi
 [ "$DLPKG_PATH" = "/root" ] && rm -f ${DLPKG_PATH}/${DLPKG_BASE}
 exit 1
fi

if [ $DISPLAY ];then #131222
 gtkdialog-splash -bg orange -fg black -close never -fontsize large -text "$(gettext 'Please wait, processing...')" &
 YAFPID1=$!
fi

cd $DLPKG_PATH

case $DLPKG_BASE in
 *.pet)
  EXT='.pet'
  DLPKG_MAIN="`basename $DLPKG_BASE .pet`"
  pet2tgz $DLPKG_BASE
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PETFILES="`tar --list -z -f ${DLPKG_MAIN}.tar.gz`"
  #slackware pkg, got a case where passed the above test but failed here...
  [ $? -ne 0 ] && exit_func 1 #exit 1
  if [ "`echo "$PETFILES" | grep '^\\./'`" != "" ];then
   #ttuuxx has created some pets with './' prefix...
   pPATTERN="s%^\\./${DLPKG_NAME}%%"
   echo "$PETFILES" | sed -e "$pPATTERN" > /root/.packages/${DLPKG_NAME}.files
   [ $DISPLAY ] && install_path_check
   tar -z -x --strip=2 --directory=${DIRECTSAVEPATH}/ -f ${DLPKG_MAIN}.tar.gz #120102. 120107 remove --unlink-first
  else
   #new2dir and tgz2pet creates them this way...
   pPATTERN="s%^${DLPKG_NAME}%%"
   echo "$PETFILES" | sed -e "$pPATTERN" > /root/.packages/${DLPKG_NAME}.files
   [ $DISPLAY ] && install_path_check
   tar -z -x --strip=1 --directory=${DIRECTSAVEPATH}/ -f ${DLPKG_MAIN}.tar.gz #120102. 120107
  fi
 ;;
 *.deb)
  EXT='.deb'
  DLPKG_MAIN="`basename $DLPKG_BASE .deb`"
  PFILES="`dpkg-deb --contents $DLPKG_BASE | tr -s ' ' | cut -f 6 -d ' '`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  dpkg-deb -x $DLPKG_BASE ${DIRECTSAVEPATH}/
  if [ $? -ne 0 ];then
   rm -f /root/.packages/${DLPKG_NAME}.files
   exit_func 1 #exit 1
  fi
  [ -d /DEBIAN ] && rm -rf /DEBIAN #130112 precaution.
  dpkg-deb -e $DLPKG_BASE /DEBIAN #130112 extracts deb control files to dir /DEBIAN. may have a post-install script, see below.
 ;;
 *.tgz)
  EXT='.tgz'
  DLPKG_MAIN="`basename $DLPKG_BASE .tgz`" #ex: scite-1.77-i686-2as
  gzip --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -z -f $DLPKG_BASE`"
  #hmmm, got a case where passed the above test but failed here...
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -z -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE #120102. 120107
 ;;
 *.txz) #100616
  EXT='.txz'
  DLPKG_MAIN="`basename $DLPKG_BASE .txz`" #ex: scite-1.77-i686-2as
  xz --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -J -f $DLPKG_BASE`"
  #hmmm, got a case where passed the above test but failed here...
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -J -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE #120102. 120107
 ;;
 *.pkg.tar.gz) #200712 arch linux pkg.
  EXT='.pkg.tar.gz'
  DLPKG_MAIN="`basename $DLPKG_BASE .pkg.tar.gz`" #ex: acl-2.2.47-1-i686
  gzip --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -z -f $DLPKG_BASE`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -z -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE #120102. 120107
 ;;
 *.tar.gz)
  EXT='.tar.gz'
  DLPKG_MAIN="`basename $DLPKG_BASE .tar.gz`" #ex: acl-2.2.47-1-i686
  gzip --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -z -f $DLPKG_BASE`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -z -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE #120102. 120107
 ;;
 *.tar.bz2) #100110
  EXT='.tar.bz2'
  DLPKG_MAIN="`basename $DLPKG_BASE .tar.bz2`"
  bzip2 --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -j -f $DLPKG_BASE`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -j -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE #120102. 120107
 ;;
 *.pkg.tar.xz) #130314 arch pkgs.
  EXT='.pkg.tar.xz'
  DLPKG_MAIN="`basename $DLPKG_BASE .pkg.tar.xz`" #ex: acl-2.2.51-3-i686
  xz --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -J -f $DLPKG_BASE`"
  #hmmm, got a case where passed the above test but failed here...
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -J -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE
 ;;
 *.tar.xz) #170515 OE pkgs.
  EXT='.tar.xz'
  DLPKG_MAIN="`basename $DLPKG_BASE .tar.xz`" #ex: acl-2.2.51-r0-core2-64
  xz --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -J -f $DLPKG_BASE`"
  #hmmm, got a case where passed the above test but failed here...
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -J -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE
 ;;
 *.rpm) #110523
  EXT='.rpm'
  DLPKG_MAIN="`basename $DLPKG_BASE .rpm`"
  busybox rpm -qp $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`busybox rpm -qpl $DLPKG_BASE`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  #110705 rpm -i does not work for mageia pkgs...
  #busybox rpm -i $DLPKG_BASE
  exploderpm -i $DLPKG_BASE
 ;;
 *.pkg.tar.zst) #200712 arch linux pkgs.
  EXT='.pkg.tar.zst'
  DLPKG_MAIN="$(basename $DLPKG_BASE .pkg.tar.zst)" #ex: acl-2.2.51-r0-core2-64
  zstd --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -f $DLPKG_BASE`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE
 ;;
 *.tar.zst) #200712
  EXT='.tar.zst'
  DLPKG_MAIN="$(basename $DLPKG_BASE .tar.zst)" #ex: acl-2.2.51-r0-core2-64
  zstd --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="`tar --list -f $DLPKG_BASE`"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE
 ;;
 *.xbps) #20230831
  EXT='.xbps'
  DLPKG_NAME="$(basename $DLPKG_BASE .xbps)"
  PKGNAME="$(echo -n "$DLPKG_NAME" | LANG=${LANG_USER} rev | cut -f 2- -d '.' | LANG=${LANG_USER} rev)" #ex: 9menu-1.10_1
  DB_nameonly="$(echo -n "$PKGNAME" | cut -f 1 -d '_' | LANG=${LANG_USER} rev | cut -f 2- -d '-' | LANG=${LANG_USER} rev)"
  DB_pkgrelease="$(echo -n "$PKGNAME" | cut -f 2 -d '_')"
  DB_version="$(echo -n "$PKGNAME" | cut -f 1 -d '_' | LANG=${LANG_USER} rev | cut -f 1 -d '-' | LANG=${LANG_USER} rev)"
  zstd --test $DLPKG_BASE > /dev/null 2>&1
  [ $? -ne 0 ] && exit_func 1 #exit 1
  PFILES="$(tar --list -f $DLPKG_BASE)"
  [ $? -ne 0 ] && exit_func 1 #exit 1
  echo "$PFILES" > /root/.packages/${DLPKG_NAME}.files
  [ $DISPLAY ] && install_path_check
  tar -x --directory=${DIRECTSAVEPATH}/ -f $DLPKG_BASE
  #if [ -f ${DIRECTSAVEPATH}/INSTALL ];then
  # mv -f ${DIRECTSAVEPATH}/INSTALL ${DIRECTSAVEPATH}/pinstall.sh
  #fi
  if [ -f ${DIRECTSAVEPATH}/REMOVE ];then
   # mv -f ${DIRECTSAVEPATH}/REMOVE ${DIRECTSAVEPATH}/puninstall.sh
   rm -f ${DIRECTSAVEPATH}/REMOVE
  fi
  if [ -f ${DIRECTSAVEPATH}/files.plist ];then
   rm -f ${DIRECTSAVEPATH}/files.plist
  fi
  if [ -f ${DIRECTSAVEPATH}/props.plist ];then
   #thanks to mistfire...
   /usr/local/petget/support/void/plist2ini ${DIRECTSAVEPATH}/props.plist > /tmp/petget/props.tmp
   rm -f ${DIRECTSAVEPATH}/props.plist
  else
   echo -n "architecture|" > /tmp/petget/props.tmp
   arch >> /tmp/petget/props.tmp
   echo "pkgname|${DB_nameonly}" >> /tmp/petget/props.tmp
   echo "pkgver|${PKGNAME}" >> /tmp/petget/props.tmp
   echo "version|${DB_version}" >> /tmp/petget/props.tmp
  fi
 ;;
esac

echo -n '' > /tmp/petget/FLAGFND #140109 moved up.
if [ -n "$DIRECTSAVEPATH" ];then #-n means not-empty string.
 
 #20240418 see if anything in ${L1}/pkg-fix/packages-templates
 PKGnameonly="$(grep -F "${DLPKG_NAME}|" /tmp/petget_missing_dbentries-Packages-* | grep "^${DLPKG_NAME}" | head -n 1 | cut -f 2 -d '|')"
 #pkg may need usr-merge fix...
 if [ "${EXT}" != ".xbps" -a "${EXT}" != ".pet" ];then
  #for .pet, usrmerge-fix and symlinks-fix called from pet2xbps see below.
  SAVEUP="$(dirname ${DIRECTSAVEPATH})"
  cd $SAVEUP
  cp -a -f ${DIRECTSAVEPATH##*/} ${DIRECTSAVEPATH##*/}TEMP
  ${L1}/pkg-fix/usrmerge-fix ${DIRECTSAVEPATH##*/}TEMP ${DIRECTSAVEPATH##*/}
  #...latter will have usr-merge fixes.
  ${L1}/pkg-fix/symlinks-fix ${DIRECTSAVEPATH##*/}
 fi
 #assume pet does not need template fix...
 if [ "${EXT}" != ".pet" ];then
  if [ -n "$PKGnameonly" ];then
   if [ -d ${L1}/pkg-fix/packages-templates/${PKGnameonly} ];then
    ${L1}/pkg-fix/template-fix "${PKGnameonly}" "${PKGnameonly}" "${DIRECTSAVEPATH}"
    if [ -f ${L1}/pkg-fix/packages-templates/${PKGnameonly}/pinstall.sh ];then
     cp -a -f ${L1}/pkg-fix/packages-templates/${PKGnameonly}/pinstall.sh ${DIRECTSAVEPATH}/
    fi
    if [ -d ${L1}/pkg-fix/packages-templates/${PKGnameonly}/REPLACEMENTS ];then
     cp -a -f --remove-destination ${L1}/pkg-fix/packages-templates/${PKGnameonly}/REPLACEMENTS/* ${DIRECTSAVEPATH}/
    fi
   fi
  fi
 fi
 
 cd $DLPKG_PATH
 
 #20240229 want to convert pet pkgs to xbps and install with xbps
 Iflg=0
 if [ $EVflg -eq 1 -a "${EXT}" == ".pet" ];then #20240229 20240418
  DB1="$(grep -H -F "${dbPATTERN}" /tmp/petget_missing_dbentries-Packages-pet-* 2>/dev/null | head -n 1)"
  if [ -z "${DB1}" ];then
   #petget script will have populated this...
   DB1="$(grep -H -F "${dbPATTERN}" /tmp/petget_missing_dbentries-Packages-alien 2>/dev/null | head -n 1)"
  fi
  if [ ! -z "$DB1" ];then
   Filex="${DB1/:*/}"
   DB_FILE="${Filex/*-P/P}" #ex: Packages-pet-noarch-official
   PSTrepo="pet:$(cut -f 3 -d '-' <<<${DB_FILE})" #ex: pet:noarch
   aDB="$(cut -f 2- -d ':' <<<${DB1})"
   #ex: aDB='pmusic1-1.8.3-1|pmusic1|1.8.3-1||Multimedia|424K||pmusic1-1.8.3-1.pet|+gtkdialog3,+ffmpeg|Pmusic audio player, old version, works with gtkdialog3 in some less-recent puppies||||'
   echo "$aDB" > /tmp/petget/aDBentry
   WIPnameonly="$(cut -f 2 -d '|' <<<${aDB})"
   ${L1}/support/pet2xbps "${DLPKG}" /tmp/petget/aDBentry "${WIPnameonly}"
   # ...created in ${E1}/converted-pkgs
   VER="$(cut -f 3 -d '|' /tmp/petget/aDBentry | sed -e 's%[^0-9.]%%g')_1"
   # ...name is ${WIPnameonly}-${VER}.${xARCH}.xbps
   Pxbps="${WIPnameonly}-${VER}.${xARCH}.xbps"
   #register new .xbps pkg in local repo...
   xbps-rindex --add ${E1}/converted-pkgs/${Pxbps}
   #20240306 always have path...
   /usr/bin/xbps-install --yes --ignore-file-conflicts --repository=${E1}/converted-pkgs ${WIPnameonly}-${VER}
   #prevent a void pkg from overwriting...
   xbps-pkgdb -m hold ${WIPnameonly}-${VER}
   #log pet name vs xbps pkg name...
   echo "CONV_PKG_REPO='${PSTrepo}'" > ${E1}/converted-pkgs/${WIPnameonly} #ex: pet:noarch
   echo "CONV_PKG_DB='${aDB}'" >> ${E1}/converted-pkgs/${WIPnameonly}
   echo "CONV_XBPS_PKGFULL='${Pxbps}'" >> ${E1}/converted-pkgs/${WIPnameonly} #ex: tas-1.15_1.x86_64.xbps
   echo "CONV_XBPS_PKGVER='${WIPnameonly}-${VER}'" >> ${E1}/converted-pkgs/${WIPnameonly} #20240302
   #probably good to link here...
   ln -s ${E1}/converted-pkgs/${Pxbps} /audit/packages/${Pxbps}
   ln -s ${DLPKG} /audit/packages/${DLPKG##*/} #20240301
   Iflg=1 #flag installed.
  fi
 fi

 if [ $Iflg -eq 0 ];then #20240229
  #now write temp-location to final destination... 180625
  cp -a -f --remove-destination ${DIRECTSAVEPATH}/* /  2> /tmp/petget/install-cp-errlog
  sync
  #note, this code-block is also in /usr/sbin/snapshot-manager (twice)...
  #can have a problem if want to replace a folder with a symlink. for example, got this error:
  # cp: cannot overwrite directory '/usr/share/mplayer/skins' with non-directory
  #3builddistro has this fix... which is a vice-versa situation...
  #firstly, the vice-versa, source is a directory, target is a symlink... 140104 fix...
  CNT=0
  while [ -s /tmp/petget/install-cp-errlog ];do
   echo -n '' > /tmp/petget/install-cp-errlog2
   echo -n '' > /tmp/petget/install-cp-errlog3
   cat /tmp/petget/install-cp-errlog | grep 'cannot overwrite non-directory' | grep 'with directory' | tr '[`‘’]' "'" | cut -f 2 -d "'" |
   while read ONEDIRSYMLINK #ex: /usr/share/mplayer/skins
   do
    if [ -h "${ONEDIRSYMLINK}" ];then #source is a directory, target is a symlink...
     #adding that extra trailing / does the trick...
     cp -a -f --remove-destination ${DIRECTSAVEPATH}"${ONEDIRSYMLINK}"/* "${ONEDIRSYMLINK}"/ 2>> /tmp/petget/install-cp-errlog2
    else #source is a directory, target is a file...
     rm -f "${ONEDIRSYMLINK}" #delete the file!
     DIRPATH="$(dirname "${ONEDIRSYMLINK}")"
     [ "$DIRPATH" == "/" ] && DIRPATH='' #170103
     cp -a -f ${DIRECTSAVEPATH}"${ONEDIRSYMLINK}" "${DIRPATH}"/ 2>> /tmp/petget/install-cp-errlog2 #copy directory (and contents).
    fi
   done
   #secondly, which is our mplayer example, source is a symlink, target is a folder...
   cat /tmp/petget/install-cp-errlog | grep 'cannot overwrite directory' | grep 'with non-directory' | tr '[`‘’]' "'" | cut -f 2 -d "'" |
   while read ONEDIRSYMLINK #ex: /usr/share/mplayer/skins
   do
    #difficult situation, whether to impose the symlink of package, or not. if not...
    #cp -a -f --remove-destination ${DIRECTSAVEPATH}"${ONEDIRSYMLINK}"/* "${ONEDIRSYMLINK}"/ 2> /tmp/petget/install-cp-errlog3
    #or, if we have chosen to follow link...
    DIRPATH="$(dirname "${ONEDIRSYMLINK}")"
    [ "$DIRPATH" == "/" ] && DIRPATH='' #170103
   done
   cat /tmp/petget/install-cp-errlog2 >> /tmp/petget/install-cp-errlog3
   cat /tmp/petget/install-cp-errlog3 > /tmp/petget/install-cp-errlog
   sync
   CNT=`expr $CNT + 1`
   [ $CNT -gt 10 ] && break #something wrong, get out.
  done
 fi
 
 #end 131220
 rm -rf ${DIRECTSAVEPATH} #131229 131230
fi #end 131230

#140215 saving all installed packages in /audit/packages...
if [ $EVflg -eq 0 ];then #20240301 =1 symlink already created above.
 mv -f $DLPKG_BASE /audit/packages/
fi
#rm -f $DLPKG_BASE 2>/dev/null
rm -f $DLPKG_MAIN.tar.gz 2>/dev/null

#pkgname.files may need to be fixed...
FIXEDFILES="`cat /root/.packages/${DLPKG_NAME}.files | grep -v '^\\./$'| grep -v '^/$' | sed -e 's%^\\.%%' -e 's%^%/%' -e 's%^//%/%'`"
echo "$FIXEDFILES" > /root/.packages/${DLPKG_NAME}.files

#some .pet pkgs have images at '/'...
mv /*24.xpm /usr/local/lib/X11/pixmaps/ 2>/dev/null
mv /*32.xpm /usr/local/lib/X11/pixmaps/ 2>/dev/null
mv /*32.png /usr/local/lib/X11/pixmaps/ 2>/dev/null
mv /*48.xpm /usr/local/lib/X11/pixmaps/ 2>/dev/null
mv /*48.png /usr/local/lib/X11/pixmaps/ 2>/dev/null
mv /*.xpm /usr/local/lib/X11/mini-icons/ 2>/dev/null
mv /*.png /usr/local/lib/X11/mini-icons/ 2>/dev/null

ls -dl /tmp | grep -q '^drwxrwxrwt' || chmod 1777 /tmp #130305 rerwin.

#140109 post-install scripts.
#these are a problem in quirky's full installation and pkg uninstall mechanism.
#post-install script may execute any arbitrary 'rm' or 'mv' operation, which we
#need to capture, for when we might want to uninstall the pkg...
#for this purpose, i have created 'rm.sh' (TODO:, 'cp.sh' and 'mv.sh')...
export DLPKG_NAME #1st field of pkg-db-entry.

#post-install script?...
if [ -f /pinstall.sh ];then #pet pkgs.
 #chmod +x /pinstall.sh
 cd /
 [ $DISPLAY ] && pupkill $YAFPID1 #131222
 #140109... 20240418
 #echo 'alias rm=/usr/local/petget/rm.sh' > /xpinstall.sh
 #cat /pinstall.sh >> /xpinstall.sh
 #LANG=$LANG_USER sh /xpinstall.sh
 LANG=$LANG_USER sh /pinstall.sh
 #rm -f /xpinstall.sh
 rm -f /pinstall.sh
fi
if [ -f /install/doinst.sh ];then #slackware pkgs.
 chmod +x /install/doinst.sh
 cd /
 LANG=$LANG_USER sh /install/doinst.sh
 rm -rf /install
fi
if [ -e /DEBIAN/postinst ];then #130112 deb post-install script.
 cd /
 LANG=$LANG_USER sh DEBIAN/postinst configure #150730 added 'configure'
 rm -rf /DEBIAN
fi
#130314 run arch linux pkg post-install script...
if [ -f /.INSTALL ];then #arch post-install script.
 if [ -f /usr/local/petget/ArchRunDotInstalls ];then #precaution. see 3builddistro, script created by noryb009.
  #this code is taken from below...
  dlPATTERN='|'"`echo -n "$DLPKG_BASE" | sed -e 's%\\-%\\\\-%'`"'|'
  archVER="`cat /tmp/petget_missing_dbentries-Packages-* | grep "$dlPATTERN" | head -n 1 | cut -f 3 -d '|'`"
  if [ "$archVER" ];then #precaution.
   cd /
   mv -f .INSTALL .INSTALL1-${archVER}
   cp -a /usr/local/petget/ArchRunDotInstalls /ArchRunDotInstalls
   LANG=$LANG_USER /ArchRunDotInstalls
   rm -f ArchRunDotInstalls
   rm -f .INSTALL*
  fi
 fi
fi
if [ -f /INSTALL ];then #20230831 .xbps pkg
 ARCH="$(arch)"
 echo 'alias rm=/usr/local/petget/rm.sh' > /xpinstall.sh
 cat /INSTALL >> /xpinstall.sh
 LANG=$LANG_USER sh /xpinstall.sh post ${DB_nameonly} ${DB_version} no "" ${ARCH}
 rm -f /INSTALL
 rm -f /xpinstall.sh
fi
cd / #180625

#140109 moved down...  20240418 remove
sync

#v424 .pet pkgs may have a post-uninstall script...
if [ -f /puninstall.sh ];then
 mv -f /puninstall.sh /root/.packages/${DLPKG_NAME}.remove
fi

#w465 <pkgname>.pet.specs is in older pet pkgs, just dump it...
#maybe a '$APKGNAME.pet.specs' file created by dir2pet script...
rm -f /*.pet.specs 2>/dev/null
#...note, this has a setting to prevent .files and entry in user-installed-packages, so install not registered.

#add entry to /root/.packages/user-installed-packages...
#w465 a pet pkg may have /pet.specs which has a db entry...
if [ -f /pet.specs -a -s /pet.specs ];then #w482 ignore zero-byte file.
 DB_ENTRY="`cat /pet.specs | head -n 1`"
 rm -f /pet.specs
else
 [ -f /pet.specs ] && rm -f /pet.specs #w482 remove zero-byte file.
 dlPATTERN='|'"`echo -n "$DLPKG_BASE" | sed -e 's%\\-%\\\\-%'`"'|'
 DB_ENTRY="`cat /tmp/petget_missing_dbentries-Packages-* | grep "$dlPATTERN" | head -n 1`"
fi
echo DLPKG_BASE=$DLPKG_BASE
echo DLPKG_NAME=$DLPKG_NAME
echo DB_ENTRY=$DB_ENTRY
##+++2011-12-27 KRG check if $DLPKG_BASE matches DB_ENTRY 1 so uninstallation works :Ooops:
db_pkg_name=`echo "$DB_ENTRY" |cut -f 1 -d '|'`
echo db_pkg_name=$db_pkg_name
if [ "$db_pkg_name" != "$DLPKG_NAME" ];then
 echo not equal sed ing now
 DB_ENTRY=`echo "$DB_ENTRY" |sed "s#$db_pkg_name#$DLPKG_NAME#"`
fi
##+++2011-12-27 KRG

#see if a .desktop file was installed, fix category... 120628 improve...
#120818 overhauled. Pkg db now has category[;subcategory] (see 0setup), xdg enhanced (see /etc/xdg and /usr/share/desktop-directories), and generic icons for all subcategories (see /usr/local/lib/X11/mini-icons).
#note, similar code also in Woof 2createpackages.
ONEDOT=""
CATEGORY="`echo -n "$DB_ENTRY" | cut -f 5 -d '|'`" #exs: Document, Document;edit
[ "$CATEGORY" = "" ] && CATEGORY='BuildingBlock' #paranoid precaution.
#xCATEGORY and DEFICON will be the fallbacks if Categories entry in .desktop is invalid...
xCATEGORY="`echo -n "$CATEGORY" | sed -e 's%^%X-%' -e 's%;%-%'`" #ex: X-Document-edit (refer /etc/xdg/menu/*.menu)
DEFICON="`echo -n "$CATEGORY" | sed -e 's%^%mini-%' -e 's%;%-%'`"'.xpm' #ex: mini-Document-edit (refer /usr/local/lib/X11/mini-icons -- these are in jwm search path) 121206 need .xpm extention.
case $CATEGORY in
 Calculate)     CATEGORY='Business'             ; xCATEGORY='X-Business'            ; DEFICON='mini-Business.xpm'            ;; #Calculate is old name, now Business.
 Develop)       CATEGORY='Utility;development'  ; xCATEGORY='X-Utility-development' ; DEFICON='mini-Utility-development.xpm' ;; #maybe an old pkg has this.
 Help)          CATEGORY='Utility;help'         ; xCATEGORY='X-Utility-help'        ; DEFICON='mini-Help.xpm'                ;; #maybe an old pkg has this.
 BuildingBlock) CATEGORY='Utility'              ; xCATEGORY='Utility'               ; DEFICON='mini-BuildingBlock.xpm'       ;; #unlikely to have a .desktop file.
esac
topCATEGORY="`echo -n "$CATEGORY" | cut -f 1 -d ';'`"
tPATTERN="^${topCATEGORY} "
cPATTERN="s%^Categories=.*%Categories=${xCATEGORY}%"
iPATTERN="s%^Icon=.*%Icon=${DEFICON}%"

#121119 if only one .desktop file, first check if a match in /usr/local/petget/categories.dat...
CATDONE='no'; NUMDESKFILE="0" #171109
if [ -f /usr/local/petget/categories.dat ];then #precaution, but it will be there.
 NUMDESKFILE="$(grep 'share/applications/.*\.desktop$' /root/.packages/${DLPKG_NAME}.files | wc -l)"
 if [ "$NUMDESKFILE" = "1" ];then
  #to lookup categories.dat, we need to know the generic name of the package, which may be different from pkg name...
  #db entry format: pkgname|nameonly|version|pkgrelease|category|size|path|fullfilename|dependencies|description|compileddistro|compiledrelease|repo|
  DBNAMEONLY="$(echo -n "$DB_ENTRY" | cut -f 2 -d '|')"
  DBPATH="$(echo -n "$DB_ENTRY" | cut -f 7 -d '|')"
  DBCOMPILEDDISTRO="$(echo -n "$DB_ENTRY" | cut -f 11 -d '|')"
  [ ! "$DBCOMPILEDDISTRO" ] && DBCOMPILEDDISTRO='puppy' #any name will do here.
  case $DBCOMPILEDDISTRO in
   debian|ubuntu|raspbian|devuan) #150419
    if [ "$DBPATH" ];then #precaution
     xNAMEONLY="$(basename ${DBPATH})"
    else
     xNAMEONLY="$DBNAMEONLY"
    fi
   ;;
   *) xNAMEONLY="$DBNAMEONLY" ;;
  esac
  xnPTN=" ${xNAMEONLY} "
  #130126 categories.dat format changed slightly... 130219 ignore case...
  #20230718 CATVARIABLE=PKGCAT_Utility_Sub, drop the "_Sub"
  CATVARIABLE="$(grep -i "$xnPTN" /usr/local/petget/categories.dat | grep '^PKGCAT' | head -n 1 | cut -f 1 -d '=' | cut -f 2,3 -d '_' | sed -e 's%_Sub$%%' | tr '_' '-')" #ex: PKGCAT_Graphic_camera=" gphoto2 gtkam "
  if [ "$CATVARIABLE" ];then #ex: Graphic-camera
   xCATEGORY="X-${CATVARIABLE}"
   cPATTERN="s%^Categories=.*%Categories=${xCATEGORY}%" #121120
   CATFOUND="yes"
   CATDONE='yes'
  fi
 fi
fi

for ONEDOT in `grep 'share/applications/.*\.desktop$' /root/.packages/${DLPKG_NAME}.files | tr '\n' ' '` #121119 exclude other strange .desktop files.
do
 #20230711 claws-mail, the template deletes claws-mail.desktop, replaces with claws.desktop
 #hmmm, just assume claws.desktop doesn't need any fixing...
 if [ ! -e "$ONEDOT" ];then
  continue
 fi
 
 #120901 get rid of param on end of Exec, ex: Exec=gimp-2.8 %U
 #sed -i -e 's/\(^Exec=[^%]*\).*/\1/' -e 's/ *$//' $ONEDOT #'s/\(^Exec=[^ ]*\).*/\1/'
 #121015 01micko: alternative that may work better...
 for PARMATER in u U f F #refer:  http://standards.freedesktop.org/desktop-entry-spec/latest/ar01s06.html
 do
  sed -i "s/ %${PARMATER}//" $ONEDOT
 done
 
 #w478 find if category is already valid (see also 2createpackages)..
 if [ "$CATDONE" = "no" ];then #121119
  CATFOUND="no"
  for ONEORIGCAT in `cat ${ONEDOT} | grep '^Categories=' | head -n 1 | cut -f 2 -d '=' | tr ';' ' ' | rev` #search in reverse order.
  do
   ONEORIGCAT="`echo -n "$ONEORIGCAT" | rev`" #restore rev of one word.
   oocPATTERN=' '"$ONEORIGCAT"' '
   [ "`echo "$PUPHIERARCHY" | tr -s ' ' | grep "$tPATTERN" | cut -f 3 -d ' ' | tr ',' ' ' | sed -e 's%^% %' -e 's%$% %' | grep "$oocPATTERN"`" != "" ] && CATFOUND="yes"
   #got a problem with sylpheed, "Categories=GTK;Network;Email;News;" this displays in both Network and Internet menus...
   if [ "$CATFOUND" = "yes" ];then
    cPATTERN="s%^Categories=.*%Categories=${ONEORIGCAT}%"
    break
   fi
  done
  #121109 above may fail, as DB_category field may not match that in .desktop file, so leave out that $tPATTERN match in $PUPHIERARCHY...
  if [ "$CATFOUND" = "no" ];then
   for ONEORIGCAT in `cat ${ONEDOT} | grep '^Categories=' | head -n 1 | cut -f 2 -d '=' | tr ';' ' ' | rev` #search in reverse order.
   do
    ONEORIGCAT="`echo -n "$ONEORIGCAT" | rev`" #restore rev of one word.
    oocPATTERN=' '"$ONEORIGCAT"' '
    [ "`echo "$PUPHIERARCHY" | tr -s ' ' | cut -f 3 -d ' ' | tr ',' ' ' | sed -e 's%^% %' -e 's%$% %' | grep "$oocPATTERN"`" != "" ] && CATFOUND="yes"
    #got a problem with sylpheed, "Categories=GTK;Network;Email;News;" this displays in both Network and Internet menus...
    if [ "$CATFOUND" = "yes" ];then
     cPATTERN="s%^Categories=.*%Categories=${ONEORIGCAT}%"
     break
    fi
   done
  fi
 fi
 sed -i -e "$cPATTERN" $ONEDOT #fix Categories= entry.

 #w019 does the icon exist?...
 ICON="`grep '^Icon=' $ONEDOT | cut -f 2 -d '='`"
 if [ "$ICON" != "" ];then
  [ -e "${ICON}" ] && continue #it may have a hardcoded path.
  ICONBASE="`basename "$ICON"`"
  #110706 fix icon entry in .desktop... 110821 improve...
  #first search where jwm looks for icons... 111207...
  FNDICON="`find /usr/local/lib/X11/mini-icons /usr/share/pixmaps -maxdepth 1 -name $ICONBASE -o -name $ICONBASE.png -o -name $ICONBASE.xpm -o -name $ICONBASE.jpg -o -name $ICONBASE.jpeg -o -name $ICONBASE.gif -o -name $ICONBASE.svg | grep -i -E 'png$|xpm$|jpg$|jpeg$|gif$|svg$' | head -n 1`"
  if [ "$FNDICON" ];then
   ICONNAMEONLY="`basename $FNDICON`"
   iPTN="s%^Icon=.*%Icon=${ICONNAMEONLY}%"
   sed -i -e "$iPTN" $ONEDOT
   continue
  else
   #look elsewhere... 111207...
   FNDICON="`find /usr/share/icons /usr/local/share/pixmaps -name $ICONBASE -o -name $ICONBASE.png -o -name $ICONBASE.xpm -o -name $ICONBASE.jpg -o -name $ICONBASE.jpeg -o -name $ICONBASE.gif -o -name $ICONBASE.svg | grep -i -E 'png$|xpm$|jpg$|jpeg$|gif$|svg$' | head -n 1`"
   #111207 look further afield, ex parole pkg has /usr/share/parole/pixmaps/parole.png...
   [ ! "$FNDICON" ] && [ -d /usr/share/$ICONBASE ] && FNDICON="`find /usr/share/${ICONBASE} -name $ICONBASE -o -name $ICONBASE.png -o -name $ICONBASE.xpm -o -name $ICONBASE.jpg -o -name $ICONBASE.jpeg -o -name $ICONBASE.gif -o -name $ICONBASE.svg | grep -i -E 'png$|xpm$|jpg$|jpeg$|gif$|svg$' | head -n 1`"
   #111207 getting desperate...
   [ ! "$FNDICON" ] && FNDICON="`find /usr/share -name $ICONBASE -o -name $ICONBASE.png -o -name $ICONBASE.xpm -o -name $ICONBASE.jpg -o -name $ICONBASE.jpeg -o -name $ICONBASE.gif -o -name $ICONBASE.svg | grep -i -E 'png$|xpm$|jpg$|jpeg$|gif$|svg$' | head -n 1`"
   if [ "$FNDICON" ];then
    ICONNAMEONLY="`basename "$FNDICON"`"
    #150203 careful it doesn't link to itself: (see also 2createpackages)
    if [[ "$FNDICON" != *usr/share/pixmaps/${ICONNAMEONLY} ]];then
     ln -snf "$FNDICON" /usr/share/pixmaps/${ICONNAMEONLY}
     iPTN="s%^Icon=.*%Icon=${ICONNAMEONLY}%"
     sed -i -e "$iPTN" ${ONEDOT}
     continue
    fi
   fi
  fi
  #substitute a default icon...
  sed -i -e "$iPATTERN" ${ONEDOT} #note, ONEDOT is name of .desktop file.
 fi
 
 #120926 if a langpack installed, it will have /usr/share/applications.in (see /usr/sbin/momanager).
 ABASEDESKTOP="`basename $ONEDOT`"
 ADIRDESKTOP="`dirname $ONEDOT`"
 if [ -f /usr/share/applications.in/${ABASEDESKTOP} ];then
  TARGETLANG="`echo -n $LANG_USER | cut -f 1 -d '_'`" #ex: de
  tlPTN="^Name\[${TARGETLANG}\]"
  if [ "$(grep "$tlPTN" ${ADIRDESKTOP}/${ABASEDESKTOP})" = "" ];then
   if [ "$(grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP})" != "" ];then
    #aaargh, these accursed back-slashes! ....
    INSERTALINE="`grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP} | sed -e 's%\[%\\\\[%' -e 's%\]%\\\\]%'`"
    sed -i -e "s%^Name=%${INSERTALINE}\\nName=%" ${ADIRDESKTOP}/${ABASEDESKTOP}
   fi
  fi
  #do same for Comment field...
  tlPTN="^Comment\[${TARGETLANG}\]"
  if [ "$(grep "$tlPTN" ${ADIRDESKTOP}/${ABASEDESKTOP})" = "" ];then
   if [ "$(grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP})" != "" ];then
    #aaargh, these accursed back-slashes! ....
    INSERTALINE="`grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP} | sed -e 's%\[%\\\\[%' -e 's%\]%\\\\]%'`"
    sed -i -e "s%^Comment=%${INSERTALINE}\\nComment=%" ${ADIRDESKTOP}/${ABASEDESKTOP}
   fi
  fi
  #well, i suppose need this too...
  TARGETLANG="`echo -n $LANG_USER | cut -f 1 -d '.'`" #ex: de_DE
  tlPTN="^Name\[${TARGETLANG}\]"
  if [ "$(grep "$tlPTN" ${ADIRDESKTOP}/${ABASEDESKTOP})" = "" ];then
   if [ "$(grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP})" != "" ];then
    #aaargh, these accursed back-slashes! ....
    INSERTALINE="`grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP} | sed -e 's%\[%\\\\[%' -e 's%\]%\\\\]%'`"
    sed -i -e "s%^Name=%${INSERTALINE}\\nName=%" ${ADIRDESKTOP}/${ABASEDESKTOP}
   fi
  fi
  #do same for Comment field...
  tlPTN="^Comment\[${TARGETLANG}\]"
  if [ "$(grep "$tlPTN" ${ADIRDESKTOP}/${ABASEDESKTOP})" = "" ];then
   if [ "$(grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP})" != "" ];then
    #aaargh, these accursed back-slashes! ....
    INSERTALINE="`grep "$tlPTN" /usr/share/applications.in/${ABASEDESKTOP} | sed -e 's%\[%\\\\[%' -e 's%\]%\\\\]%'`"
    sed -i -e "s%^Comment=%${INSERTALINE}\\nComment=%" ${ADIRDESKTOP}/${ABASEDESKTOP}
   fi
  fi
  rm -f /usr/share/applications.in/${ABASEDESKTOP} #20230215
 fi
 
done

#20230222 code-block removed. /usr/share/locale.in no longer exists.
# (it only exists in rootfs-skeleton in woofQ)

#due to images at / in .pet and post-install script, .files may have some invalid entries...
INSTFILES="`cat /root/.packages/${DLPKG_NAME}.files`"
echo "$INSTFILES" |
while read ONEFILE
do
 if [ ! -e "$ONEFILE" ];then
  ofPATTERN='^'"$ONEFILE"'$'
  grep -v "$ofPATTERN" /root/.packages/${DLPKG_NAME}.files > /tmp/petget_instfiles
  mv -f /tmp/petget_instfiles /root/.packages/${DLPKG_NAME}.files
 fi
done

#w482 DB_ENTRY may be missing DB_category and DB_description fields...
#pkgname|nameonly|version|pkgrelease|category|size|path|fullfilename|dependencies|description|
#optionally on the end: compileddistro|compiledrelease|repo| (fields 11,12,13)
DESKTOPFILE="`grep '\.desktop$' /root/.packages/${DLPKG_NAME}.files | head -n 1`"
if [ "$DESKTOPFILE" != "" ];then
 DB_category="`echo -n "$DB_ENTRY" | cut -f 5 -d '|'`"
 DB_description="`echo -n "$DB_ENTRY" | cut -f 10 -d '|'`"
 CATEGORY="$DB_category"
 DESCRIPTION="$DB_description"
 #if [ "$DB_category" = "" ];then
 zCATEGORY="`cat $DESKTOPFILE | grep '^Categories=' | sed -e 's%;$%%' | cut -f 2 -d '=' | rev | cut -f 1 -d ';' | rev`" #121109
 if [ "$zCATEGORY" != "" ];then #121109
  #v424 but want the top-level menu category...
  catPATTERN="[ ,]${zCATEGORY},|[ ,]${zCATEGORY} |[ ,]${zCATEGORY}"'$' #121119 fix bug in pattern.
  CATEGORY="`echo "$PUPHIERARCHY" | cut -f 1 -d '#' | grep -E "$catPATTERN" | grep ':' | cut -f 1 -d ' ' | head -n 1`" #121119 /etc/xdg/menus/hierarchy 
 fi
 if [ "$DB_description" = "" ];then
  DESCRIPTION="`cat $DESKTOPFILE | grep '^Comment=' | cut -f 2 -d '='`"
  [ "$DESCRIPTION" = "" ] && DESCRIPTION="`cat $DESKTOPFILE | grep '^Name=' | cut -f 2 -d '='`"	# shinobar
 fi
 if [ "$DB_category" = "" -o "$DB_description" = "" ];then
  newDB_ENTRY="`echo -n "$DB_ENTRY" | cut -f 1-4 -d '|'`"
  newDB_ENTRY="$newDB_ENTRY"'|'"$CATEGORY"'|'
  newDB_ENTRY="$newDB_ENTRY""`echo -n "$DB_ENTRY" | cut -f 6-9 -d '|'`"
  newDB_ENTRY="$newDB_ENTRY"'|'"$DESCRIPTION"'|'
  newDB_ENTRY="$newDB_ENTRY""`echo -n "$DB_ENTRY" | cut -f 11-14 -d '|'`"
  #[ "`echo -n "newDB_ENTRY" | rev | cut -c 1`" != "|" ] && newDB_ENTRY="$newDB_ENTRY"'|'
  DB_ENTRY="$newDB_ENTRY"
 fi
fi

echo "$DB_ENTRY" >> /root/.packages/user-installed-packages

if [ "$NUMDESKFILE" != "0" ];then #171109
 update-desktop-database #creates creates /usr/share/applications/mimeinfo.cache
fi

#110706 fix 'Exec filename %u' line...
DESKTOPFILES="`grep '\.desktop$' /root/.packages/${DLPKG_NAME}.files | tr '\n' ' '`"
for ONEDESKTOP in $DESKTOPFILES
do
 sed -i -e 's/ %u$//' $ONEDESKTOP #200402 note, already removed at #121015
 
 #200402 Exec= must not contain a path...
 grep -q '^Exec=/' $ONEDESKTOP
 if [ $? -eq 0 ];then
  EXESPEC="/$(grep '^Exec=/' ${ONEDESKTOP} | cut -f 2- -d '/')"
  xEXESPEC="$(echo -n "$EXESPEC" | sed -e 's% [^/ ]*$%%')" #drop any param off end
  EXENAME="$(basename $xEXESPEC)"
  EXEPATH="$(dirname $xEXESPEC)"
  xEXEPATH=''
  case "$EXEPATH" in
   /bin|/sbin|/usr/bin|/usr/sbin/|/usr/local/bin)
    xEXEPATH="$EXEPATH"
   ;;
  esac
  [ -x /bin/${EXENAME} ] && xEXEPATH='/bin'
  [ -x /sbin/${EXENAME} ] && xEXEPATH='/sbin'
  [ -x /usr/sbin/${EXENAME} ] && xEXEPATH='/usr/sbin'
  [ -x /usr/local/bin/${EXENAME} ] && xEXEPATH='/usr/local/bin'
  [ -x /usr/bin/${EXENAME} ] && xEXEPATH='/usr/bin'
  if [ ! "$xEXEPATH" ];then
   if [ "$EXENAME" == "AppRun" ];then #20210915 disaster. ref: http://forum.puppylinux.com/viewtopic.php?p=36693#p36693
    #change $EXENAME to something sane... ex: extract "abiword" out of /usr/share/applications/abiword.desktop
    EXENAME="$(echo -n "${ONEDESKTOP}" | LANG=${LANG_USER} rev | cut -f 1 -d '/' | cut -f 2- -d '.' | LANG=${LANG_USER} rev)"
    which "$EXENAME" >/dev/null
    if [ $? -eq 0 ];then #precaution
     EXENAME="${EXENAME}xxx"
    fi
   fi
   echo -e "#!/bin/sh\nexec ${EXESPEC}" > /usr/bin/${EXENAME}
   chmod 755 /usr/bin/${EXENAME}
   xEXEPATH='/usr/bin'
   if [ -e /root/.packages/${DLPKG_NAME}.remove ];then #puninstall.sh
    echo "rm -f /usr/bin/${EXENAME}" >> /root/.packages/${DLPKG_NAME}.remove
   else
    echo -e "#!/bin/sh\nrm -f /usr/bin/${EXENAME}" > /root/.packages/${DLPKG_NAME}.remove
    chmod 755 /root/.packages/${DLPKG_NAME}.remove
   fi
  fi
  exePTN="s%^Exec=.*%Exec=${EXENAME}%"
  sed -i -e "$exePTN" $ONEDESKTOP
 fi
 
 build-rox-sendto $ONEDESKTOP #180518 maybe add to rox right-click open-with menu.
done

#120907 post-install hacks...
/usr/local/petget/hacks-postinstall.sh $DLPKG_MAIN

#announcement of successful install...
#announcement is done after all downloads, in downloadpkgs.sh...
CATEGORY="`echo -n "$CATEGORY" | cut -f 1 -d ';'`"
[ "$CATEGORY" = "" ] && CATEGORY="none"
[ "$CATEGORY" = "BuildingBlock" ] && CATEGORY="none"
echo "PACKAGE: $DLPKG_NAME CATEGORY: $CATEGORY" >> /tmp/petget-installed-pkgs-log

#110503 change ownership of some files if non-root... 20221023 zeus super-user...
#hmmm, i think this will only work if running this script as root...
# (the entry script pkg_chooser.sh has sudo to switch to root)
HOMEUSER="`grep '^tty1' /etc/inittab | tr -s ' ' | cut -f 3 -d ' '`" #root or fido.
if [ "$HOMEUSER" != "root" -a "$HOMEUSER" != "zeus" ];then
 grep -E '^/var|^/root|^/etc' /root/.packages/${DLPKG_NAME}.files |
 while read FILELINE
 do
  busybox chown ${HOMEUSER}:users "${FILELINE}"
 done
fi

#120523 precise puppy needs this... (refer also rc.update and 3builddistro)
if [ "`grep '/usr/share/glib-2.0/schemas' /root/.packages/${DLPKG_NAME}.files`" != "" ];then
 [ -e /usr/bin/glib-compile-schemas ] && /usr/bin/glib-compile-schemas /usr/share/glib-2.0/schemas
fi
if [ "$(grep "/usr/lib${xARCHDIR}/gio/modules" /root/.packages/${DLPKG_NAME}.files)" != "" ];then
 [ -e /usr/bin/gio-querymodules ] && /usr/bin/gio-querymodules /usr/lib${xARCHDIR}/gio/modules
fi

#140204 no longer exporting LD_LIBRARY_PATH in /etc/profile, so must update /etc/ld.so.conf and /etc/ld.so.cache
#glibc template changed, 'ldconfig' now in main f.s., not in devx.
#note, similar code is in removepreview.sh
LDFLG=0 #140214 filter out inapropriate paths...
for iLIB in `grep '/lib/$' /root/.packages/${DLPKG_NAME}.files | sort -u | grep -v -E ' |/usr/share|/var/|/diet/' | sed -e 's%/$%%' | tr '\n' ' '` #ex: /usr/lib/
do # -x means match whole line...
 [ "$(grep -x "$iLIB" /etc/ld.so.conf)" = "" ] && echo "$iLIB" >> /etc/ld.so.conf
 LDFLG=1
done
if [ "$xARCHDIR" ];then
 for iLIB in `grep "/lib/${ARCHDIR}/$" /root/.packages/${DLPKG_NAME}.files | sort -u | grep -v ' ' | sed -e 's%/$%%' | tr '\n' ' '` #ex: /usr/lib/
 do # -x means match whole line...
  [ "$(grep -x "$iLIB" /etc/ld.so.conf)" = "" ] && echo "$iLIB" >> /etc/ld.so.conf
  LDFLG=1
 done
fi
#140214 ubuntu has extra ld.so.conf files...
for LDSOFILE in `grep '/lib/.*ld.so.conf$' /root/.packages/${DLPKG_NAME}.files | tr '\n' ' '`
do
 LDSOPATH="$(dirname "$LDSOFILE")"
 if [ -d "$LDSOPATH" ];then
  [ "`grep -x "$LDSOPATH" /etc/ld.so.conf`" = "" ] && echo "$LDSOPATH" >> /etc/ld.so.conf
  LDFLG=1
 fi
done
[ $LDFLG -eq 1 ] && ldconfig

[ $DISPLAY ] && pupkill $YAFPID1 #131222
exit 0
###END###
