package com.xworkz.gym.RestController;

import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/")
public class EnquiryRestController {

    EnquiryRestController(){
        log.info("No-arg constructor in RestController");
    }

    @Autowired
    GymService  service;

    @GetMapping(value = "/name/{name}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onCountName(@PathVariable String name, Model model) {
        log.info("Name is=" + name);
        Long count = this.service.countName(name);

        if (count == 0) {
            System.out.println("name does not exist");
            return "not exist";
        } else {
            System.out.println("name is exists");
            return "exist";
        }

    }

//    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String onCountEmail(@PathVariable String email){
//        log.info("Email is" +email);
//        Long count = this.service.countByEmail(email);
//        if(count == 0){
//            log.info("Email is does not exist");
//            return "Email Does Not Exist";
//        } else {
//            System.out.println("email is exists");
//            return "email exist";
//        }
//    }
//
//    @GetMapping(value = "/password/{password}", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String onCountPassword(@PathVariable String password){
//        log.info("Password is" +password);
//        Long count = this.service.countByPassword(password);
//        if(count == 0){
//            log.info("password is does not exist");
//            return "password Does Not Exist";
//        } else {
//            System.out.println("password is exists");
//            return "password exist";
//        }
//    }

    @GetMapping(value = "/area/{area}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onCountArea(@PathVariable String area) {
        System.out.println("area=" + area);
        Long count = this.service.countArea(area);
        if (count == 0) {
            System.out.println("does not exist");
            return "";
        } else {
            System.out.println("exists");
            return "";
        }
    }

    @GetMapping(value = "/phone/{phone}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onPhone(@PathVariable long phone) {
        System.out.println("phoneNo=" + phone);
        Long count = this.service.countPhone(phone);
        if (count == 0) {
            System.out.println("does not exist");
            return "";
        } else {
            System.out.println("exists");
            return "";
        }
    }

    @GetMapping(value = "/distance/{distance}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onCountDistance(@PathVariable int distance) {
        System.out.println("distance=" + distance);
        Long count = this.service.countDistance(distance);
        if (count == 0) {
            System.out.println("does not exist");
            return "";
        } else {
            System.out.println("exists");
            return "";
        }
    }

    @GetMapping(value = "/age/{age}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onCountAge(@PathVariable int age) {
        System.out.println("age=" + age);
        Long count = this.service.countAge(age);
        if (count == 0) {
            System.out.println("does not exist");
            return "";
        } else {
            System.out.println("exists");
            return "";
}

}
}
