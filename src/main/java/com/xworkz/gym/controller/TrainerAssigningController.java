package com.xworkz.gym.controller;

import com.xworkz.gym.DTO.AssignTrainersDto;
import com.xworkz.gym.Entity.*;
import com.xworkz.gym.service.GymService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.Collections;
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

    @GetMapping("/assignTrainer")
    public String assignSlot(Model model) {
        List<RegisterEntity> list = service.assignSlot();
        log.info("printining list" + list);

        //register names
        List<RegisterEntity> listOfRegister = service.getAllRegiDetails();
        Collections.reverse(listOfRegister);
        model.addAttribute("registerDetails", listOfRegister);

        return "AssignSlot";
    }

    @RequestMapping("/getEmailByName")
    @ResponseBody
    public String getPhoneNumberByName(@RequestParam String name) {
        System.out.println("====----------------getPhoneNumberByName in controller------------------===");
        String email = service.getEmailByName(name); //fetches the phone number based on name
        System.out.println("email of that name:" + email);
        return email;
    }


    @GetMapping("/searchEntity")
    private String search(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
        log.info("search in controller");
        RegisterEntity entity = service.searchDetails(name, email);
        System.out.println("==========:" + entity);
        log.info("entity" + entity);
        model.addAttribute("entity", entity);

        List<SlotsEntity> list = service.getTimeSlot();
        log.info("list" + list);
        model.addAttribute("list", list);

        List<TrainerEntity> listofdto = service.getTrainerDetails();
        model.addAttribute("listofdto", listofdto);
        log.info("printing entity" + listofdto);

        return "AssignSlot";
    }

    @PostMapping("/assignSlot")
    public String saveTrainers(AssignTrainersDto dto, Model model) {
        System.out.println("=========== saveTrainers ============");
        boolean saved = service.saveTrainer(dto);
        System.out.println("======+++++++++++++++=====:" + saved);
        System.out.println();
        if (saved) {
            model.addAttribute("success", "saved");
            return "Success";
        } else {
            model.addAttribute("failure", "not saves");
            return "AssignSlot";

        }
    }

        @GetMapping("/viewTrainerAssign")
        public String viewTrainer(Model model) {
            System.out.println("==============viewTrainer in controller===================");

            List<AssignTrainersEntity> trainerList = service.getAllAssignTrainer();
            model.addAttribute("assignTrainerList",trainerList);
            return "VewTrainerAndSlot";

        }

    }



//    @GetMapping("/searchEntity")
//    public String search(@RequestParam int id, Model model){
//        System.out.println("==============Search == in controller==========");
//
//       String name = service.getNameById(id);
//       model.addAttribute("registerDetails",name);
//
//     TrainerEntity entity = service.getTrainerDetailsById(id);
//     model.addAttribute("list",entity);
//
//        return "AssignSlot";
//    }



//    @PostMapping("/assignSlot")
//    public String assignTrainer(@RequestParam("entityId") int entityId, @RequestParam("trainerId") int trainerId, Model model, AssignTrainersDto dto) {
//       // System.out.println("===================="+entityId + "trainerId=====" +trainerId);
//        log.info("assign slot request in controller ");
//        boolean updated = service.updateSlot(entityId, trainerId);
//        if(updated)
//        {
//            model.addAttribute("success","Updated Successfully") ;
//        }else {
//            model.addAttribute("failure","Not Updated");
//        }
//
//        log.info("Assigning trainer {} to entity {} with slot {}", trainerId, entityId, dto.getSlotTimings());
//        boolean saveTrainer = service.saveAssignTrainer(entityId,trainerId);
//
//        if(saveTrainer){
//            model.addAttribute("saved","saved to database");
//        } else{
//            model.addAttribute("notSaved","not saved to database");
//        }
//        return "AssignSlot";  // Redirect to a confirmation page
//    }


    //auto complete
//    @GetMapping("/searchEntities")
//    @ResponseBody
//    public List<String> searchEntity(@RequestParam("term") String term) {
//        // Your existing code to search and return results as JSON
//        List<String> matchingNames = service.findMatchingNames(term);
//        return matchingNames;
//    }








}




















