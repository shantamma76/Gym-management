package com.xworkz.gym.Controller;

import com.xworkz.gym.DTO.DietDto;
import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.rmi.MarshalledObject;
import java.security.PublicKey;
import java.util.List;

@Controller
@Slf4j
@RequestMapping("/")

public class PlanesController {

    @Autowired
    GymService service;

    PlanesController() {
        log.info("No-Arg Constructor in PlanesController");
    }


    @GetMapping("/dietAndExercise")
    public String displayRegiDetails(Model model) {
        System.out.println("displayRegiDetails in PlanesController");
        List<RegisterEntity> customerList = service.getAllRegiDetails();
        model.addAttribute("registerList", customerList);
        return "DietAndExercise";
    }

    @PostMapping("/assignPlane")
    public String saveData(DietDto dto,Model model){
        System.out.println("=====saveData in Controller=====");
        boolean savedData= service.saveDietAndExercise(dto);
        if(savedData){
            model.addAttribute("msg",savedData);
            return "Success";
        }
        model.addAttribute("error","Not Saved");
        return "DietAndExercise";

    }
}




