FROM centos

ENV SPARK_VERSION=2.1.0

RUN rpm --import http://repos.azulsystems.com/RPM-GPG-KEY-azulsystems
RUN curl -o /etc/yum.repos.d/zulu.repo http://repos.azulsystems.com/rhel/zulu.repo

RUN yum -y install zulu-8 epel-release

RUN yum -y install nss_wrapper gettext

RUN useradd -d /opt/spark --uid 1001 -M spark

RUN cd /opt && \
    curl -o spark.tgz http://d3kbcqa49mib13.cloudfront.net/spark-$SPARK_VERSION-bin-hadoop2.7.tgz && \
    tar xf spark.tgz && \
    mv spark-$SPARK_VERSION-bin-hadoop2.7 spark && \
    rm spark.tgz && \
    chown -R spark:root spark && \
    chmod -R g+w spark

ADD entrypoint.sh /opt/spark
ADD passwd.template /opt/spark
RUN chown -R spark:root /opt/spark/entrypoint.sh /opt/spark/passwd.template

WORKDIR /opt/spark
USER 1001

EXPOSE  8080
EXPOSE  7077

ENTRYPOINT [ "./entrypoint.sh" ]
