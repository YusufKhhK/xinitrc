#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi
#
#
#boot
doas mount /dev/sda1 /boot/ &
#swap
doas swapon /dev/sda2 &
#scripts
doas sh ~/script/perf.sh &
sxhkd -c $HOME/.config/sxhkd/sxhkdrc &
sh ~/script/display.sh &
#Wallpaper and Animations
xwallpaper --stretch /home/yusuf/Pictures/0171.jpg &
picom --config ~/.config/picom.conf &
wal -i /home/yusuf/Pictures/0171.jpg &
redshift -l 30.043400:31.235200 -x -O 3700K & 
#Exec Dwm
exec dwmblocks &
exec dwm




