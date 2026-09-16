-- Input, touchpad, gestures, devices

hl.config({
    input = {
        kb_layout = "us",
        kb_variant = "",
        kb_model = "",
        kb_options = "",
        kb_rules = "",
        follow_mouse = 1,
        sensitivity = 0.1,
	scroll_factor = 1.5,
        touchpad = {
            natural_scroll = true,
            disable_while_typing = true,
            clickfinger_behavior = true,
            tap_to_click = true,
        },
    },
})

-- Gestures
hl.gesture({
    fingers = 4,
    direction = "horizontal",
    action = "workspace",
})

-- Device
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.monitor({
  output = "HDMI-A-1",
  mode = "2560x1440@99.95",
  cm = 'srgb',
  sdrbrightness = 1.8,
  sdrsaturation = 0.7
})

