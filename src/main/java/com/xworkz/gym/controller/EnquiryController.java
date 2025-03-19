package com.xworkz.gym.controller;

import com.xworkz.gym.DTO.EnquiryDto;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class EnquiryController {

    @Autowired
    GymService service;

    EnquiryController() {
        System.out.println("No-arg Const in EnquiryController");
    }

    @PostMapping("/enquiry")
    public String onEnquiry(EnquiryDto dto, Model model){
        System.out.println("onEnquiry in GymController");
        boolean isEnquiry = service.saveEnquiry(dto);
        if(isEnquiry) {
            model.addAttribute("msg","enquiry success");
            return "Success";
        } else {
            model.addAttribute("error","Enquiry failed");
            return "Enquiry";
        }
    }

}
