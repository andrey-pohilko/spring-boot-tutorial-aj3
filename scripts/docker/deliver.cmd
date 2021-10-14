ssh root@49.12.229.158 "mkdir -p /var/lib/spring-boot-tutorial-aj3"

rem copy dockerfile and jar to remote machine
scp ..\..\target\spring-boot-tutorial-aj3-0.0.1-SNAPSHOT.jar root@49.12.229.158:/var/lib/spring-boot-tutorial-aj3/spring-boot-tutorial-aj3.jar
scp Dockerfile root@49.12.229.158:/var/lib/spring-boot-tutorial-aj3/


ssh root@49.12.229.158 "docker kill spring-boot-tutorial-aj3"

rem build docker with tag
ssh root@49.12.229.158 "cd /var/lib/spring-boot-tutorial-aj3 && docker build -t spring-boot-tutorial-aj3-image ."


rem run docker with port 9000 assigned to port 9000 and in background
ssh root@49.12.229.158 "docker run -d -p 9000:9000 -rm -n spring-boot-tutorial-aj3 spring-boot-tutorial-aj3-image"
