#!/bin/sh

# $1 is the target directory (target rootfs, NOT boot partition)
# $BINARIES_DIR is set by Buildroot to the images output dir

BOARD_DIR="$(dirname "$0")"

# Copy custom config.txt to the place where Buildroot assembles the boot partition.
cp -v "${BOARD_DIR}/config.txt" "${BINARIES_DIR}/rpi-firmware/config.txt"
