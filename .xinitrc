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

thunar --daemon &
xwinwrap -fs -fdt -ni -b -nf -un -ov -o 1.0 -debug -- mpv -wid WID --loop --no-audio ~/Downloads/wallpapers/mylivewallpapers.com-Shiki-Ryougi-Fate-Grand-Order.mp4 &
picom &
xmobar &
lxqt-policykit-agent &
exec dbus-launch --exit-with-session qtile 
