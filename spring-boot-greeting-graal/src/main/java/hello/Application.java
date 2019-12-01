package hello;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.validation.ValidationAutoConfiguration;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;

@SpringBootApplication(proxyBeanMethods = false, exclude = ValidationAutoConfiguration.class)
public class Application {

    public static void main(String[] args) {
        SpringApplication springApplication = new  SpringApplication(Application.class);
        addInitHooks(springApplication);
        springApplication.run(args);
    }

    static void addInitHooks(SpringApplication application) {
        application.addListeners((ApplicationListener<ApplicationStartedEvent>) event -> {
            System.out.println("app started , killing");
            System.exit(0);
        });
    }
}
