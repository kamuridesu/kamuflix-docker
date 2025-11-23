FROM haproxy:3.2.3

USER root

RUN apt-get update && \
    apt-get install -y libcap2-bin && \
    apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

RUN setcap 'cap_net_bind_service=+ep' /usr/local/sbin/haproxy

COPY ./haproxy.cfg /tmp/haproxy.cfg
ARG IP_ADDR
RUN sed -i "s/\$IP_ADDR/$IP_ADDR/g" /tmp/haproxy.cfg
RUN mv /tmp/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
RUN mkdir /run/haproxy
RUN chown -R haproxy:haproxy /run/haproxy
RUN haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg

USER haproxy
CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
