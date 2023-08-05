FROM tomcat:9.0-jdk17-temurin-focal

LABEL maintainer="info@pmoscode.de"

RUN useradd -s /usr/sbin/nologin -m axelor
RUN chown -R axelor:axelor /usr/local/tomcat

USER axelor

ADD released_war_file/axelor.war /usr/local/tomcat/webapps/ROOT.war

VOLUME /axelor/.axelor/attachments
VOLUME /usr/local/tomcat/webapps

HEALTHCHECK none

EXPOSE 8080

CMD ["catalina.sh", "run"]
