FROM openjdk:8-jre-slim AS base
EXPOSE 8080
WORKDIR /app

FROM maven:3.5-jdk-8-slim AS build
WORKDIR /usr/src/app
COPY pom.xml .
COPY module1/pom.xml ./module1/
COPY module2/pom.xml ./module2/
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "--fail-never"]
COPY . .
RUN ["./run.sh"]

FROM base AS final
COPY --from=build /usr/src/app/module2/target/module2-1.0-jar-with-dependencies.jar .
CMD ["java", "-jar", "module2-1.0-jar-with-dependencies.jar"]