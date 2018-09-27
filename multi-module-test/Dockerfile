FROM maven:3.5-jdk-8-slim
EXPOSE 8080

WORKDIR /usr/src/app
COPY pom.xml .
COPY module1/pom.xml ./module1/
COPY module2/pom.xml ./module2/
RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "--fail-never"]
COPY . .
RUN ["run.sh"]

CMD ["java", "-jar", "module2/target/module2-1.0-jar-with-dependencies.jar"]