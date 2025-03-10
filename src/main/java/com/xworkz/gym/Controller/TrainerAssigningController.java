package com.xworkz.gym.Controller;

import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.Entity.SlotsEntity;
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

    @GetMapping("/assignSlot")
    public String assignSlot() {
        List<RegisterEntity> list = service.assignSlot();
        log.info("printining list" + list);
        return "AssignSlot";
    }

    @GetMapping("/searchEntity")
    private String search(@RequestParam("name") String name, @RequestParam("email") String email, Model model) {
        log.info("search in controller");
        RegisterEntity entity = service.searchDetails(name, email);
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
    public String assignTrainer(@RequestParam("entityId") int entityId, @RequestParam("trainerId") int trainerId,Model model) {

        log.info("assign slot request in controller ");
        boolean updated = service.updateSlot(entityId, trainerId);
        if(updated)
        {
            model.addAttribute("success","Updated Successfully") ;
        }else {
            model.addAttribute("failure","Not Updated");
        }
        return "AssignSlot";  // Redirect to a confirmation page
    }

}




















