FROM haproxy:alpine
MAINTAINER Philippe VINCENT-ROYOL <vincent.royol@gmail.com>

#ENV DNS_TCP_ADDR 127.0.0.11
#ENV DNS_TCP_PORT 53
ENV CONSUL_TEMPLATE_VERSION=0.19.4
RUN apk --update add haproxy wget bash
#COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
#COPY haproxy.cfg /etc/haproxy/haproxy.cfg

RUN wget --help
# Download consul-template
RUN ( wget --no-check-certificate https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.tgz -O /tmp/consul_template.tgz && cd /tmp && tar xvfz /tmp/consul_template.tgz && mv consul-template /usr/bin && rm -rf /tmp/* )

COPY haproxy.json /tmp/haproxy.json
COPY haproxy.ctmpl /tmp/haproxy.ctmpl
ADD haproxy.sh /haproxy.sh
ADD launch.sh /launch.sh

#EXPOSE 80
EXPOSE 9000
EXPOSE 6379

CMD ["/launch.sh"]
