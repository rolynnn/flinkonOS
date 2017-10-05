FROM centos

RUN rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
RUN curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo

RUN yum -y install zulu-8 iproute

RUN useradd -d /opt/kafka --uid 1001 -M kafka

RUN cd /opt && \
    curl -o kafka.tgz http://apache.mirrors.spacedump.net/kafka/0.10.1.0/kafka_2.11-0.10.1.0.tgz && \
    tar xf kafka.tgz && \
    mv kafka_2.11-0.10.1.0 kafka && \
    rm kafka.tgz && \
    chown -R kafka:root kafka && \
    chmod -R g+w kafka

ADD entrypoint.sh /opt/kafka
RUN chown -R kafka:root /opt/kafka/entrypoint.sh

WORKDIR /opt/kafka
USER 1001

EXPOSE 9092

ENTRYPOINT [ "./entrypoint.sh" ]