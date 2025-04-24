FROM openjdk:8-jdk-alpine

RUN mkdir -p /opt/build 
ADD ./ /opt/build
WORKDIR /opt/build

RUN ./gradlew bootJar --no-daemon \
    && cp build/libs/*jar app.jar

VOLUME /tmp
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","./app.jar"]