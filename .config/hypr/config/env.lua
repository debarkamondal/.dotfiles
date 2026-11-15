-- Environment variables

hl.env("GDK_SCALE", "1")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("GDK_BACKEND", "wayland,x11,*")
-- GTK 4.24 binds ext-background-effect-v1 but never sets a blur region, which makes
-- Hyprland 0.56 treat every GTK window as "no blur". Disable it so Hyprland's own
-- blur applies again. Remove once fixed upstream. (hyprwm/Hyprland#16507)
hl.env("GDK_WAYLAND_DISABLE", "ext_background_effect_manager_v1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1")
