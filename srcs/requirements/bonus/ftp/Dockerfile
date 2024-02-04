FROM debian:bullseye

RUN apt-get -y update
RUN apt-get -y install vsftpd

COPY tools/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

COPY conf/vsftpd.conf /etc/vsftpd.conf

EXPOSE 20 21

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD ["/usr/sbin/vsftpd", "/etc/vsftpd.conf"]