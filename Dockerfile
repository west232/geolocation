FROM openjdk:8
#ADD target/spring-boot-maven-plugin.jar spring-boot-maven-plugin.jar .
ADD  target/bioMedical-0.0.1-SNAPSHOT.jar spring-boot-maven-plugin.jar .
EXPOSE 8081
ENTRYPOINT ["-java","-jar","spring-boot-maven-plugin.jar"]
COPY . .
