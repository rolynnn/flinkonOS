FROM centos

ENV ZEPPELIN_VERSION=0.7.0

RUN rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
RUN curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo

RUN yum -y install zulu-8

RUN useradd -d /opt/zeppelin --uid 1001 -M zeppelin

RUN cd /opt && \
    curl -o zeppelin.tgz http://mirror.hosting90.cz/apache/zeppelin/zeppelin-$ZEPPELIN_VERSION/zeppelin-$ZEPPELIN_VERSION-bin-netinst.tgz && \
    tar xf zeppelin.tgz && \
    mv zeppelin-$ZEPPELIN_VERSION-bin-netinst zeppelin && \
    rm zeppelin.tgz && \
    cd zeppelin && ./bin/install-interpreter.sh --name md,shell,jdbc,flink && cd .. && \
    chown -R zeppelin:root zeppelin && \
    chmod -R g+w zeppelin

ADD entrypoint.sh /opt/zeppelin
RUN chown -R zeppelin:root /opt/zeppelin/entrypoint.sh

WORKDIR /opt/zeppelin
USER 1001

EXPOSE  8080

ENTRYPOINT [ "./entrypoint.sh" ]
