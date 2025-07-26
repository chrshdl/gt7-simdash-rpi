# GT7-simdash Images

<picture>
  <source srcset="assets/sd_card_light.svg" media="(prefers-color-scheme: dark)">
  <source srcset="assets/sd_card_dark.svg" media="(prefers-color-scheme: light)">
  <img src="assets/sd_card_light.svg" alt="SD Card">
</picture>

This repository contains the configuration for building Raspberry Pi4 images for the [GT7-simdash](https://github.com/chrshdl/gt7-simdash) project.

[![Build Status](https://github.com/chrshdl/gt7-simdash-rpi/actions/workflows/buildroot.yml/badge.svg)](https://github.com/chrshdl/gt7-simdash-rpi/actions/workflows/buildroot.yml)

[![Download Pi 4 Image](https://img.shields.io/badge/download-pi4--image-blue?logo=raspberry-pi)](https://github.com/chrshdl/gt7-simdash-rpi/releases/download/latest/sdcard-raspberrypi4.img)

## Features

- **Automated CI/CD**
  - Builds an SD card image for the Raspberry Pi with DSI display support on every push/PR/dispatch.

- **Supported Hardware**
  - **Boards**
    - Raspberry Pi 4 /w WiFi
  - **Displays**
    - Official Raspberry Pi DSI Display
    - Waveshare 7" DSI LCD (C), 1024x600

## Usage

### Download
You can download the latest SD card image for the Raspberry Pi4 by clicking the badge below.

[![Download Pi 4 Image](https://img.shields.io/badge/download-pi4--image-blue?logo=raspberry-pi)](https://github.com/chrshdl/gt7-br2-external/releases/download/latest/sdcard-raspberrypi4.img)

Use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or [balenaEtcher](https://www.balena.io/etcher/) to flash the image to your SD card.

### WiFi
After flashing insert the SD card into your computer and open the `boot` partition. Then edit `wpa_supplicant.conf`and replace

```ini
ssid="YOUR_WIFI_SSID"
psk="YOUR_WIFI_PASSWORD"
```

with your actual WiFi name and password. Save the file, eject the card and insert it into your Pi4. Now boot your device and it will connect to WiFi automatically on first startup.

## Contributing
Pull requests and improvements are welcome! If you encounter problems with builds, display support, or want to add new hardware, open an issue or PR.

## License
All of my code is MIT licensed. Libraries follow their respective licenses.


_Happy hacking and sim racing!_
