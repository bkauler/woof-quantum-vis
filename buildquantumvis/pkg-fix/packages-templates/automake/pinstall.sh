#!/bin/sh

#20240313 moved from FIXUPHACK...
if [ ! -e usr/bin/aclocal ];then
 REALFILE="`ls -1 usr/bin/aclocal* | head -n 1 | rev | cut -f 1 -d '/' | rev`"
 [ "$REALFILE" ] && ln -s $REALFILE usr/bin/aclocal
fi
if [ ! -e usr/bin/automake ];then
 REALFILE="`ls -1 usr/bin/automake* | head -n 1 | rev | cut -f 1 -d '/' | rev`"
 [ "$REALFILE" ] && ln -s $REALFILE usr/bin/automake
fi

if [ ! -e usr/share/automake ];then
 REALDIR="`find usr/share/ -maxdepth 1 -type d -name automake* | head -n 1 | rev | cut -f 1 -d '/' | rev`"
 ln -s $REALDIR usr/share/automake
fi

if [ ! -e usr/share/automake/config.guess ];then
 [ -e usr/share/misc/config.guess ] && ln -s ../misc/config.guess usr/share/automake/config.guess
fi
if [ ! -e usr/share/automake/config.sub ];then
 [ -e usr/share/misc/config.sub ] && ln -s ../misc/config.sub usr/share/automake/config.sub
fi
