#!/bin/bash

#http://newznab.readthedocs.io/en/latest/guides/install_ubuntu-14.04/

CONFIGFILE="/etc/php5/apache2/php.ini"
NEWZNAB_DIR="/var/www/newznab/"
HDD_MOUNT="/media/usb/"

sed -i 's/max_execution_time = [^ ]*/max_execution_time = 300/' $CONFIGFILE
sed -i 's/memory_limit = [^ ]*/memory_limit  = 512M/' $CONFIGFILE

sudo service apache2 start


cd /tmp
wget https://raw.github.com/kop1/newznab/master/db/latestregex.sql
mysql -u root -p newznab < latestregex.sql


sudo cp newznab_screen_local.sh /etc/init.d
sudo chmod +x /etc/init.d/newznab_screen_local.sh
sudo update-rc.d myscript defaults 98 02

