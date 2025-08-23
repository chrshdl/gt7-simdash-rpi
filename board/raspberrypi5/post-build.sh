#!/bin/sh
set -eu

T="${TARGET_DIR}"

# Ensure target dirs exist
mkdir -p \
  "$T/etc/systemd/system/multi-user.target.wants" \
  "$T/etc/systemd/system/getty.target.wants" \
  "$T/etc/wpa_supplicant"

# Find systemd unit dir in the image
UNITDIR=""
for d in /lib/systemd/system /usr/lib/systemd/system; do
  if [ -e "$T$d/systemd-networkd.service" ]; then UNITDIR="$d"; break; fi
done
[ -n "$UNITDIR" ] || { echo "ERROR: systemd unit dir not found in target"; exit 1; }

# Force a login prompt on tty1
if [ -e "$T$UNITDIR/getty@.service" ]; then
  ln -snf "$UNITDIR/getty@.service" \
    "$T/etc/systemd/system/getty.target.wants/getty@tty1.service"
fi

# Mask the generic unit
ln -snf /dev/null "$T/etc/systemd/system/wpa_supplicant.service"
rm -f "$T/etc/systemd/system/multi-user.target.wants/wpa_supplicant.service" 2>/dev/null || true

# Wifi credentials
ln -snf /etc/systemd/system/wifi-setup.service \
    "${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/wifi-setup.service"

# Enable the correct per-interface instance
ln -snf "$UNITDIR/wpa_supplicant@.service" \
  "$T/etc/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service"

# Network stack
ln -snf "$UNITDIR/systemd-networkd.service" \
  "$T/etc/systemd/system/multi-user.target.wants/systemd-networkd.service"
ln -snf "$UNITDIR/systemd-resolved.service" \
  "$T/etc/systemd/system/multi-user.target.wants/systemd-resolved.service"

# Use resolved's resolv.conf
ln -snf /run/systemd/resolve/resolv.conf "$T/etc/resolv.conf"

# FOR DEBUG: mask gt7-simdash so it doesn't start
# if [ -e "${TARGET_DIR}/usr/lib/systemd/system/gt7-simdash.service" ]; then
#   ln -sf /dev/null "${TARGET_DIR}/etc/systemd/system/gt7-simdash.service"
# fi