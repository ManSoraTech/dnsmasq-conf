#!/bin/bash
mkdir /var/log/dnsmasq
wget https://raw.githubusercontent.com/ManSoRaTech/dnsmasq-conf-for-shadowsocks/master/dnsmasq.conf -O /etc/dnsmasq.conf
wget https://raw.githubusercontent.com/ManSoRaTech/dnsmasq-conf-for-shadowsocks/master/logrotate.d/dnsmasq -O /etc/logrotate.d/dnsmasq
service dnsmasq restart