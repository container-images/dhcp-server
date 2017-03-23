# DHCP Server Container

## Description

## Running in docker

Clone this repository somewhere and build the container:

    # docker build --rm -t <username>/dhcpd .


Configure dhcp-server in ``/etc/dhcp/dhcpd.conf`` ([dhcp-server configuration](https://docs.fedoraproject.org/en-US/Fedora/14/html/Deployment_Guide/s1-dhcp-configuring-server.html)) 
and run dhcpd container as root.

    # docker run --net=host -v /etc/dhcp/:/etc/dhcp -v /var/lib/dhcpd:/var/lib/dhcpd --name dhcp <username>/dhcpd
    
## Functionality check

If you want to test the functionality, you can do it using dummy interface:

    # modprobe dummy
    # ip address add 1.2.3.4/24 dev dummy0
    # ip link set dev dummy0 up
    
Add configuration for dummy interface to dhcpd-conf:

    subnet 1.2.3.0 netmask 255.255.255.0 {
      range 1.2.3.20 1.2.3.30;
    }
    
Use either pre-installed dhcp-client on your host:

        # /usr/sbin/dhclient -d dummy0
        
Or use [dhcp-client container](https://github.com/container-images/dhcp-client).