#!/usr/bin/env python3
import json
import subprocess


def playerctl(*args):
    result = subprocess.run(
        ["playerctl", *args], capture_output=True, text=True, check=False
    )
    return result.stdout.strip() if result.returncode == 0 else ""


if playerctl("status") in ("Playing", "Paused"):
    title = playerctl("metadata", "title") or "Unknown title"
    artist = playerctl("metadata", "artist")
    album = playerctl("metadata", "album")
    details = "\n".join(filter(None, (title, artist, album)))
    print(json.dumps({"text": "", "tooltip": details}))
else:
    print(json.dumps({"text": ""}))
