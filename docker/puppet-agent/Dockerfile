FROM xebia/centos7-systemd:latest

COPY ./puppet-agent.sh /opt/
COPY ./puppet-agent.conf /etc/puppet/puppet.conf

RUN chmod +x /opt/puppet-agent.sh

CMD ["/usr/sbin/init"]

