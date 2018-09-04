FROM openjdk:8-jre-slim AS base
EXPOSE 8080
WORKDIR /app

FROM maven:3.5-jdk-8-slim AS build
WORKDIR /usr/src/app
COPY pom.xml .
COPY application/pom.xml ./application/
COPY library/pom.xml ./library/
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "--fail-never"]
COPY . .
RUN ["mvn", "package"]

FROM base AS final
COPY --from=build /usr/src/app/application/target/gs-multi-module-application-0.0.1-SNAPSHOT.jar .
CMD ["java", "-jar", "gs-multi-module-application-0.0.1-SNAPSHOT.jar"]