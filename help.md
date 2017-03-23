% DHCP-SERVER(1) Container Image Pages
% Dominika Hodovska
% March 23, 2017

# NAME
dhcp-server - ISC DHCP server

# DESCRIPTION

DHCP (Dynamic Host Configuration Protocol) is a protocol which allows
individual devices on an IP network to get their own network
configuration information (IP address, subnetmask, broadcast address,
etc.) from a DHCP server. The overall purpose of DHCP is to make it
easier to administer a large network.

# USAGE

To get the dhcp-server container image on your local system, run the following:

    docker pull docker.io/dhodovsk/dhcp-server

# SECURITY IMPLICATIONS

Container has to have access to host network (--net=host option while docker run).
Reason for this is need to share one UDP port with other services and raw socket issue (more info [here](https://kb.isc.org/article/AA-00378/0/Why-does-DHCP-use-raw-sockets.html))


    -v /etc/dhcp:/etc/dhcp
Location of DHCP configuration file (/etc/dhcp/dhcpd.conf). This file
contains network information for clients and needs to exist before container run.
    
    -v /var/lib/dhcpd:/var/lib/dhcpd
Client leases database for clients.

# SEE ALSO

[DHCP server configuration](https://docs.fedoraproject.org/en-US/Fedora/14/html/Deployment_Guide/s1-dhcp-configuring-server.html)