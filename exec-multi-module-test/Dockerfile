FROM openjdk:8-jre-slim AS base
EXPOSE 8080
WORKDIR /app

FROM maven:3.5-jdk-8-slim AS build
WORKDIR /usr/src/app
COPY pom.xml .
COPY exec-module1/pom.xml ./exec-module1/
COPY exec-module2/pom.xml ./exec-module2/
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "--fail-never"]
COPY . .
RUN ["mvn", "package"]

FROM base AS final
COPY --from=build /usr/src/app/exec-module2/target/exec-multi-module-module2-1.0.one-jar.jar .
CMD ["java", "-jar", "exec-multi-module-module2-1.0.one-jar.jar"]