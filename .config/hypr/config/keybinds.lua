-- Keybindings

-- Core binds
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("uwsm app -- " .. terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm app -- " .. fileManager))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("uwsm app -- " .. browser))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("uwsm app -- hyprctl reload"))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("uwsm app -- wlogout"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("uwsm app -- hyprlock"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Mac-like Spotlight and Extras
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("uwsm app -- " .. menu .. " -show drun"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("~/.config/rofi/scripts/image-preview.sh | " .. menu .. " -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + period", hl.dsp.exec_cmd("uwsm app -- rofi -show emoji"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("uwsm app -- rofi -show find -modi find:~/.config/rofi/scripts/find-files.sh"))

-- Toggle waybar
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill waybar || uwsm app -- waybar"), { release = true })

-- Move focus with mainMod + vim keys
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind("CTRL + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind("CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + SHIFT + s", hl.dsp.exec_cmd("~/.config/hypr/Scripts/screenshot.sh full"))
hl.bind(mainMod .. " + SHIFT + p", hl.dsp.exec_cmd("~/.config/hypr/Scripts/screenshot.sh region"))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F\".\" '{print $2}' | xargs dunstify -a \"changevolume\" -u low -r 9993 -h int:value:$1  \"Volume: $1%\" -t 2000"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F\".\" '{print $2}' | xargs dunstify -a \"changevolume\" -u low -r 9993 -h int:value:$1  \"Volume: $1%\" -t 2000"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
