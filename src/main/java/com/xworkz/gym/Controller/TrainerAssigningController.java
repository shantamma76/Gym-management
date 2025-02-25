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

    //private List<TrainerNames> trainerNames = new ArrayList<>(Arrays.asList(TrainerNames.values()));

    public TrainerAssigningController() {
        log.info("This is from the CustomerDetailsController");
    }


    //fetching data from two tables
    @GetMapping("/noTrainer")
    public String displayDetails(Model model) {
        log.info("Fetching customer and trainer details");
        // Fetch customer details without trainer
        List<RegisterEntity> customerList = service.getAllRegiDetails();

        // Fetch trainer details
        List<TrainerEntity> trainerList = service.getTrainerDetails();

        // Add both lists to the model
        model.addAttribute("noTrainerList", customerList);
        model.addAttribute("TrainerEntityList", trainerList);

        // Return the same JSP view with both data sets
        return "AssignTrainersToUser";  // Same JSP for both sets of data
    }

    //save the data to database
    @PostMapping("/assignTrainer")
    public String saveAssignTrainerDetails(AssignTrainersDto dto, Model model) {
        System.out.println("===========save the trainer assign data in controller===========");
        boolean savedData = service.saveTrainerAssignDetails(dto);
        if (savedData) {
            model.addAttribute("msg", savedData);
            return "Success";

        } else {
            model.addAttribute("error", "Not Saved");
            return "AssignTrainersToUser";
        }
    }
}

//-----------------------------------------------------------------------------------------------------------
//    //updating trainerName and Timing slots
//    @PostMapping("/trainee{id}")
//    public String assignTrainerToUsers(@PathVariable int id, @RequestParam String trainersName, String slotTimings) {
//
//        System.out.println("Id from the customer with trainer details: " + id + " " + trainersName + " " + slotTimings + "");
//
//        TrainerEntity trainerEntity = service.getByIdToAssignTrainer(id, trainersName, slotTimings);
//        if (trainerEntity != null) {
//            return "Success";
//        }
//        return "AssignTrainersToUser";
//    }

//    @GetMapping("/customerTrainer")
//    public String customerWithTrainer(Model model){
//        System.out.println("------------customer With Trainer in controller---------------------------");
//        List<RegisterEntity> list = service.getCustomrtDetailsWithTrainer();
//
//        System.out.println("=====list===:"+list);
//        if(list!=null){
//            model.addAttribute("customrtWithTrainer", list);
//            model.addAttribute("trainers", trainerNames);
//            return "CustomrtWithTrainer";
//        }
//        return "Success";
//    }
//
//    @PostMapping("/assign/{id}")
//    public String assignTrainer(@PathVariable int id, @RequestParam String trainersName, String slotTimings){
//        System.out.println("Id from the customer with trainer details: "+id+ " "+ trainersName);
//        RegisterEntity registerEntity = service.getDatabyIdToAssigntrainer(id, trainersName);
//        if(registerEntity!=null) {
//            return "Success";
//        }
//        return "CustomrtWithTrainer";
//    }





