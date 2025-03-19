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
        int pageSize = 10; // Number of records per page
        int startIndex = (page - 1) * pageSize;

        List<RegisterEntity> customerList = gymService.getAllRegiDetails(page, size);

        long totalRecords = gymService.getTotalRecords();
        // Calculate total pages
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        // Add paginated data to model
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


//    @GetMapping("/updateRegi")
//    public String displayDetails(Model model) {
//        System.out.println("Fetching customer and trainer details");
//        List<RegisterEntity> customerList = gymService.getAllRegiDetails();
//        Collections.reverse(customerList);
//        model.addAttribute("registerDetails", customerList);
//        return "Update";
//    }


//    @PostMapping("/update")
//    public String updateRegister(RegisterDto registerDto, String name, long phone) {
//        log.debug("UpdateController================== ");
//        boolean isUpdated = gymService.updateRegister(registerDto, name, phone);
//        if (isUpdated) {
//            return "Success";
//        } else {
//            return "Update";
//        }
//    }

//    @GetMapping("/update")
//    public String showUpdatePage(Model model) {
//        List<PackageEnum> packages = new ArrayList<>(Arrays.asList(PackageEnum.values()));
//        model.addAttribute("packages", packages);
//        return "UpdateRegister";
//    }
//
//    @PostMapping("/searchEmail")
//    public String getDetailsByEmail(@RequestParam String email, Model model) {
//        RegisterEntity details = gymService.getDetailsByEmail(email);
//        if (details != null) {
//            model.addAttribute("details", details);
//            return "UpdateRegister";
//        }
//        return "Success";
//    }


//---------------------------------------------------------------------









