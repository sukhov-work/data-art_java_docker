# Outtakes and resources for "Java in the world of containers" presentation

Provides examples for different technics of docker images  minification and startup optimisations for JVM-based  applications.

All examples split into different folders, each folder contains it's own README with description and startup scripts. All examples and scripts has been tested on *Mac OS 10.13* wth *openjdk version 13* and *graalVM version 19.2 CE*,  behavior may differ on other systems.

#Additional resources: 

##JVM Ergonomics 
https://docs.oracle.com/javase/8/docs/technotes/guides/vm/gctuning/ergonomics.html

##Docker limitations
https://royvanrijn.com/blog/2018/05/java-and-docker-memory-limits/

##CDS and AppCDS 
https://docs.oracle.com/javase/8/docs/technotes/guides/vm/class-data-sharing.html
https://openjdk.java.net/jeps/310

##Docker and elastic CDS demo
https://kupczynski.info/2018/05/29/jvm-class-data-sharing.html


##Jlink tool
https://docs.oracle.com/javase/9/tools/jlink.htm

##Java AOT compiler
https://openjdk.java.net/jeps/295

##AOT and Jlink for Spring 
https://github.com/dsyer/spring-boot-java-10

##Project Portola  ( Alpine-compatible JDK)
https://openjdk.java.net/projects/portola/
https://aboullaite.me/protola-alpine-java/

##GraalVM
https://www.graalvm.org/docs/getting-started/

##Graal JIT compiler
https://www.infoq.com/articles/Graal-Java-JIT-Compiler/

##JMH tool for benchmarks 
https://openjdk.java.net/projects/code-tools/jmh/

##Graal Native image tool
https://www.graalvm.org/docs/reference-manual/native-image/
Native image limitations
https://github.com/oracle/graal/blob/master/substratevm/LIMITATIONS.md

##Spring graal native support (experimental)
https://github.com/spring-projects-experimental/spring-graal-native

##Quarkus graal native support
https://quarkus.io/guides/building-native-image-guide

##Multitime tool for performance measurments 
https://tratt.net/laurie/src/multitime/releases.html






