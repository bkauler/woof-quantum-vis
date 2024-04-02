#!/bin/sh
#called from ui_Classic and ui_Ziggy, after running findnames.sh.
#120908 script created.
#130511 pkg_chooser.sh has created layers-installed-packages (use instead of woof-installed-packages).
#151105 change MAIN_DIALOG to PPM_VER_DIFFS. gtkdialog4 to gtkdialog.

export TEXTDOMAIN=petget___versiondiffs
export OUTPUT_CHARSET=UTF-8

#created by findnames.sh...
[ ! -s /tmp/petget/filterpkgs.results.installed ] && exit

#120908 "ALREADY INSTALLED" may not be helpful, as the versions may differ. display these...
DIFFVERITEMS=""
for ONEALREADYINSTALLED in `cut -f 1,2,3 -d '|' /tmp/petget/filterpkgs.results.installed`
do
 #ex: langpack_de-20120718|langpack_de|20120718
 ONEPKG="$(echo -n "$ONEALREADYINSTALLED" | cut -f 1 -d '|')"
 ONENAMEONLY="$(echo -n "$ONEALREADYINSTALLED" | cut -f 2 -d '|')"
 ONEVERSION="$(echo -n "$ONEALREADYINSTALLED" | cut -f 3 -d '|')"
 onoPTN="|${ONENAMEONLY}|"
 INSTALLEDPKGS="$(cat /root/.packages/layers-installed-packages /root/.packages/user-installed-packages | grep "$onoPTN" | cut -f 1,3 -d '|' | tr '\n' ' ')"
 for AINSTALLEDPKG in $INSTALLEDPKGS
 do
  AIPKG="$(echo -n "$AINSTALLEDPKG" | cut -f 1 -d '|')"
  AIVER="$(echo -n "$AINSTALLEDPKG" | cut -f 2 -d '|')"
  if ! vercmp $AIVER eq $ONEVERSION;then
   DIFFVERITEMS="${DIFFVERITEMS}<item>${ONEPKG}|${AIPKG}</item>"
  fi
 done
done

[ "$DIFFVERITEMS" = "" ] && exit

export PPM_VER_DIFFS="<window title=\"$(gettext 'PPM: version differences')\" icon-name=\"gtk-about\">
<vbox>
  <text>
    <label>$(gettext "Normally in the PPM main window, if a package, regardless of version, is already installed, it will not be listed. HOWEVER, the output of a search lists all matching packages, including installed, and identifies already-installed packages with the text 'ALREADY INSTALLED' and a 'tick' icon.")</label>
  </text>
  <text>
    <label>$(gettext "If a package found by a search is a different version than already installed, it is listed below. Please do not install such packages unless there is a particular reason to do so.")</label>
  </text>
  <table>
    <label>$(gettext 'Found package')|$(gettext 'Installed package')</label>
    ${DIFFVERITEMS}
  </table>
  <hbox>
    <button ok></button>
  </hbox>
</vbox>
</window>"

gtkdialog --program=PPM_VER_DIFFS

