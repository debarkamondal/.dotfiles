-- Theme: general, decoration, animations, layouts

-- Monitor
hl.monitor({
    output = "eDP-1",
    mode = "2880x1800@90",
    position = "0x0",
    scale = "1.8",
    bitdepth = 10,
    cm = "wide",
    vrr = 1,
})

-- General
hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 1,
        col = {
            active_border = { colors = { "rgba(e0e0e0ff)", "rgba(ffffffff)" }, angle = 45 },
            inactive_border = "rgba(55555555)",
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },
})

-- Decoration
hl.config({
    decoration = {
        rounding = 10,
        active_opacity = 1.0,
        inactive_opacity = 1.0,
        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            vibrancy = 0.1696,
        },
    },
})

-- Animations
hl.config({
    animations = {
        enabled = true,
    },
})

-- Animation curves
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

-- Animation leaves
hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })

-- Layouts
hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = false,
        vrr = 1,
    },
})

-- Layer rules
hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
})

-- XWayland
hl.config({
    xwayland = {
        force_zero_scaling = true,
        use_nearest_neighbor = true,
    },
})
