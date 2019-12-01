#!/usr/bin/env bash
#../../mvnw -DskipTests clean package

export JAR="spring-boot-greeting-1.0.jar"
#rm -f spring-native-app
printf "Unpacking $JAR"
rm -rf unpack
mkdir unpack
cd unpack
jar -xvf ../../target/$JAR >/dev/null 2>&1
cp -R META-INF BOOT-INF/classes

cd BOOT-INF/classes
export LIBPATH=`find ../../BOOT-INF/lib | tr '\n' ':'`
export CP=.:$LIBPATH

# Our feature being on the classpath is what triggers it
export CP=$CP:../../../spring-graal-native-feature-0.6.0.BUILD-SNAPSHOT.jar

printf "\n\nCompile\n"

native-image \
  -Dio.netty.noUnsafe=true \
  --verbose \
  --no-server \
  --initialize-at-build-time=org.eclipse.jdt,org.apache.el.parser.SimpleNode,javax.servlet.jsp.JspFactory,org.apache.jasper.servlet.JasperInitializer,org.apache.jasper.runtime.JspFactoryImpl \
  -H:+JNI \
  -H:EnableURLProtocols=http,https,jar \
  -H:ReflectionConfigurationFiles=../../../tomcat-reflection.json,../../../runtime-agent-info/reflect-config.json \
  -H:ResourceConfigurationFiles=../../../tomcat-resource.json,../../../runtime-agent-info/resource-config.json \
  -H:JNIConfigurationFiles=../../../tomcat-jni.json,../../../runtime-agent-info/jni-config.json \
  -H:DynamicProxyConfigurationFiles=../../../runtime-agent-info/proxy-config.json \
  --enable-https \
  -H:+TraceClassInitialization \
  -H:IncludeResourceBundles=javax.servlet.http.LocalStrings \
  -H:Name=spring-native-app \
  -H:+ReportExceptionStackTraces \
  --no-fallback \
  --allow-incomplete-classpath \
  --report-unsupported-elements-at-runtime \
  -Dsun.rmi.transport.tcp.maxConnectionThreads=0 \
  -DremoveUnusedAutoconfig=true \
  -cp $CP hello.Application \
  #-J-cp -J$CP

#native-image \
#  -Dio.netty.noUnsafe=true \
#  --enable-https \
#  --no-server \
#  -H:+TraceClassInitialization \
#  -H:IncludeResourceBundles=javax.servlet.http.LocalStrings \
#  -H:Name=spring-native-app \
#  -H:+ReportExceptionStackTraces \
#  --no-fallback \
#  --allow-incomplete-classpath \
#  --report-unsupported-elements-at-runtime \
#-Dsun.rmi.transport.tcp.maxConnectionThreads=0 \
#  -DremoveUnusedAutoconfig=true \
#  -cp $CP com.example.tomcat.TomcatApplication
#

printf "\n\nCompiled app (spring-native-app)\n"

time ./spring-native-app

