package com.xworkz.gym.Controller;

import com.xworkz.gym.Entity.SlotTimingsEntity;
import com.xworkz.gym.Entity.TrainerinfoEntity;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
    public String ontrainermanage(Model model) {
        List<SlotTimingsEntity> slots = gymService.getAllslots();
        model.addAttribute("slots", slots);
        List<TrainerinfoEntity> trainerinfolist = gymService.getAlltrainerdetails();
        model.addAttribute("trainerInfoList", trainerinfolist);
        return "trainerslots";
    }


    @PostMapping("/trainerAddact")
    public String ontraineradd(@RequestParam("name") String name, @RequestParam("phoneNumber") String phoneNumber,
                               @RequestParam("slotTimings") String slotTimings, Model model) {
        boolean saved = gymService.savetrainerdetails(name, phoneNumber, slotTimings);
        if (saved) {
            List<SlotTimingsEntity> slots = gymService.getAllslots();
            model.addAttribute("slots", slots);
            List<TrainerinfoEntity> trainerinfolist = gymService.getAlltrainerdetails();
            model.addAttribute("trainerInfoList", trainerinfolist);
            model.addAttribute("successMessage", "DetailsUpdatedSuccessfully");
            return "trainerslots";
        }
        model.addAttribute("errorMessage", "Failed ");
        return "trainerslots";
}

    @GetMapping("trainerslots")
    public String displayTrainer(Model model){
           List<TrainerinfoEntity> trainerList = gymService.getAlltrainerdetails();
           trainerList.forEach((n)-> System.out.println(n));
           model.addAttribute("trainerInfoList",trainerList);
           return "trainerslots";
    }

    @GetMapping("/delete")
    public String deleteTrainer(@RequestParam int id,Model model) {
        boolean isDeleted = gymService.getDeleteTrainerById(id);
        if (isDeleted) {
           List<TrainerinfoEntity> trainerinfoList = gymService.getAlltrainerdetails();
            trainerinfoList.forEach((n)->System.out.println(n));
            model.addAttribute("trainerInfoList",trainerinfoList);
            model.addAttribute("successMessage","trainer deleted successfully");
        } else {
            model.addAttribute("errorMessage","Failed to delete trainer.ID not found.");
        }
        return "trainerslots";
    }
}






