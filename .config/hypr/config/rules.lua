-- Window rules

-- Ignore maximize requests from apps
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Enable blur and ignorezero for Ghostty
hl.config({
    windowrulev2 = {
        "blur, class:^(com.mitchellh.ghostty)$",
        "ignorezero, class:^(com.mitchellh.ghostty)$",
    }
})




