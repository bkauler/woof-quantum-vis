#!/bin/sh
#post-install script.

 echo "Configuring Firefox browser..."
 
  echo '#!/bin/sh' > ./usr/local/bin/defaultbrowser
  echo 'exec firefox "$@"' >> ./usr/local/bin/defaultbrowser
  chmod 755 ./usr/local/bin/defaultbrowser

  if [ ! -e usr/local/bin/gtkmoz ];then
   ln -s ../../bin/firefox usr/local/bin/gtkmoz
  fi

 echo "...ok, setup for Mozilla (Seamonkey)."
 echo -n "firefox" > /tmp/rightbrwsr.txt
 
 #100407 sm 2.0.4 has svg support builtin...
 [ -f ./usr/lib/mozilla/plugins/libmozsvgdec.so ] && rm -f ./usr/lib/mozilla/plugins/libmozsvgdec.so

#20231109 ***TODO*** oe has usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
#         ***TODO*** with langpacks
#20230310 debian bookworm, have all translations in pkg-list, cutdown...
if [ -d usr/lib/firefox/browser/extensions ];then
 FFext='usr/lib/firefox/browser/extensions'
elif [ -d usr/lib/firefox-esr/browser/extensions ];then
 FFext='usr/lib/firefox-esr/browser/extensions'
elif [ -d usr/share/mozilla/extensions ];then #20231212 ff compiled in oe
 FFext0="$(find usr/share/mozilla/extensions -mindepth 2 -maxdepth 2 -type f -name langpack-de@firefox.mozilla.org.xpi | head -n 1)"
 FFext="${FFext0%/*}" #ex: usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}
else
 FFext=''
fi
if [ "$FFext" ];then
 mkdir -p /tmp/3buildeasydistro-pinstall-ff
 cp -a ${FFext}/langpack* /tmp/3buildeasydistro-pinstall-ff/
 rm -f ${FFext}/langpack*
 BUILD_SUPPORT_LANGS='de:German en:English fr:French'
 #um, no, build-choice copied into rootfs later...
 #. ./root/.packages/build-choices
. /usr/local/woofV/configure/build-choices #20240220
 for aFFlang in $(echo "$BUILD_SUPPORT_LANGS" | tr ' ' '\n' | cut -f 1 -d ':' | tr '\n' ' ')
 do
  if [ "$aFFlang" == "no" ];then #20230423 20230424 remove nn
   cp -a -f /tmp/3buildeasydistro-pinstall-ff/langpack-nb* ${FFext}/ 2>/dev/null
   #cp -a -f /tmp/3buildeasydistro-pinstall-ff/langpack-nn* ${FFext}/ 2>/dev/null
  fi
  cp -a -f /tmp/3buildeasydistro-pinstall-ff/langpack-${aFFlang}* ${FFext}/ 2>/dev/null
 done
 rm -rf /tmp/3buildeasydistro-pinstall-ff
fi

#20230310 rootfs-skeleton/usr/bin/ec-chroot-www has this content:
#empty -f ec-chroot www seamonkey
#replace with firefox...
sed -i -e 's%^empty .*%empty -f ec-chroot www firefox%' usr/bin/ec-chroot-www
#also fix rootfs-skeleton/usr/share/applications/ec-www.desktop ...
sed -i -e 's%Chromium%Firefox%' usr/share/applications/ec-www.desktop

#20231109 update mstone entry in prefs.js... 20240220 fix... 20240321 fix
FFver="$(grep -F '|firefox|' root/.packages/woof-installed-packages | cut -f 3 -d '|' | sed -e 's%-r[0-9]$%%')"
if [ "$FFver" ];then
 sed -i '/mstone/d' root/.mozilla/firefox/9nma1n9v.default-release/prefs.js
 echo "user_pref(\"browser.startup.homepage_override.mstone\", \"${FFver}\");" >> root/.mozilla/firefox/9nma1n9v.default-release/prefs.js
fi
