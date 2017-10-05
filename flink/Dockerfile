FROM centos

ENV FLINK_VERSION=1.3.0

RUN rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
RUN curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo
RUN yum -y install epel-release

RUN yum -y install zulu-8 nss_wrapper gettext

RUN useradd -d /opt/flink --uid 1001 -M flink

RUN cd /opt && \
	curl -o flink.tgz http://mirror.hosting90.cz/apache/flink/flink-$FLINK_VERSION/flink-$FLINK_VERSION-bin-hadoop27-scala_2.11.tgz && \
	tar xf flink.tgz && \
	mv flink-$FLINK_VERSION flink && \
	chown -R flink:root flink && \
	chmod -R g+w flink && \
	rm flink.tgz

ADD entrypoint.sh /opt/flink
ADD passwd.template /opt/flink
RUN chown -R flink:root /opt/flink/entrypoint.sh /opt/flink/passwd.template

WORKDIR /opt/flink
USER 1001

EXPOSE 6123 6122 6121 8081 50101

ENTRYPOINT [ "./entrypoint.sh" ]
