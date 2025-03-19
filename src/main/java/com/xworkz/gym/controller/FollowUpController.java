package com.xworkz.gym.controller;

import com.xworkz.gym.Entity.EnquiryEntity;
import com.xworkz.gym.Entity.ViewEntity;
import com.xworkz.gym.constants.StatusEnum;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Controller
public class FollowUpController {

    @Autowired
    private GymService service;

    public FollowUpController() {
        System.out.println("No-arg Constructor in FollowUpController");
    }

    @GetMapping("followup")
    public String onFollow(@RequestParam(value = "status", required = false) String status, Model model) {
        List<EnquiryEntity> enquiryList;
        if (status != null && !status.isEmpty()) {
            enquiryList = service.getEnquiriesByStatus(status);
        } else {
            enquiryList = service.getEnquiries();
        }
        Collections.reverse(enquiryList);   //all lists are in descending order
        model.addAttribute("enquiryList", enquiryList);
        model.addAttribute("statusOptions", Arrays.asList(StatusEnum.values()));
        model.addAttribute("selectedStatus", status);
        return "FollowUp";
    }

    @PostMapping("updateFollowUp")
    public String onFollowUpUpdate(@RequestParam String name, @RequestParam String status, @RequestParam String reasons, Model model) {
        System.out.println("onFollowUpUpdate in FollowUp Controller");
        System.out.println(name);
        boolean saved = service.updateStatusAndReason(name, status, reasons);

        System.out.println("update method------------------");
        if (saved) {
            List<EnquiryEntity> enquiryList = service.getEnquiries();
            if (enquiryList != null) {
                enquiryList.forEach((n) -> System.out.println(n));

                // session.setAttribute("enquiryList", enquiryList);
                model.addAttribute("enquiryList", enquiryList);
                model.addAttribute("statusOptions", Arrays.asList(StatusEnum.values()));
                return "FollowUp";
            }
        }
        return "FollowUp";
    }

//    @PostMapping("/saveview")
//    public String saveView(ViewDto viewDto){
//        boolean display = service.saveView(viewDto);
//        if (display) {
//            return "Success";
//        } else {
//            return "ViewDetails";
//        }
//    }

    @GetMapping("/view")
    public String viewPage(@RequestParam int id, Model model) {
        System.out.println("==============viewPage===================");
        System.out.println("**************id*******************"+id);
        List<ViewEntity> enquiryList = service.getAllFollowup(id);
        System.out.println("viewDetails in controller======"+enquiryList);
        model.addAttribute("enquiryList",enquiryList);
        return "ViewDetails";

    }


}



