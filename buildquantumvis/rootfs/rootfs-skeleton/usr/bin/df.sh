#!/bin/sh
#(c) Barry Kauler 2009, licence GPL2
#w482 fix for /dev/root.
#180408 support nvme drives

DF="busybox df"
[ "`which df-FULL`" != "" ] && DF="df-FULL"

RETSTUFF="`$DF $@`"
RETVAL=$?

#hack to remove two conflicting entries mounted on / ...
#if [ "`echo "$RETSTUFF" | grep '^rootfs '`" != "" ];then
# if [ "`echo "$RETSTUFF" | grep '^/dev/root '`" != "" ];then
#  RETSTUFF="`echo "$RETSTUFF" | grep -v '^rootfs '`"
# fi
#fi
RETSTUFF="`echo "$RETSTUFF" | grep -v '^rootfs '`"

#replace /dev/root with correct root partition...
#rdev is a busybox applet...
ROOTPARTITION="`rdev | grep ' /$' | cut -f 1 -d ' ' | grep -E '/dev/sd|/dev/hd|/dev/mmc|/dev/nvme'`" #180408
nPATTERN="s%^/dev/root %${ROOTPARTITION} %"
[ "$ROOTPARTITION" ] && RETSTUFF="`echo "$RETSTUFF" | sed -e "$nPATTERN"`"

echo "$RETSTUFF"
exit $RETVAL

###END###
