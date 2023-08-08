#!/usr/bin/env bash

set -e

echo "Copy war-file to target"
cp /home/axelor/ROOT.war /usr/local/tomcat/webapps/ROOT.war

echo "Start tomcat"
catalina.sh run
