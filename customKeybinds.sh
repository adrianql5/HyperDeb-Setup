#!/bin/bash

CONFIG="$HOME/.config/hypr/configs/Keybinds.conf"

cp "$CONFIG" "$CONFIG.bak"

grep -v -E 'xf86AudioPlayPause|xf86AudioPause|xf86AudioPlay|xf86AudioNext|xf86AudioPrev|xf86audiostop' "$CONFIG.bak" >"$CONFIG"

cat <<'EOF' >>"$CONFIG"
bindl = $mainMod CTRL, a, exec, $scriptsDir/MediaCtrl.sh --prv
bindl = $mainMod CTRL, z, exec, $scriptsDir/MediaCtrl.sh --nxt
bindl = $mainMod CTRL, SPACE, exec, $scriptsDir/MediaCtrl.sh --pause
EOF

echo "Actualización de combinaciones multimedia completada."
