# Docker Media Center with Kodi, Transmission and Samba

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
