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
@RequestMapping("/registration")
public class RegisterRestController {

    RegisterRestController(){
        log.info("No-arg constructor in RestController");
    }

    @Autowired
    GymService service;

    @GetMapping(value = "/name/{name}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onNameCount(@PathVariable String name) {
        log.info("Name is=" +name);
        Long count = this.service.countNameBy(name);
        if (count == 0) {
            System.out.println("name does not exist");
            return "";
        } else {
            System.out.println("name is exists");
            return "";
        }
    }

//    @GetMapping(value = "/email/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String onEmailCount(@PathVariable String email) {
//        log.info("Email is=" +email);
//        Long count = this.service.countByEmail(email);
//        if (count == 0) {
//            System.out.println("email does not exist");
//            return "";
//        } else {
//            System.out.println("email is exists");
//            return "";
//        }
//    }

    @GetMapping(value = "/trainer/{trainer}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onTrainerCount(@PathVariable String trainer) {
        log.info("Trainer is=" +trainer);
        Long count = this.service.countByTrainer(trainer);
        if (count == 0) {
            System.out.println("trainer does not exist");
            return "";
        } else {
            System.out.println("trainer is exists");
            return "";
        }
    }

    @GetMapping(value = "/phone/{phone}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onPhoneCount(@PathVariable long phone) {
        log.info("Phone is=" +phone);
        Long count = this.service.countByPhone(phone);
        if (count == 0) {
            System.out.println("phone does not exist");
            return "";
        } else {
            System.out.println("phone is exists");
            return "";
        }
    }

    @GetMapping(value = "/gymName/{gymName}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String onGymNameCount(@PathVariable String gymName) {
        log.info("gymName is=" +gymName);
        Long count = this.service.countByGymName(gymName);
        if (count == 0) {
            System.out.println("gymName does not exist");
            return "";
        } else {
            System.out.println("gymName is exists");
            return "";
        }
    }

//    @GetMapping(value = "/paid/{paid}", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String onGymNameCount(@PathVariable int paid) {
//        log.info("paid is=" +paid);
//        Long count = this.service.countByPaid(paid);
//        if (count == 0) {
//            System.out.println("paid does not exist");
//            return "does not exist";
//        } else {
//            System.out.println("paid is exists");
//            return "exist";
//        }
//    }

//    @GetMapping(value = "/installment/{installment}", produces = MediaType.APPLICATION_JSON_VALUE)
//    public String onInstallmentCount(@PathVariable int installment) {
//        log.info("installment is=" +installment);
//        Long count = this.service.countByPaid(installment);
//        if (count == 0) {
//            System.out.println("installment does not exist");
//            return "does not exist";
//        } else {
//            System.out.println("installment is exists");
//            return "exist";
//        }
//    }


}
