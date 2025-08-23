#!/bin/sh
set -eu

SRC=/boot/wifi.conf
DST=/etc/wpa_supplicant/wpa_supplicant-wlan0.conf
MARKER=/var/lib/wifi-config-installed

# Check if already installed
if [ -e "$MARKER" ]; then
    echo "Wi-Fi config already installed, skipping."
    exit 0
fi

# Install only if wifi.conf exists
if [ -f "$SRC" ]; then
    echo "Installing Wi-Fi config from $SRC"
    . "$SRC"   # Load SSID, PSK, COUNTRY

    mkdir -p /etc/wpa_supplicant

    cat >"$DST" <<EOF
ctrl_interface=/run/wpa_supplicant
update_config=1
country=${COUNTRY:-DE}

network={
    ssid="$SSID"
    psk="$PSK"
    key_mgmt=WPA-PSK
}
EOF

    chmod 600 "$DST"
    mkdir -p /var/lib
    touch "$MARKER"

    echo "Wi-Fi config installed successfully."

    # Delete the source file to avoid confusion
    rm -f "$SRC"
    sync
    echo "Removed $SRC after installation."
else
    echo "No $SRC found, skipping Wi-Fi setup."
fi
