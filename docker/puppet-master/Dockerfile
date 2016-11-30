FROM xebia/centos7-systemd:latest

EXPOSE 8140

VOLUME ["/etc/puppet"]

COPY ./puppet-master.sh /opt/
COPY ./puppet-master.conf /etc/puppet/puppet.conf
COPY ./puppet.service /etc/systemd/system/

RUN chmod +x /opt/puppet-master.sh
RUN chmod +x /etc/systemd/system/puppet.service
RUN ln -s /etc/systemd/system/puppet.service /etc/systemd/system/multi-user.target.wants/puppet.service

CMD ["/usr/sbin/init"]

