package hello;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class GreetingsController {

    @Autowired
    private GreetingsService greetingsService;

    @GetMapping("/hi")
    public String home() {
        return "Hello Spring Docker World";
    }

    @GetMapping("/greeting/{name}")
    public String greeting(@PathVariable("name") String name) {
        return greetingsService.greeting(name);
    }

}
