#!/bin/bash

iptables -F
iptables -X

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request ! -s 192.168.10.0/24 -j DROP

iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -j DROP

netfilter-persistent save

echo "Firewall rules applied successfully."
