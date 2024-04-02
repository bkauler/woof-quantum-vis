#!/bin/sh
#110116 change to yaf-splash.
#110312 rodin.s: adding gettext
#20210612 replaced yaf-splash with gtkdialog-splash

export TEXTDOMAIN=mtpaintsnapshot #usr_sbin
export TEXTDOMAINDIR=/usr/share/locale
export OUTPUT_CHARSET=UTF-8
eval_gettext () {
  local myMESSAGE=$(gettext "$1")
  eval echo \"$myMESSAGE\"
}

#xmessage -center -bg "#ff00ff" -title "mtPaint screen snapshot utility" -buttons "" -timeout 8 "
#There will now be a pause of 10 seconds to allow you to adjust
#windows as you wish, then a snapshot will be taken of entire screen.
#
#Note, you can also take a snapshot of the main menu. Close this window,
#open the main menu to the desired layout, then wait until the 10 seconds
#has expired.
#
#This window will disappear in 8 seconds from its creation." &

gtkdialog-splash -placement center -bg '#ff00ff' -timeout 10 -close box -text "$(gettext 'mtPaint screen snapshot utility

There will now be a pause of 13 seconds to allow you to adjust windows as you wish, then a snapshot will be taken of entire screen.

Note, you can also take a snapshot of the main menu. Close this window, open the main menu to the desired layout, then wait until the 13 seconds has expired.')" &

sleep 13
exec mtpaint -s
