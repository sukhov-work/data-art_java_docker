FROM openjdk:11
VOLUME /tmp
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
COPY ${DEPENDENCY}/module-info.class /app/module-info.class

RUN ["java", "-Xshare:dump"]

ENTRYPOINT ["java", "--module-path", "app:app/lib", "-cp", "app/lib/*", "--add-modules", "java.instrument",  "-m" , "greeting.module/hello.Application"]

