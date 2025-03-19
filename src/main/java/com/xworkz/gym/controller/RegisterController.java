package com.xworkz.gym.controller;

import com.xworkz.gym.DTO.RegisterDto;
import com.xworkz.gym.Entity.AddGymEntity;
import com.xworkz.gym.Entity.EnquiryEntity;
import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;


@Slf4j
@Controller
public class RegisterController {

    @Autowired
    GymService service;


    //get all Names From EnquiryEntity in dropdown
    @GetMapping("/register")
    public String displayEnquiryDetails(Model model) {
        System.out.println("displayEnquiryDetails in Controller");

        List<EnquiryEntity> listOfNames = service.getAllEnquiry();
        Collections.reverse(listOfNames);
        model.addAttribute("listOfNames", listOfNames);

        List<AddGymEntity> listOfGyms = service.getAllGymDetails();
        model.addAttribute("listOfGym",listOfGyms);

        return "Registration";
    }

    //when select the name ,phoneNo will populate automatically
    @RequestMapping("/getPhoneNumberByName")
    @ResponseBody
    public String getPhoneNumberByName(@RequestParam String name) {
        System.out.println("====----------------getPhoneNumberByName in controller------------------===");
        String phone = service.getPhoneNumberByName(name); //fetches the phone number based on name
        System.out.println("phone number of that name:" + phone);
        return phone;
    }

    @RequestMapping("/getEmail")
    @ResponseBody
    public String getEmailByName(@RequestParam String name) {
        System.out.println("====----------------getPhoneNumberByName in controller------------------===");
        String phone = service.getEmailByName(name); //fetches the phone number based on name
        System.out.println("phone number of that name:" + phone);
        return phone;
    }


    //saving the registered details
    @PostMapping("/register")
    public String onRegister(RegisterDto dto, Model model) {
        log.info("onRegister in RegisterController-====================");
        boolean saveData = service.saveRegister(dto);
        if (saveData) {
            model.addAttribute("msg", "saved");
            model.addAttribute("name", dto.getName());
            return "Success";
        } else {
            model.addAttribute("error", "Not Saved");
            return "Registration";
        }
    }



    @GetMapping("/viewRegistered")
    public String viewRegisterDetails(@RequestParam(defaultValue = "1") int page, Model model) {
        System.out.println("viewRegisterDetails in Register Controller");

        // Define page size
        int pageSize = 10; // Number of records per page
        int startIndex = (page - 1) * pageSize; // Calculate the starting index for the query

        // Get paginated data
        List<RegisterEntity> registerList = service.getAllRegisterDetails(startIndex,pageSize);

        // Get the total number of records for pagination
        long totalRecords = service.getTotalRecords();

        // Calculate total pages
        int totalPages = (int) Math.ceil((double) totalRecords / pageSize);

        model.addAttribute("viewRegisterList", registerList);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "ViewRegisterDetails";
    }



//    @GetMapping("/viewRegistered")
//    public String viewRegisterDetails(Model model){
//        System.out.println("viewRegisterDetails in Register Controller");
//        List<RegisterEntity> registerList = service.getAllRegiDetails();
//        Collections.reverse(registerList);
//        model.addAttribute("viewRegisterList", registerList);
//
//        return "ViewRegisterDetails";
//    }

}












