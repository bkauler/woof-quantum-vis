#!/bin/sh
#post-install script.

#woof: current directory is in rootfs, which has the final filesystem.
#ppm: current directory is /.

if [ "`pwd`" != "/" ];then
 echo '#!/bin/sh' > ./usr/local/bin/defaultdraw
 echo 'exec inkscape "$@"' >> ./usr/local/bin/defaultdraw
 chmod 755 ./usr/local/bin/defaultdraw
fi

#20240222 de-bloat...
if [ -d usr/lib/libreoffice/help ];then
 rm -rf usr/lib/libreoffice/help
 mkdir usr/lib/libreoffice/help
fi

mkdir -p usr/share/pixmaps
if [ -f usr/share/icons/hicolor/48x48/apps/inkscape.png ];then
 ln -s ../icons/hicolor/48x48/apps/inkscape.png usr/share/pixmaps/inkscape.png
else
 ln -s ../icons/hicolor/48x48/apps/org.inkscape.Inkscape.png usr/share/pixmaps/inkscape.png
fi

if [ -f usr/share/applications/org.inkscape.Inkscape.desktop ];then
 rm -f usr/share/applications/org.inkscape.Inkscape.desktop
fi

#20240222 de-bloat...
if [ -d usr/share/inkscape/tutorials ];then
 rm -rf usr/share/inkscape/tutorials
 mkdir usr/share/inkscape/tutorials
fi
if [ -d usr/share/inkscape/examples ];then
 rm -rf usr/share/inkscape/examples
 mkdir usr/share/inkscape/examples
fi
