FROM openjdk:8-jre

RUN mkdir -p /bin/flink132/

COPY flink132/flink-1.3.2-bin-hadoop27-scala_2.11.tgz /bin/flink132/

RUN apt-get update

WORKDIR /bin/flink132/

RUN tar -xf flink-1.3.2-bin-hadoop27-scala_2.11.tgz && \
    rm -f flink-1.3.2-bin-hadoop27-scala_2.11.tgz

EXPOSE 6123 8081
CMD ["/bin/bash","flink-1.3.2/bin/start-local.sh"]