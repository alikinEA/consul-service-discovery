FROM frolvlad/alpine-oraclejdk8:slim
ADD /target/service1.jar service1.jar
ENTRYPOINT exec java $JAVA_OPTS -jar /service1.jar