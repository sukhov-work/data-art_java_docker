package hello;

import org.springframework.stereotype.Service;

@Service
public class GreetingsService {

    public String greeting(String name) {
        return "hello " + name;
    }
}
