FROM tomcat:11.0.0-M24-jre21-temurin
COPY dwa.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]