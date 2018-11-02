#! /bin/sh

cd /CouchPotatoServer
touch /config/CouchPotato.cfg

/usr/bin/python /CouchPotatoServer/CouchPotato.py --data_dir /config/ --config_file /config/CouchPotato.cfg --console_log

