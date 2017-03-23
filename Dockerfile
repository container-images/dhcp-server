FROM asamalik/fake-gen-core-module
MAINTAINER Dominika Hodovska, Red Hat <dhodovsk@redhat.com>
LABEL summary="DHCP (Dynamic Host Configuration Protocol) server container" \
      name="dhcp-server" \
      version="1.0" \
      Release="1" \
      description="dhcp-server provides network configuration for dhcp-clients" \
      vendor="Fedora Project" \
      org.fedoraproject.component="dhcp-server" \
      authoritative-source-url="registry.fedoraproject.org" \
      io.k8s.description="dhcp-server provides network configuration for dhcp-clients" \
      io.k8s.display-name="dhcp-server" \
      io.openshift.tags="dhcp"

ADD files/dhcp-server-module.repo /etc/yum.repos.d/dhcp-server-module.repo
ADD files/dhcpd.sh /dhcpd

RUN dnf -y install dhcp-server && dnf clean all && \
    chmod 755 /dhcpd

VOLUME ['/etc/dhcp', '/etc/dhcp'] ['/var/lib/dhcpd', '/var/lib/dhcpd']

ENTRYPOINT ["/dhcpd"]
CMD ["-d", "--no-pid"]
