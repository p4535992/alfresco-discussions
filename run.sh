#!/bin/bash

#MAVEN_OPTS="-Xms256m -Xmx2G" mvn clean install -DskipTests=true alfresco:run
MAVEN_OPTS="-Xms256m -Xmx2G" mvn install -DskipTests=true alfresco:run
