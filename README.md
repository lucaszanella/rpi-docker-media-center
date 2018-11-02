# Docker Media Center with Kodi, Transmission and Samba



# Running

```
git clone https://github.com/lucaszanella/rpi-docker-media-center
#edit docker-compose.yml and comment out things you don't need (like kodi)
sudo docker-compose up
```


IMPORTANT:if you going to activate kodi in your pi, you must add/edit:

```
gpu_mem=160
```
on `/boot/config.txt`

if you have raspberry pi 1 or zero or zero W. Change it for `gpu_mem=256` for newer raspberries like 2 or 3


