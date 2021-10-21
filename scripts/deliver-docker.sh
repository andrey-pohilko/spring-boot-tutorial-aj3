#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java application'
echo 'into the local Maven repository, which will ultimately be stored in'
echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
echo 'volume).'
set -x
/opt/apache-maven-3.8.2/bin/mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following complex command extracts the value of the <name/> element'
echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`/opt/apache-maven-3.8.2/bin/mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'The following complex command behaves similarly to the previous one but'
echo 'extracts the value of the <version/> element within <project/> instead.'
set -x
VERSION=`/opt/apache-maven-3.8.2/bin/mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

echo 'The following command runs and outputs the execution of your Java'
echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
cp target/${NAME}-${VERSION}.jar /var/lib/spring-boot-tutorial-aj3

cd /var/lib/spring-boot-tutorial-aj3
docker build -t anoxis/spring-boot-tutorial-aj3-image .

docker run --restart unless-stopped -d -p 9000:9000 --env-file esdp-demo-env.txt ^
    --name spring-boot-tutorial-aj3 anoxis/spring-boot-tutorial-aj3-image