#!/bin/sh

#it may have both...
if [ -f ./usr/share/usb.ids.gz ];then
 [ -f ./usr/share/usb.ids ] && rm -f ./usr/share/usb.ids
 cd usr/share
 gunzip usb.ids.gz
 cd ..
 cd ..
fi
