export FLYCTL_INSTALL="/home/dezire/.fly"
  export PATH="$FLYCTL_INSTALL/bin:$PATH"

if uwsm check may-start && uwsm select; then
	exec uwsm start hyprland.desktop
fi
