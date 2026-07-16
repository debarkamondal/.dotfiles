-- Autostart programs

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- waybar &")
    hl.exec_cmd("uwsm app -- wl-paste --watch cliphist store &")
    hl.exec_cmd("uwsm app -- /usr/lib/polkit-kde-authentication-agent-1 &")
    hl.exec_cmd("uwsm app -- dunst &")
    hl.exec_cmd("uwsm app -- /usr/bin/kdeconnectd &")
end)
