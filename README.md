# Docker Media Center with Kodi, Transmission and Samba

This repo has git submodules. To clone everything, use:

```
git clone --recurse-submodules https://github.com/lucaszanella/rpi-docker-media-center
```

If you already cloned and noted they are missing:

```
cd rpi-docker-media-center
git submodule update --init --recursive
```

IMPORTANT: you must add/edit:

```
gpu_mem=160
```
on `/boot/config.txt`

if you have raspberry pi 1 or zero or zero W. Change it for `gpu_mem=256` for newer raspberries like 2 or 3

# Run

```
sudo docker-compose up
```
