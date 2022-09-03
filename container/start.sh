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
rm /etc/rsyslog.d/50-default.conf > /dev/null 2>&1

## dirs
ln -sf /dev/stdout /var/log/cron.log
if [ ! -d /opt/stateful/cron.d ]; then
	mkdir -p /opt/stateful/cron.d
fi
if [ ! -d /opt/stateful/cron.hourly ]; then
        mkdir -p /opt/stateful/cron.hourly
fi
if [ ! -d /opt/stateful/cron.daily ]; then
        mkdir -p /opt/stateful/cron.daily
fi
if [ ! -d /opt/stateful/cron.weekly ]; then
        mkdir -p /opt/stateful/cron.weekly
fi
if [ ! -d /opt/stateful/cron.monthly ]; then
        mkdir -p /opt/stateful/cron.monthly
fi
if [ ! -d /opt/stateful/scripts ]; then
        mkdir -p /opt/stateful/scripts
fi
if [ ! -d /opt/stateful/ssh ]; then
        mkdir -p /opt/stateful/ssh
fi

## perms
chmod -R 755 /opt/stateful/cron.d/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.hourly/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.daily/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.weekly/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/cron.monthly/* > /dev/null 2>&1
chmod -R 755 /opt/stateful/scripts/* > /dev/null 2>&1
chmod -R 700 /opt/stateful/ssh > /dev/null 2>&1
touch /etc/default/locale

## ssh
ln -sf /opt/stateful/ssh /root/.ssh

# yep
chmod o+w /dev/stdout

# start rsyslog and cron
/etc/init.d/rsyslog start
/usr/sbin/cron -f
