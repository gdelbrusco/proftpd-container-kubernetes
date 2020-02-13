FROM ubuntu:bionic
RUN     	apt update && \
            apt upgrade -y && \
            apt install proftpd-basic -y && \
            apt clean autoclen && \
            apt autoremove --yes && \
            rm -rf /var/lib/{apt,dpkg,cache,log}/

RUN sed -i -e '/UseIPv6/ s/on/off/' /etc/proftpd/proftpd.conf

EXPOSE 21

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["proftpd", "-n"]