#!/bin/sh
mkdir -p /tmp/dnsmasq.ssr
awk '!/^$/&&!/^#/{printf("ipset=/.%s/'"blacklist"'\n",$0)}' /etc/config/black.list > /tmp/dnsmasq.ssr/blacklist_forward.conf
awk '!/^$/&&!/^#/{printf("server=/.%s/'"192.168.1.2#53"'\n",$0)}' /etc/config/black.list >> /tmp/dnsmasq.ssr/blacklist_forward.conf
awk '!/^$/&&!/^#/{printf("ipset=/.%s/'"whitelist"'\n",$0)}' /etc/config/white.list > /tmp/dnsmasq.ssr/whitelist_forward.conf
