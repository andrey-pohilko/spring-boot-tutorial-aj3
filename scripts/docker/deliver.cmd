ssh root@49.12.229.158 "mkdir -p /var/lib/spring-boot-tutorial-aj3"

@rem copy dockerfile and jar to remote machine
scp ..\..\target\spring-boot-tutorial-aj3-0.0.1-SNAPSHOT.jar ^
    root@49.12.229.158:/var/lib/spring-boot-tutorial-aj3/spring-boot-tutorial-aj3.jar

scp Dockerfile root@49.12.229.158:/var/lib/spring-boot-tutorial-aj3/


ssh root@49.12.229.158 "docker kill spring-boot-tutorial-aj3"

@rem build docker with tag
ssh root@49.12.229.158 ^
        cd /var/lib/spring-boot-tutorial-aj3 && ^
        docker build -t spring-boot-tutorial-aj3-image .

@rem -t - assign tag spring-boot-tutorial-aj3-image to the built image


@rem run docker with port 9000 assigned to port 9000 and in background
ssh root@49.12.229.158 ^
        docker run --restart unless-stopped -d -p 9000:9000 ^
                   --name spring-boot-tutorial-aj3 spring-boot-tutorial-aj3-image

@rem --restart unless-stopped - restart always unless its stopped manually by a command
@rem -d run in background
@rem -p 9000:9000 - assign port 9000 to host 9000
@rem --name spring-boot-tutorial-aj3 - assign name to container
@rem --rm remove when container is stopped (only if --restart is disabled)