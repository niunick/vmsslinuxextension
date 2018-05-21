#!/bin/bash

# install Apache and PHP (in a loop because a lot of installs happen
# on VM init, so won't be able to grab the dpkg lock immediately)
sudo su -
apt-get -y update
apt-get -y update
apt-get -y install apache2 php
apt-get -y install apache2 php

cp index.php /var/www/html/
cp do_work.php /var/www/html/
rm /var/www/html/index.html
# restart Apache
apachectl restart
