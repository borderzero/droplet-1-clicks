#!/bin/bash

# this is required bot 999-img_check.sh to pass
apt-get -y purge droplet-agent
apt-get -y purge do-agent
rm -fr /opt/digitalocean

# clear out MOTD
rm -frv /etc/update-motd.d/10-help-text
rm -frv /etc/update-motd.d/50-motd-news
rm -frv /etc/update-motd.d/50-landscape-sysinfo
rm -frv /etc/update-motd.d/90-updates-available

# clean up log files
rm -frv /var/log/ubuntu-advantage.log
ln -s /dev/null /var/log/ubuntu-advantage.log
rm -frv /var/log/kern.log
rm -frv /var/log/auth.log

## end of 011-border0-clean.sh

