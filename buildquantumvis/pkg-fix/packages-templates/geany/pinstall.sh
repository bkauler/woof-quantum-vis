#!/bin/sh
#post-install script.

#unleashed: current directory is in rootfs, which has the final filesystem.
#petget: current directory is /.

if [ ! "`pwd`" = "/" ];then

# [ ! -f ./usr/local/bin/leafpad ] && ln -s geanyshell ./usr/local/bin/leafpad
# [ ! -f ./usr/local/bin/beaver ] && ln -s geanyshell ./usr/local/bin/beaver


 echo '#!/bin/sh' > ./usr/local/bin/defaulttexteditor
 echo 'exec geany "$@"' >> ./usr/local/bin/defaulttexteditor
 chmod 755 ./usr/local/bin/defaulttexteditor

fi
