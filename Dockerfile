FROM openjdk:8
ADD target/spring-boot-maven-plugin.jar app.jar
EXPOSE 8081
ENTRYPOINT ["-java", "-jar", "app.jar"]
