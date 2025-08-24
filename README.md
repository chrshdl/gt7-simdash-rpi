# GT7-simdash-rpi

<picture>
  <source srcset="assets/sd_card_light.svg" media="(prefers-color-scheme: dark)">
  <source srcset="assets/sd_card_dark.svg" media="(prefers-color-scheme: light)">
  <img src="assets/sd_card_light.svg" alt="SD Card">
</picture>

This repository provides an external Buildroot tree to build a custom Linux image for the **Raspberry Pi** with the [GT7-simdash](https://github.com/chrshdl/gt7-simdash) instrument cluster application. Simply download the latest release and flash to your microSD card.

[![Download Pi 5 Image](https://img.shields.io/badge/download-pi5--image-blue?logo=raspberry-pi)](https://github.com/chrshdl/gt7-simdash-rpi/releases/download/latest/gt7simdash-pi5.img)

[![Build Status](https://github.com/chrshdl/gt7-simdash-rpi/actions/workflows/buildroot.yml/badge.svg)](https://github.com/chrshdl/gt7-simdash-rpi/actions/workflows/buildroot.yml)

## Features

- **Automated CI/CD**
  - Builds an image for the Raspberry Pi with DSI display and WiFi support on every push.

- **Supported Hardware**
  - **Boards**
    - Raspberry Pi 5, 64-bit
  - **Displays**
    - Official Raspberry Pi DSI Display
    - Waveshare 7" DSI LCD (C), 1024x600

## Usage

### Write to microSD

Use [Raspberry Pi Imager](https://www.raspberrypi.com/software/) or [balenaEtcher](https://www.balena.io/etcher/) to flash the image to your SD card. In the `Operating System` section scroll all the way down and select `Use Custom`. 

### Setup WiFi
After flashing insert the microSD card into your computer and open the `boot` partition and edit the file `wpa_supplicant.conf`. Then replace

```ini
ssid="YOUR_WIFI_SSID"
psk="YOUR_WIFI_PASSWORD"
```

with your actual WiFi name and password. Remember to keep the quotes for ssid="" and psk="" OR remove the quotes for psk if you use a 64-hex password. Save the changes, eject the card and insert it into your Raspberry Pi. Now boot your device and it will connect to WiFi automatically on first startup.

## TODOs
- [ ] vc4
  ```
  vc4-drm axi:gpu: [drm] Cannot find any crtc or sizes
  
  drm-rpi1-dsi1f00130000.dsi: [drm] fb0: drm-rp1-dsidrmf frame buffer device
  
  drm-rpi1-dsi1f00130000.dsi: rp1dsi_bind succeeded
  ```

- [ ] pr1-pio
  ```
  rp1-pio 1f00178000.pio: failed to contact RP1 firmware
  
  rp1-pio 1f00178000.pio: probe with driver rp1-pio failed with error -2
  ```

## License
All of my code is MIT licensed. Libraries follow their respective licenses.


_Happy hacking and sim racing!_
