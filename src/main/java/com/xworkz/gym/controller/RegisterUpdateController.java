package com.xworkz.gym.controller;

import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;

@Controller
@RequestMapping("/")
@Slf4j
public class RegisterUpdateController {

    @Autowired
    public GymService gymService;

    RegisterUpdateController() {
        System.out.println("No-arg const in UpdateController");
    }

    //pagination
    @GetMapping("/updateRegi")
    public String displayDetails(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10")
                             int size, Model model) {
        System.out.println("Fetching customer and trainer details with pagination");
        int pageSize = 10;
        int startIndex = (page - 1) * size;

        List<RegisterEntity> customerList = gymService.getAllRegiDetails(page, size);
        System.out.println("================controller======:"+customerList);

        long totalRecords = gymService.getTotalRecords();
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        model.addAttribute("registerDetails", customerList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        return "Update";
    }


    @PostMapping("/updateDetails")
    public String updateDetails(@RequestParam String name, @RequestParam String packages, @RequestParam String amount,
                                @RequestParam int paid, @RequestParam double balance, @RequestParam double installment, Model model) {
        System.out.println("updateDetails in register update Controller");
        System.out.println(name);
        boolean value = gymService.updateDetailsById(packages, amount, paid, balance, installment, name);
        if (value) {
            return "Success";
        }
        return "Update";
    }

}










