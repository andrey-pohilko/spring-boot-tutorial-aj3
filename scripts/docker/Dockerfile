FROM openjdk:16



COPY . /var/lib/spring-boot-tutorial-aj3

ENV SERVER_PORT=9000
EXPOSE $SERVER_PORT



ENTRYPOINT ["java","-jar","-Dserver.port=9000","/var/lib/spring-boot-tutorial-aj3/spring-boot-tutorial-aj3.jar"]

