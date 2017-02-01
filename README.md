dnsmasq conf for shadowsocks
===========================
### 配置dnsmasq
以`Centos 7`为例

     yum install -y dnsmasq
     systemctl enable dnsmasq
     wget https://raw.githubusercontent.com/Love4Taylor/dnsmasq-conf-for-shadowsocks/master/dnsmasq-updater.sh -O /root/dnsmasq-updater.sh
     wget https://raw.githubusercontent.com/Love4Taylor/dnsmasq-conf-for-shadowsocks/master/logrotate.d/dnsmasq -O /etc/logrotate.d/dnsmasq
     chmod +x /your_path/dnsmasq-updater.sh
     /your_path/dnsmasq-updater.sh
	 
### 配置自动更新

     crontab -e

`i`并填入

     0 0 * * * /bin/bash /your_path/dnsmasq-updater.sh >/dev/null 2>&1
     
`:x`保存
     
### SS 服务器劫持 DNS （ SS 不能以 root 运行,以下命令的 SS 运行用户为 shadowsocks ）
注意 SS Android 可能需要打开 UDP 转发

     iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner shadowsocks -m multiport --dport 53,5353 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -p udp -m owner --uid-owner shadowsocks -m multiport --dport 53,5353 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.222.222/32 -p tcp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.222.222/32 -p udp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.220.220/32 -p tcp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.220.220/32 -p udp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.222.220/32 -p tcp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.222.220/32 -p udp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.220.222/32 -p tcp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53
     iptables -t nat -A OUTPUT -d 208.67.220.222/32 -p udp -m owner --uid-owner shadowsocks -m multiport --dports 5353,443 -j REDIRECT --to-ports 53