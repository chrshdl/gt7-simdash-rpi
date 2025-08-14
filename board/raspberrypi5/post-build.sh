#!/bin/sh
set -eu

# Ensure target dirs exist
mkdir -p "${TARGET_DIR}/etc/systemd/system/multi-user.target.wants"
mkdir -p "${TARGET_DIR}/etc/systemd/system/getty.target.wants"

# Force a login prompt on tty1
ln -sf /usr/lib/systemd/system/getty@.service \
  "${TARGET_DIR}/etc/systemd/system/getty.target.wants/getty@tty1.service"

# Enable network stack
ln -sf /usr/lib/systemd/system/wpa_supplicant@.service \
  "${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/wpa_supplicant@wlan0.service"
ln -sf /usr/lib/systemd/system/systemd-networkd.service \
  "${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/systemd-networkd.service"
ln -sf /usr/lib/systemd/system/systemd-resolved.service \
  "${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/systemd-resolved.service"

# Use resolved's resolv.conf
ln -sf /run/systemd/resolve/resolv.conf "${TARGET_DIR}/etc/resolv.conf"

# SAFETY: mask gt7-simdash so it doesn't start during rescue
# (a symlink to /dev/null is how systemd masks units)
if [ -e "${TARGET_DIR}/usr/lib/systemd/system/gt7-simdash.service" ]; then
  ln -sf /dev/null "${TARGET_DIR}/etc/systemd/system/gt7-simdash.service"
fi
