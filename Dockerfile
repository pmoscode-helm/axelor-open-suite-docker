FROM tomcat:9.0-jdk17-temurin-focal

LABEL maintainer="info@pmoscode.de"

RUN groupadd -g 10101 axelor
RUN useradd -s /usr/sbin/nologin -u 10101 -g 10101 -m axelor
RUN chown -R axelor:axelor /usr/local/tomcat

ADD released_war_file/axelor.war /home/axelor/ROOT.war
ADD start.sh /home/axelor/start.sh
RUN chown axelor:axelor /home/axelor/start.sh && \
    chmod +x /home/axelor/start.sh

USER axelor

VOLUME /home/axelor/.axelor/attachments
VOLUME /usr/local/tomcat/webapps

HEALTHCHECK none

EXPOSE 8080

CMD ["/home/axelor/start.sh"]
