# Maven build container 

FROM maven:3.6.3-openjdk-11 AS maven_build

COPY pom.xml /tmp/

COPY src /tmp/src/

WORKDIR /tmp/

RUN mvn package

#pull base image

FROM openjdk

ADD target/users-mysql.jar users-mysql.jar

EXPOSE 8086

ENTRYPOINT ["java", "-jar", "users-mysql.jar"]

#maintainer 
MAINTAINER muhyasin89@gmail.com

#expose port 8080
EXPOSE 8080

#default command
CMD java -jar /data/spring-basic-0.1.0.jar 

#copy spring basic to docker image from builder image

COPY --from=maven_build /tmp/target/spring-basic-0.1.0.jar /data/spring-basic-0.1.0.jar
