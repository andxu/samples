# samples
Sample maven projects for Azure Dev Spaces

In order to run multiple module project in Azure Dev Spaces, you are now required to perform some additional editing after you run the vscode command `Azure Dev Spaces: Prepare configuration files for Azure Dev Spaces`

### Steps for Spring Boot multiple module project 
1. Your project should look like `https://github.com/andxu/samples/tree/andy_azds/spring-boot-test` (`andy_azds` branch contains the original template files generated by azds)
2. Open your project in vscode, and run the vscode command `Azure Dev Spaces: Prepare configuration files for Azure Dev Spaces`
3. Open the `Dockerfile`, you would see the `COPY pom.xml .` in line 7, see: https://github.com/andxu/samples/blob/andy_azds/spring-boot-test/Dockerfile#L7,
    add `COPY` lines below for all the modules:
    ```
    COPY application/pom.xml ./application/	
    COPY library/pom.xml ./library/
    ``` 
4. At line 13, update the `--from=build /usr/src/app/target` to the spring boot application project like `--from=build /usr/src/app/application/target/gs-multi-module-application-0.0.1-SNAPSHOT.jar`
5. At line 14, update the wrong jar file `gs-multi-module-0.0.1-SNAPSHOT.jar` to the correct jar like `gs-multi-module-application-0.0.1-SNAPSHOT.jar`

6. Open the `Dockerfile.develop`, you would see the `COPY pom.xml .` in line 5, see: https://github.com/andxu/samples/blob/andy_azds/spring-boot-test/Dockerfile.develop#L5,
    add `COPY` lines below for all the modules like:
    ```
    COPY application/pom.xml ./application/	
    COPY library/pom.xml ./library/
    ``` 
    
7. At last line, update the wrong jar path `"target/gs-multi-module-0.0.1-SNAPSHOT.jar"` to the correct jar path like `"application/target/gs-multi-module-application-0.0.1-SNAPSHOT.jar"`


### Steps for building jar with dependencies 
1. Your project should look like `https://github.com/andxu/samples/blob/andy_azds/multi-module-test` (`andy_azds` branch contains the original template files generated by azds)
2. Open your project in vscode, and run the vscode command `Azure Dev Spaces: Prepare configuration files for Azure Dev Spaces`
3. Open the `Dockerfile`, you would see the `COPY pom.xml .` in line 7, see: https://github.com/andxu/samples/blob/andy_azds/multi-module-test/Dockerfile#L7,
    add `COPY` lines below for all the modules:
    ```
    COPY module1/pom.xml ./module1/	
    COPY module2/pom.xml ./module2/
    ```
4. Create a `run.sh` as the build script similar to https://github.com/andxu/samples/blob/andy_azds/multi-module-test/run.sh, you need to `mvn install` first orelse the `mvn assembly:single` will fail.  
5. At line 10, update the build command `"mvn", "package"` to `./run.sh` 
4. At line 13, update the `--from=build /usr/src/app/target` to the entry project like `--from=build /usr/src/app/module2/target/module2-1.0-jar-with-dependencies.jar`
5. At line 14, update the wrong jar file `multi-module-test-1.0.jar` to the correct jar like `module2-1.0-jar-with-dependencies.jar`

6. Open the `Dockerfile.develop`, you would see the `COPY pom.xml .` in line 5, see: https://github.com/andxu/samples/blob/andy_azds/multi-module-test/Dockerfile.develop#L5,
    add `COPY` lines below for all the modules like:
    ```
    COPY module1/pom.xml ./module1/	
    COPY module2/pom.xml ./module2/
    ``` 
    
5. At line 8, update the build command `"mvn", "package"` to `./run.sh`
7. At last line, update the wrong jar path `"target/multi-module-test-1.0.jar"` to the correct jar path like `"module2/target/module2-1.0-jar-with-dependencies.jar"`
7. Open the `azds.yaml` and update the line 31 from ` - [mvn, package] ` to ` - [./run.sh] `
