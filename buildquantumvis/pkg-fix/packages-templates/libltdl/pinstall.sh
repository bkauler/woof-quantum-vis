#!/bin/sh

LIBLTDL="`find usr/lib -maxdepth 1 -type f -name libltdl.so.* | head -n 1`"
if [ "$LIBLTDL" ];then
 BASELTDL="`basename $LIBLTDL`"
 ln -snf $BASELTDL usr/lib/libltdl.so.3 2>/dev/null
fi
