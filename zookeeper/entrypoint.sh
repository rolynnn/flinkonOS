#!/bin/bash

echo "" > conf/zoo.cfg

echo "tickTime=2000" >> conf/zoo.cfg
echo "dataDir=/opt/zookeeper/data" >> conf/zoo.cfg
echo "clientPort=2181" >> conf/zoo.cfg

./bin/zkServer.sh start-foreground