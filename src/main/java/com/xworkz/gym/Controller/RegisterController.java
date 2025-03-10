package com.xworkz.gym.Controller;

import com.xworkz.gym.DTO.RegisterDto;
import com.xworkz.gym.Entity.EnquiryEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
        model.addAttribute("listOfNames", listOfNames);
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

}

//    @PostMapping("/update")
//    public String updateRegisteration(RegisterDto registerDto,String name,long phone){
//        System.out.println("updateRegisteration in RegisterController");
//        boolean updated = service.updateRegister(registerDto,name,phone);
//        if(updated){
//            System.out.println("it is updated");
//            return "Success";
//        }
//        System.out.println("it is not updated");
//        return "Update";










