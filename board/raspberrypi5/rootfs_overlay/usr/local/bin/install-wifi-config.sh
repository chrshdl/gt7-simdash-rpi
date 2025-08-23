#!/bin/sh
set -eu
umask 077

SRC=/boot/wifi.conf
DST=/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
MARKER=/var/lib/wifi-config-installed

# Run once
[ -e "$MARKER" ] && { echo "Wi-Fi config already installed, skipping."; exit 0; }
[ -f "$SRC" ] || { echo "No $SRC found, skipping Wi-Fi setup."; exit 0; }

# Read KEY="value" without executing the file
read_kv() { awk -F= -v k="$1" '
  $1==k {
    v=$2
    sub(/^[[:space:]]*"/,"",v); sub(/"[[:space:]]*$/,"",v)
    gsub(/\r$/,"",v)  # strip CR if edited on Windows
    print v; exit
  }' "$SRC"; }

SSID="$(read_kv SSID || true)"
PSK="$(read_kv PSK || true)"
COUNTRY="$(read_kv COUNTRY || echo DE)"

[ -n "${SSID:-}" ] || { echo "SSID missing in $SRC"; exit 1; }
[ -n "${PSK:-}" ]   || { echo "PSK missing in $SRC"; exit 1; }
COUNTRY="$(printf '%s' "$COUNTRY" | tr '[:lower:]' '[:upper:]' | cut -c1-2)"

# Escape for wpa_supplicant conf
esc() { printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'; }
SSID_E="$(esc "$SSID")"
PSK_E="$(esc "$PSK")"

mkdir -p /etc/wpa_supplicant /var/lib

cat >"$DST" <<EOF
ctrl_interface=/run/wpa_supplicant
update_config=1
country=$COUNTRY

network={
    ssid="$SSID_E"
    psk="$PSK_E"
    key_mgmt=WPA-PSK
}
EOF

chmod 600 "$DST"
touch "$MARKER"
echo "Wi-Fi config installed successfully to $DST."

# Optional: keep a copy instead of deleting
# mv -f "$SRC" "${SRC}.installed"
rm -f "$SRC"
sync
echo "Removed $SRC after installation."
