FROM registry.access.redhat.com/ubi10/ubi-init
RUN dnf -y install openssh-server openssh-clients hostname && dnf clean all && systemctl enable sshd;
RUN chmod 775 /var/run && rm -f /var/run/nologin
RUN sed -i 's/#Port.*$/Port 2222/' /etc/ssh/sshd_config && mkdir /etc/systemd/system/sshd.service.d/ && echo -e '[Service]\nRestart=always' > /etc/systemd/system/sshd.service.d/sshd.conf
RUN echo "We ❤️ RedHat AI" > /etc/motd
EXPOSE 2222
ENTRYPOINT ["/sbin/init"]
CMD ["/sbin/init"]
