FROM bitnami/tomcat:10.1.12

LABEL maintainer="info@pmoscode.de"

ADD released_war_file/axelor.war /bitnami/tomcat/webapps/ROOT.war
RUN mkdir -p /opt/data/attachments && mkdir -p /opt/data/export

VOLUME /opt/data
VOLUME /bitnami/tomcat/webapps

#HEALTHCHECK none

EXPOSE 8080
