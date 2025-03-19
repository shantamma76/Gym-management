package com.xworkz.gym.controller;

import com.xworkz.gym.DTO.AddGymDto;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AddGymController {

    @Autowired
    GymService service;

    AddGymController() {
        System.out.println("No-arg Const in AddGymController");
    }


    @RequestMapping("/addGymDetails")
    public String saveGymDetails(AddGymDto dto, Model model) {
        System.out.println("saveGymDetails in AddGymController");
        boolean save = service.saveGymDetails(dto);
        if (save) {
            model.addAttribute("save", "saved to database");
            return "Success";
        }
        model.addAttribute("notSave", "not save the data");
        return "AddGym";
    }

}
