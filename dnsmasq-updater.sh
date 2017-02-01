#!/bin/bash
mkdir /var/log/dnsmasq
wget https://raw.githubusercontent.com/Love4Taylor/dnsmasq-conf-for-shadowsocks/master/dnsmasq-updater.sh -O /etc/dnsmasq.conf
wget https://raw.githubusercontent.com/Love4Taylor/dnsmasq-conf-for-shadowsocks/master/logrotate.d/dnsmasq -O /etc/logrotate.d/dnsmasq
service dnsmasq restart