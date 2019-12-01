# java-container
Demo project for unstable Java Applications running inside containers - Using Spring Boot



Build and Deploy java-container locally
---------------------------------------

1. Open a command prompt and navigate to the root directory of this application.
2. Type this command to build and execute the application:

        mvn clean compile spring-boot:run
        
        or for docker run: 
        
        mvn clean package
        docker build -t java7-oom -f java-container-oom/Dockerfile.openjdk-7 . 
        docker run -m 200m  -p 8080:8080 java7-oom

3. The application will be running at the following URL: <http://localhost:8080/api/hello>
4. Display avalilable resources: <http://localhost:8080/api/cpu>
5. You can trigger the allocation of 80% of JVM memory accessing <http://localhost:8080/api/memory>


Check container stats with : 

```
docker ps | grep java7-oom | cut -d' ' -f1 | xargs docker stats

```