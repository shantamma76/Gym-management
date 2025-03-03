package com.xworkz.gym.Controller;

import com.xworkz.gym.DTO.AssignTrainersDto;
import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.Entity.TrainerEntity;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
@Slf4j
@RequestMapping("/")
public class TrainerAssigningController {

    @Autowired
    private GymService service;

    public TrainerAssigningController() {
        log.info("This is from the CustomerDetailsController");
    }

        @GetMapping("/trainer")
        public String displayDetails(Model model) {
        System.out.println("Fetching customer and trainer details");

        // Fetch register details
        List<RegisterEntity> customerList = service.getAllRegiDetails();
        model.addAttribute("listOfNames", customerList);

        // Fetch trainer and slot details
        List<TrainerEntity> trainerList = service.getTrainerDetails();
        model.addAttribute("TrainerEntityList", trainerList);

        return "AssignTrainer";
    }

    //save the data to database
    @PostMapping("/assign")
    public String saveAssignTrainerDetails(AssignTrainersDto dto, Model model) {
        System.out.println("===========save the trainer assign data in controller===========");
        boolean savedData = service.saveTrainerAssignDetails(dto);
        if (savedData) {
            model.addAttribute("msg", savedData);
            return "Success";

        } else {
            model.addAttribute("error", "Not Saved");
            return "AssignTrainer";
        }
    }

}




















