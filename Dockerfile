# Maven build container 

FROM maven:3.6.3-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

#pull base image

FROM openjdk

#maintainer 
MAINTAINER muhyasin89@gmail.com

#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /data/spring_basic.jar

#copy hello world to docker image from builder image

COPY --from=maven_build /tmp/target/spring_basic0.1.0.jar /data/spring_basic0.1.0.jar
