#!/bin/sh

#20240324 if coreutils is updated in a running qv, FIXUPHACK is ignored
#but pinstall.sh will run, after install.
#will need to fix /usr/bin/df

if [ "$(pwd)" == "/" ];then
 #in running qv, not woofqv.
 LANG=C file /usr/bin/df | grep -q 'ELF'
 if [ $? -eq 0 ];then
  mv -f /usr/bin/df /usr/bin/df-FULL
  ln -s df.sh /usr/bin/df
 fi
fi
