#!/usr/bin/env bash

# StackOverflow question: http://stackoverflow.com/questions/11091311/maven-execjava-goal-on-a-multi-module-project
# mvn install to install module1, otherwise mvn assembly:single will fail
mvn install && mvn assembly:single -pl module2