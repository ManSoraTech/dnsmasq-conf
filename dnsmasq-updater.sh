#!/bin/bash
mkdir /var/log/dnsmasq
mkdir /etc/dnsmasq.d
wget https://raw.githubusercontent.com/ManSoRaTech/dnsmasq-conf-for-shadowsocks/master/dnsmasq.conf -O /etc/dnsmasq.conf
wget https://raw.githubusercontent.com/ManSoRaTech/dnsmasq-conf-for-shadowsocks/master/logrotate.d/dnsmasq -O /etc/logrotate.d/dnsmasq
wget https://raw.githubusercontent.com/ManSoRaTech/dnsmasq-conf-for-shadowsocks/master/adhosts -O /etc/dnsmasq.d/adhosts
wget https://raw.githubusercontent.com/notracking/hosts-blocklists/master/hostnames.txt -O /etc/dnsmasq.d/hostnames.txt
wget https://raw.githubusercontent.com/notracking/hosts-blocklists/master/domains.txt -O /etc/dnsmasq.d/domains.txt
service dnsmasq restart
