FROM bitnami/tomcat:10.1.11

LABEL maintainer="info@pmoscode.de"

ADD released_war_file/axelor.war /bitnami/tomcat/webapps/ROOT.war
RUN mkdir -p /opt/data/attachments && mkdir -p /opt/data/export

VOLUME /opt/data
VOLUME /bitnami/tomcat/webapps

EXPOSE 8080
