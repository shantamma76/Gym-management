package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


@Slf4j
@RestController
@RequestMapping("/")
public class AdminRestController {

    AdminRestController(){
         log.info("No-arg constructor in RestController");
}

    @Autowired
    GymService service;

    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onAdminEmail(@PathVariable String email) {
        log.info("Email is=" +email);
        Long count = this.service.countEmail(email);
        if (count == 0) {
            System.out.println("emaail does not exist");
            return "does not exist";
        } else {
            System.out.println("email is exists");
            return "exist";
        }
    }


    @GetMapping(value = "/password/{password}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onAdminPasswords(@PathVariable String password) {
        log.info("Password is=" +password);
        Long count = this.service.countPassword(password);
        if (count == 0) {
            System.out.println("Password does not exist");
            return "does not exist";
        } else {
            System.out.println("Password is exists");
            return "exist";
        }
    }






}
