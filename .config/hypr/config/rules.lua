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

-- Blur is configured globally in config/theme.lua (decoration.blur).
-- Note: per-window `blur` / `ignorezero` rules no longer exist as of 0.56.
-- Use `no_blur = true` to exclude a window from blur instead.




