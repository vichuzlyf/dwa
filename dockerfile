FROM tomcat:latest
COPY dwa.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]