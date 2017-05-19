#!/bin/bash

# assign different ports than those of data center 2
LOCATOR_PORT=10335
SERVER1_PORT=40406
SERVER2_PORT=40407


#
#  Note that the two servers here point to the locator on port 10335 and not 10334
#

gfsh <<!

start locator --name=locator2 --properties-file=config/locator.properties --port=$LOCATOR_PORT --J=-Dgemfire.http-service-port=7071 --J=-Xms256m --J=-Xmx256m --classpath=$GEMFIRE/locator-dependencies.jar

start server --name=server3 --locators=localhost[$LOCATOR_PORT] --J=-Xms512m --J=-Xmx512m --cache-xml-file=config/cache.xml --J=-Dgemfire.start-dev-rest-api=true --J=-Dgemfire.http-service-bind-address=$IP --J=-Dgemfire.http-service-port=7076 --properties-file=config/gemfire.properties --server-port=$SERVER1_PORT --J=-Dgemfire.ALLOW_PERSISTENT_TRANSACTIONS=true

#start server --name=server4 --locators=localhost[$LOCATOR_PORT] --J=-Xms512m --J=-Xmx512m --cache-xml-file=config/cache.xml --properties-file=config/gemfire.properties --server-port=$SERVER2_PORT --J=-Dgemfire.ALLOW_PERSISTENT_TRANSACTIONS=true

list members;

list regions;

exit;
!
