FROM registry.fedoraproject.org/fedora:26

# dhcp-server image

LABEL MAINTAINER Dominika Hodovska, Red Hat <dhodovsk@redhat.com>

LABEL summary="DHCP (Dynamic Host Configuration Protocol) server container" \
      name="dhcp-server" \
      version="1.0" \
      Release="1" \
      architecture="$ARCH" \
      com.redhat.component=$NAME \
      usage="# docker run --net=host -v /etc/dhcp/:/etc/dhcp -v /var/lib/dhcpd:/var/lib/dhcpd --name dhcp f26/dhcp-server" \
      help="Runs dhcp server which reads network configuration from host." \
      description="dhcp-server provides network configuration for dhcp-clients" \
      vendor="Fedora Project" \
      org.fedoraproject.component="dhcp-server" \
      authoritative-source-url="registry.fedoraproject.org" \
      io.k8s.description="dhcp-server provides network configuration for dhcp-clients" \
      io.k8s.display-name="dhcp-server" \
      io.openshift.tags="dhcp"

ADD repos/dhcp-server-module.repo /etc/yum.repos.d/
ADD files/dhcpd.sh /dhcpd

RUN dnf install dhcp-server -y && dnf clean all && \
    chmod 755 /dhcpd

VOLUME ['/etc/dhcp', '/etc/dhcp'] ['/var/lib/dhcpd', '/var/lib/dhcpd']

CMD ["/dhcpd", "-d", "--no-pid"]
