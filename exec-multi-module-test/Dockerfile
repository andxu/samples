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
RUN ["mvn","package","-Dmaven.test.skip=true","-Dcheckstyle.skip=true","-Dmaven.javadoc.skip=true","-Dmaven.rpm.skip=true"]
RUN ["mkdir","-p","publish"]
RUN ["cp","./exec-module2/target/exec-multi-module-module2-1.0.jar","publish/"]
RUN ["cp","./exec-module1/target/exec-multi-module-module1-1.0.jar","publish/"]
RUN ["cp","/root/.m2/repository/org/apache/commons/commons-lang3/3.6/commons-lang3-3.6.jar","publish/"]
RUN ["cp","/root/.m2/repository/commons-io/commons-io/2.6/commons-io-2.6.jar","publish/"]

FROM base AS final
COPY --from=build /usr/src/app/publish .
# RUN ["/bin/sh","-c", "apt-get update && apt-get install procps -y"]
CMD ["java","-cp","*","Main"]