//package com.xworkz.gym.Controller;
//
//import com.xworkz.gym.Entity.TrainerEntity;
//import com.xworkz.gym.service.GymService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import java.util.List;
//
//public class DemoController {
//
//    @Autowired
//    GymService service;
//
//    @RequestMapping("assignUserSlot")
//    public String assign(Model model)
//    {
//        List<TrainerEntity> slots = service.findAll();
//        model.addAttribute("slots", slots);
//
//        return "AssignSlot.jsp";
//    }
//    @PostMapping("assignSlot")
//    public String onSubmitAssign(@RequestParam String email,@RequestParam int trainer,Model model)
//    {
//        System.out.println(email+" "+trainer);
//        service.updateTrainerAndSlot(email,trainer);
//        List<SlotEntity> slots = trainerSlotService.findAll();
//        model.addAttribute("slots", slots);
//        return  "AssignSlot.jsp";
//    }
//
//
//
//
//
//
//
//}
