#!/bin/sh

if [ ! -f /etc/dhcp/dhcpd.conf ]; then
	echo "Not configured to listen on any interfaces!"
	echo "see https://github.com/container-images/dhcp-server for reference"
	exit 1
fi

if [ ! -f /var/lib/dhcpd/dhcpd.leases ]; then
    touch /var/lib/dhcpd/dhcpd.leases
fi

exec /usr/sbin/dhcpd $@
