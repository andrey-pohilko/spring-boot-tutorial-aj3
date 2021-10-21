scp ..\target\spring-boot-tutorial-aj3-0.0.1-SNAPSHOT.jar root@49.12.229.158:/var/lib/spring-boot-tutorial-aj3.jar
ssh root@49.12.229.158 systemctl restart spring-boot-tutorial-aj3.service
pause