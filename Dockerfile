FROM haproxy:2.3
ARG IP_ADDR
COPY ./haproxy.cfg /tmp/haproxy.cfg
RUN sed -i "s/\$IP_ADDR/$IP_ADDR/g" /tmp/haproxy.cfg
RUN mv /tmp/haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
RUN mkdir /run/haproxy
RUN haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg


