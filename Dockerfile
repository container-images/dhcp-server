FROM asamalik/fake-gen-core-module
MAINTAINER Dominika Hodovska, Red Hat <dhodovsk@redhat.com>
LABEL name="DHCP server container" \
      vendor="Fedora Project" \
      Release="1" \
      version="1.0"

ADD files/dhcp-server-module.repo /etc/yum.repos.d/dhcp-server-module.repo
ADD dhcpd.sh /dhcpd

RUN dnf -y install dhcp-server && dnf clean all && \
    chmod 755 /dhcpd

VOLUME ['/etc/dhcp', '/etc/dhcp']
VOLUME ['/var/lib/dhcpd', '/var/lib/dhcpd']

ENTRYPOINT ["/dhcpd"]
CMD ["-d", "--no-pid"]
