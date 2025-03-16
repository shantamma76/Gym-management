package com.xworkz.gym.RestController;

import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/")
public class RegistredUserSearchRestController {

    @Autowired
    private GymService gymService;

    @GetMapping("/search")
    public String search(@RequestParam String searchName, @RequestParam Long searchPhone) {

        List<RegisterEntity> registrationEntityList=gymService.getAllRegistredUsersDetailsByNameAndPhoneNo(searchName,searchPhone);

        if(registrationEntityList.isEmpty()){
            return "No User Registred With this Name and Phone Number";
        }
        return "";
    }

    @GetMapping(value = "/regEmail/{email}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String getName(@PathVariable String email) {
        System.out.println(email);

        long count = gymService.countEmail(email); // getCountOfRegEmail(email);
        System.out.println(count);
        if (count > 0) {
            System.out.println("enquiry Email exists");
            return "Email already exists";
        } else {
            System.out.println("enquiry Email doesn't exists");
            return "";
        }
    }
}

