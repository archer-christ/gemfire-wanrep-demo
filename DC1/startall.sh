#!/bin/bash

LOCATOR_PORT=10334
SERVER2_PORT=40405

gfsh <<!

start locator --name=locator1 --properties-file=config/locator.properties --J=-Xms256m --J=-Xmx256m --classpath=$GEMFIRE/locator-dependencies.jar

start server --name=server1 --locators=localhost[$LOCATOR_PORT] --J=-Xms512m --J=-Xmx512m --cache-xml-file=config/cache.xml --properties-file=config/gemfire.properties --J=-Dgemfire.start-dev-rest-api=true --J=-Dgemfire.http-service-bind-address=$IP --J=-Dgemfire.http-service-port=7076 --J=-Dgemfire.ALLOW_PERSISTENT_TRANSACTIONS=true

#start server --name=server2 --locators=localhost[$LOCATOR_PORT] --J=-Xms512m --J=-Xmx512m --cache-xml-file=config/cache.xml --properties-file=config/gemfire.properties --server-port=$SERVER2_PORT --J=-Dgemfire.ALLOW_PERSISTENT_TRANSACTIONS=true

list members;

list regions;

exit;
!
