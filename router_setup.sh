#!/usr/bin/env bash

apt-get update
apt-get upgrade
apt-get install nftables

# Enable IP Forwarding

echo 1 > /proc/sys/net/ipv4/ip_forward

# Configure Forwarding on 10.10.10.0/24

nft add table nat
nft add chain nat postrouting { type nat hook postrouting priority 100 \;}
nft add rule nat postrouting ip saddr 10.10.10.0/24 counter oif eth1 masquerade

# Configure Forwarding on 10.10.20.0/24

nft add table nat
nft add chain nat postrouting { type nat hook postrouting priority 100 \;}
nft add rule nat postrouting ip saddr 10.10.20.0/24 counter oif eth1 masquerade