FROM centos

RUN rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
RUN curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo

RUN yum -y install zulu-8

RUN useradd -d /opt/zookeeper --uid 1001 -M zookeeper

RUN cd /opt && \
    curl -o zookeeper.tgz http://apache.mirrors.spacedump.net/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz && \
    tar xf zookeeper.tgz && \
    mv zookeeper-3.4.9 zookeeper && \
    rm zookeeper.tgz && \
    chown -R zookeeper:root zookeeper && \
    chmod -R g+w zookeeper

ADD entrypoint.sh /opt/zookeeper
RUN chown -R zookeeper:root /opt/zookeeper/entrypoint.sh

WORKDIR /opt/zookeeper
USER 1001

EXPOSE  2181

ENTRYPOINT [ "./entrypoint.sh" ]