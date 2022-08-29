#!/bin/bash


rm -rf /etc/cron.d
rm -rf /etc/cron.hourly
rm -rf /etc/cron.daily
rm -rf /etc/cron.weekly
rm -rf /etc/cron.monthly

ln -s /opt/stateful/cron.d /etc/cron.d
ln -s /opt/stateful/cron.hourly /etc/cron.hourly
ln -s /opt/stateful/cron.daily /etc/cron.daily
ln -s /opt/stateful/cron.weekly /etc/cron.weekly
ln -s /opt/stateful/cron.monthly /etc/cron.monthly

## rsyslog
sed -i '/imklog/s/^/#/' /etc/rsyslog.conf
rm /etc/rsyslog.d/50-default.conf

## cron
ln -sf /dev/stdout /var/log/cron.log
chmod -R 755 /opt/stateful/cron.d/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.hourly/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.daily/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.weekly/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.monthly/* > /dev/null 2>&1
touch /etc/default/locale

# start rsyslog and cron
/etc/init.d/rsyslog start
/usr/sbin/cron -f
