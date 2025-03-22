package com.xworkz.gym.controller;

import com.xworkz.gym.Entity.SlotsEntity;
import com.xworkz.gym.Entity.TrainerEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/")
public class TrainerAllotmentController {

    @Autowired
    GymService gymService;

    TrainerAllotmentController() {

        System.out.println("created the noArgs constructor TrainerAllotmentController");
    }

    @GetMapping("/trainersAllotmentact")
    public String onTrainermanage(Model model) {
        System.out.println("====onTrainermanage in controller===");
        List<SlotsEntity> slots = gymService.getAllslots();
        model.addAttribute("slots", slots);

        List<TrainerEntity> trainerinfolist = gymService.getAlltrainerdetails();
        model.addAttribute("trainerInfoList", trainerinfolist);
        return "trainerslots";
    }


    @PostMapping("/trainerAddact")
    public String ontraineradd(@RequestParam("trainerName") String trainerName, @RequestParam("phoneNumber") String phoneNumber,
                               @RequestParam("slotTimings") String slotTimings, Model model) {
        boolean saved = gymService.savetrainerdetails(trainerName, phoneNumber, slotTimings);
        if (saved) {
            List<SlotsEntity> slots = gymService.getAllslots();
            model.addAttribute("slots", slots);
            List<TrainerEntity> trainerinfolist = gymService.getAlltrainerdetails();
            model.addAttribute("trainerInfoList", trainerinfolist);
            model.addAttribute("successMessage", "DetailsUpdatedSuccessfully");
            return "trainerslots";
        }
        model.addAttribute("errorMessage", "Failed ");
        return "trainerslots";
}


    @GetMapping("trainerslots")
    public String displayTrainer(Model model){
        System.out.println("===displayTrainer in controller====");
           List<TrainerEntity> trainerList = gymService.getAlltrainerdetails();
           System.out.println("======= trainers list =========:"+trainerList);
           trainerList.forEach((n)-> System.out.println(n));
           model.addAttribute("trainerInfoList",trainerList);
           return "trainerslots";
    }


    @GetMapping("/delete")
    public String deleteTrainer(@RequestParam int id,Model model) {
        boolean isDeleted = gymService.getDeleteTrainerById(id);
        if (isDeleted) {
           List<TrainerEntity> trainerinfoList = gymService.getAlltrainerdetails();
            trainerinfoList.forEach((n)->System.out.println(n));
            model.addAttribute("trainerInfoList",trainerinfoList);
            model.addAttribute("successMessage","trainer deleted successfully");
            return "trainerslots";
        } else {
            model.addAttribute("errorMessage", "Failed to delete trainer.ID not found.");

            return "trainerslots";
        }
    }


//    //==============================================
//    @PostMapping("/assignUsers")
//    public String onAssign(String trainerName,String selectedUserName,Model model){
//        System.out.println(trainerName +"  "+selectedUserName);
//
//        List<String> trainerAndSlot = Arrays.asList(trainerName.split(","));
//
//        List<String> userNames = Arrays.asList(selectedUserName.split(","));
//
//        gymService.assignUsersToTrainer(trainerAndSlot.get(0), userNames,trainerAndSlot.get(1));
//        model.addAttribute("trainerName",trainerAndSlot.get(0));
//        model.addAttribute("slot",trainerAndSlot.get(1));
//        model.addAttribute("assignedUsers",userNames);
//        return "DisplayUsersAssignedToTrainer";
//    }
//
//    @PostMapping("/assignUsersToNewTrainer")
//    public String onassignUsersToNewTrainer(int trainerId, String trainerName, String selectedUserName, Model model, HttpSession httpSession){
//        AdminEntity entity = (AdminEntity) httpSession.getAttribute("adminEntity");
//
//        System.out.println(trainerName +"  "+selectedUserName);
//
//        List<String> trainerAndSlot = Arrays.asList(trainerName.split(","));
//        List<String> userNames = Arrays.asList(selectedUserName.split(","));
//
//        gymService.assignUsersToTrainer(trainerAndSlot.get(0), userNames,trainerAndSlot.get(1));
//        model.addAttribute("trainerName",trainerAndSlot.get(0));
//        model.addAttribute("slot",trainerAndSlot.get(1));
//        model.addAttribute("assignedUsers",userNames);
//        return "DisplayUsersAssignedToTrainer";
//    }


}







