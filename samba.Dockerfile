# Copyright (c) 2017 Alexandre Roman <alexandre.roman@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

FROM resin/rpi-raspbian:stretch

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends samba-common-bin samba \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/*

EXPOSE 137/udp 138/udp 139 445

RUN echo '[global]\n\
socket options = TCP_NODELAY IPTOS_LOWDELAY SO_RCVBUF=65536 SO_SNDBUF=65536\n\
#smb ports = 445\n\
max protocol = SMB2\n\
min receivefile size = 16384\n\
deadtime = 30\n\
os level = 20\n\
map to guest = bad user\n\
printer = bsd\n\
printcap name = /dev/null\n\
load printers = no\n\
create mask = 0644\n\
force create mode = 0644\n\
directory mask = 0755\n\
force directory mode = 0755\n\
browsable = yes\n\
writable = yes\n\
guest account = root\n\
force user = root\n\
force group = root\n\
[Public]\n\
path = /data/share\n\
guest ok = yes\n\
read only = no' > /etc/samba/smb.conf

ENTRYPOINT /bin/sh -c "ionice -c 3 nmbd -D && exec ionice -c 3 smbd -FS --configfile=/etc/samba/smb.conf"
