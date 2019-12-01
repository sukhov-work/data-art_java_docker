# spring-graal-native

This project contains code to enable the building of native images with GraalVM.

Once built, native images have very fast startup!

This feature supports:
- Graal 19.2.0.1
- Spring Boot 2.2.0

To try it out, install Graal 19.2.0.1 from: https://github.com/oracle/graal/releases,
then install `native-image` by running `gu install native-image` (currently it is
available as an early adopter plugin).


Then build the feature project with:

```
cd spring-graal-native-feature
./mvnw clean package
```

Now go into the `spring-boot-greeting-graal` subfolder and copy  `spring-boot-graal-feature/spring-graal-native-feature/target/original-spring-graal-native-feature-0.6.0.BUILD-SNAPSHOT.jar`
 to `spring-boot-greeting-graal/native/spring-graal-native-feature-0.6.0.BUILD-SNAPSHOT.jar`. Find a  `native/compile.sh` script - the script will call the 
native-image command passing the feature on the classpath, the executable produced
in each case should start instantly.


FAQ

Q. I get out of memory problems?

A. native-image likes to use a lot of RAM. There have been problems observed at 8G.


Q. This just isn't working for my project! Why not?

A. As samples are added, new technologies/libraries are supported. Initially support
   might be hard coded for that sample but the intention is always to generalize
   that support so any project using 'that tech' will work. So, if not working for
   your project it may be because you are using a library that hasn't been tested
   yet (no sample) or we haven't yet generalized the support for that library to
   work for any project consuming it. Feel free to let us know and we can explore
   what's up.
