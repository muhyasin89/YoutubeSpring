package com.springbasic.init;


import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
public class SpringBasicController {
    
    @RequestMapping("/")
    public String index() {
        return "Spring Basic\n";
    }
    
}
