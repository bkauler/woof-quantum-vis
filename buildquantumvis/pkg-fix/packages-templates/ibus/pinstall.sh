#!/bin/sh
#20240926

mkdir -p etc/profile.d
echo 'export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus' > etc/profile.d/ibus

mkdir -p root/Startup
echo '#!/bin/sh
case "${LANG/_*/}" in
 zh)
  ibus-daemon --daemonize --xim --replace --restart
 ;;
esac' > root/Startup/ibus
chmod 755 root/Startup/ibus
