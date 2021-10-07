scp ..\target\spring-boot-tutorial-aj3-0.0.1-SNAPSHOT.jar root@23.88.101.229:/var/lib/spring-boot-tutorial-aj3.jar
ssh root@23.88.101.229 systemctl restart spring-boot-tutorial-aj3.service
pause