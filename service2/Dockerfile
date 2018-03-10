FROM frolvlad/alpine-oraclejdk8:slim
ADD /target/service2.jar service2.jar
ENTRYPOINT exec java $JAVA_OPTS -jar /service2.jar