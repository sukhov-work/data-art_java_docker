# data-art presentation
#
#d1 ----------- java 7 and docker

alias dart-d1-j11='docker run  -m 300M  --cpus="2" openjdk:11-jre java -XX:+PrintFlagsFinal -version | grep -E "(MAX|UseSerialGC|UseG1GC|MaxHeapSize)"'

#alias dart-d1-j7='docker run -m 200M  --cpus="1" williamyeh/java7  java -XX:+PrintFlagsFinal -version  | grep -E "(MAX|Use.*GC|MaxHeapSize)"'

alias dart-d1-oom-run='docker run -m 200m  -p 8080:8080 java7-oom'
alias dart-d1-docker-stat="docker ps | grep java7-oom | cut -d' ' -f1 | xargs docker stats"
alias dart-d1-curl-mem='curl http://localhost:8080/api/memory'
alias dart-d1-curl-cpu='curl http://localhost:8080/api/cpu'


alias dart-d1-j8='docker run -m 200M  --cpus="1" fabric8/java-alpine-openjdk8-jre  java -XX:+PrintFlagsFinal -version  | grep -E "(MAX|Use.*GC|MaxHeapSize)"'

# ----------- d2 - java CDS (spring-boot-greeting-module)

alias dart-d2-vanilla='multitime -n5 java -jar target/spring-boot-greeting-1.0.jar'
alias dart-d2-dump='java -Xshare:dump'
alias dart-d2-with-share='multitime -n5 java -Xshare:on  -jar  target/spring-boot-greeting-1.0.jar'

alias dart-d2-share-with-info='java -Xshare:on -Xlog:class+load=info -jar  target/spring-boot-greeting-1.0.jar'
alias dart-d2-remove-dump='rm -rf $(JAVA_HOME)/lib/server/classes.jsa'

#d3 ----------- java AppCDS (spring-boot-greeting-module)

alias dart-d3-create-app-cds='java -Xshare:on -XX:ArchiveClassesAtExit=app-cds.jsa  -jar  target/spring-boot-greeting-1.0.jar'

alias dart-d3-use-app-cds='multitime -n5 java -Xshare:on -XX:SharedArchiveFile=app-cds.jsa -jar target/spring-boot-greeting-1.0.jar'

#d4 ----------- java jLink (spring-boot-greeting-module)

# Analyze project dependencies
alias dart-d4-jdeps='jdeps --multi-release 9 -cp .:./BOOT-INF/lib/* ./BOOT-INF/classes/hello/Application.class'
alias dart-d4-jdeps-deep="jdeps  --multi-release 9 -cp .:./BOOT-INF/lib/*  -R ./BOOT-INF/classes/hello/Application.class | awk '{print \$4}'  | awk  'NR>0{arr[\$1]++}END{for (a in arr) print a, arr[a]}'"

alias dart-d4-jlink-simple='rm -rf linked-simple && jlink --module-path $(JAVA_HOME)/jmods --add-modules java.base --output linked-simple'


alias dart-d4-jlink-build='rm -rf linked && jlink --module-path $(JAVA_HOME)/jmods:target/dependency:target/dependency/BOOT-INF/lib --add-modules java.desktop,java.naming,java.management,java.security.jgss,java.instrument --output linked'

alias dart-d4-jlink-run-linked='multitime -n5 linked/bin/java --module-path target/classes:target.dependency/BOOT-INF/classes:target/dependency/BOOT-INF/lib -cp :target/dependency/BOOT-INF/lib/* --add-modules java.instrument  -m greeting.module/hello.Application'

#d5 ----------- Java AOT (spring-boot-greeting-module)


## Create app classpath string variable CP
alias dart-d5-build-thin-cp='CP=`java -jar spring-boot-thin-wrapper-1.0.12.RELEASE.jar --thin.archive=target/spring-boot-greeting-1.0.jar --thin.classpath`'


# Before Java 13
#alias dart-d5-build-classlist='java -XX:DumpLoadedClassList=target/app.classlist -cp target/classes/:$CP hello.Application'
#alias dart-d5-aot-build-from-classlist='jaotc --output target/libDemo.so -J-cp -J$CP `cat target/app.classlist | sed -e "s,/,.,g"`'


# build AOT library with selected application and base java method
alias dart-d5-aot-build-full='cd  target/classes  &&  jaotc --info --compile-commands ../touched.aotcfg --module java.base --output libTouched.so --verbose -J-cp -J$CP:. hello/*class'


# sample build of java base module
alias dart-d5-aot-build-base='jaotc -J-XX:+UseCompressedOops -J-XX:+UseG1GC -J-Xmx4g --compile-for-tiered --info --compile-commands java.base-list.txt --output aot-libs/libjava.base.so --module java.base'

alias dart-d5-build-touched-methods='java -XX:+UnlockDiagnosticVMOptions -XX:+LogTouchedMethods  -XX:+PrintTouchedMethodsAtExit  -jar spring-boot-greeting-1.0.jar'


alias dart-d5-clean-touched-methods="grep -v 'Hello Java!' touched_methods |  grep -v '^#' | grep -v jdk/internal/module/SystemModules.hashes | grep -v jdk/internal/module/SystemModules.descriptors |   sed -e 's/^/compileOnly /' |  java -cp ../. Convert > touched.aotcfg"

#alias dart-d5-run-with-aot='java -XX:AOTLibrary=aot-libs/libDemo.so,aot-libs/libApp.so -XX:+PrintAOT -cp target/classes/:$CP hello.Application'
#
alias dart-d5-run-with-aot='multitime -n5  java -XX:AOTLibrary=target/classes/libTouched.so  -jar target/spring-boot-greeting-1.0.jar'
alias dart-d5-run-with-everything='linked/bin/java -Xshare:on  -XX:SharedArchiveFile=app-cds.jsa -XX:AOTLibrary=target/classes/libTouched.so  -jar target/spring-boot-greeting-1.0.jar'

#d6 ----------- Portola JDK (spring-boot-greeting-module)

alias dart-d6-portola='docker build -t portola-test -f docker/PortolaDockerfile .'

#d7 ----------- Graal docker build example
alias dart-d7-graal-simple='docker build -t simple-graal-native --build-arg mainclass=HelloNative -f docker/BuildAndCreateImageDockerfile ./docker'

#d8 ----------- Quarkus build (quarkus-greeting)
alias dart-d8-quarkus-build='docker build -t quarkus-test -f src/main/docker/Dockerfile.nativeSmallBuild .'
alias dart-d8-quarkus-run='docker run -p 8080:8080 quarkus-test'