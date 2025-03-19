//package com.xworkz.gym.Controller;
//
//import com.xworkz.gym.DTO.TrainerDTO;
//import com.xworkz.gym.Entity.*;
//import com.xworkz.gym.constants.TrainerNames;
//import com.xworkz.gym.service.GymService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import javax.servlet.http.HttpSession;
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.List;
//
//@Controller
//@RequestMapping("/")
//public class TrainerController {
//
//    List<TrainerNames> gymTrainersEnums = new ArrayList<>(Arrays.asList(TrainerNames.values()));
//
//    @Autowired
//    private GymService gymService;
//
//    @GetMapping("/viewtrainer")
//    public String viewTrainer(Model model, HttpSession httpSession){
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg",entity);
//        List<TrainerEntity> trainerEntities=gymService.getAllTrainerDetails();
//        model.addAttribute("trainerDetails",trainerEntities);
//        return "TrainerDetails";
//    }
//
//    @GetMapping("/AssignUser")
//    public String viewTrainer1(Model model, HttpSession httpSession){
//        List<TrainerEntity> trainerEntities=gymService.getAllTrainerDetails();
//        System.out.println(trainerEntities);
//        return "AssignUserToTrainer";
//    }
//
//    @GetMapping("/AssignUsers")
//    public String assignUser(Model model, HttpSession httpSession){
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("list",entity);
//        List<TrainerEntity> trainerEntities=gymService.getAllTrainerDetails();
//        System.out.println("trainerEntities"+trainerEntities);
//        model.addAttribute("trainers",trainerEntities);
//        List<RegisterEntity>  registrationEntityList=gymService.getAllRegistredUsersDetails();
//        model.addAttribute("users",registrationEntityList);
//        return "AssignUsersToTrainers";
//    }
//
//    @GetMapping("/addSlots")
//    public String addSlots(Model model, HttpSession httpSession){
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg",entity);
//        List<SlotsEntity> slotsEntityList=gymService.getAllSlotsDetails();
//        model.addAttribute("slotsEntityList",slotsEntityList);
//        System.out.println(slotsEntityList);
//        return "AddSlots";
//    }
//
////    @GetMapping("/createSlot")
////    public String createSlot( Model model, HttpSession httpSession){
////        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
////        model.addAttribute("profile",entity.getImage());
////        return "CreateSlots";
////    }
//@GetMapping("/createSlot")
//public String createSlot(Model model, HttpSession httpSession) {
//    AdminEntity entity = (AdminEntity) httpSession.getAttribute("adminEntity");
//
//    if (entity == null) {
//        return "CreateSlots"; // Redirect to the login page if admin is not found in session
//    }
//
//    model.addAttribute("profile", entity.getImage());
//    return "AddSlots";
//}
//
//
//    @GetMapping("/onbuttonclick")
//    public  String onTrainerButton(Model model,HttpSession httpSession){
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg",entity);
//        model.addAttribute("trainerList",gymTrainersEnums);
//
//        List<SlotsEntity> slotsEntityList=gymService.getAllSlotsDetails();
//        model.addAttribute("slotsEntityList",slotsEntityList);
//        return "UpdateTrainer";
//    }
//    @PostMapping("/updateTrainer")
//    public  String onupdate(TrainerDTO trainerDTO, Model model, HttpSession httpSession){
//        System.out.println(trainerDTO);
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg",entity);
//        gymService.saveTrainerDetails(trainerDTO);
//        model.addAttribute("success","SuccessFully added Slot to "+trainerDTO.getTrainerName()
//        );
//        List<TrainerEntity> trainerEntities=gymService.getAllTrainerDetails();
//        model.addAttribute("trainerDetails",trainerEntities);
//        return "TrainerDetails";
//    }
//    @PostMapping("/slot")
//    public  String onaddSlot(String startTime,String endTime,String duration,Model model,HttpSession httpSession){
//
//        System.out.println(startTime+endTime+duration);
//        gymService.saveslots(startTime,endTime,duration);
//        List<SlotsEntity> slotsEntityList=gymService.getAllSlotsDetails();
//        model.addAttribute("slotsEntityList",slotsEntityList);
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg",entity);
//        return "AddSlots";
//    }
//
//    @PostMapping("/deleteSlot")
//    public String onDeleteSlot(int idForDelete,Model model,HttpSession httpSession){
//        System.out.println(idForDelete);
//        int value=gymService.deleteSlotById(idForDelete);
//        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg",entity);
//        List<SlotsEntity> slotsEntityList=gymService.getAllSlotsDetails();
//        model.addAttribute("slotsEntityList",slotsEntityList);
//        if(value>=1){
//            model.addAttribute("deleteSlot","SuccessFully Deleted Slot");
//            model.addAttribute("listimg",entity);
//            model.addAttribute("slotsEntityList",slotsEntityList);
//
//            return "AddSlots";
//        }
//        model.addAttribute("listimg",entity);
//        model.addAttribute("deleteSlot","Slot Not Deleted");
//
//        return "AddSlots";
//    }
//
//    @PostMapping("/deleteTrainerSlot")
//    public String onDeleteTrainerSlot(int trainerId,String trainerName,Model model,HttpSession httpSession) {
//        System.out.println(trainerId);
//        AdminEntity entity = (AdminEntity) httpSession.getAttribute("adminEntity");
//        model.addAttribute("listimg", entity);
//
//        List<TrainerEntity> trainerEntities = gymService.getAllTrainerDetails();
//
//        model.addAttribute("trainers", trainerEntities);
//
//        List<RegisterEntity> registrationEntityList = gymService.getAllRegistredUsersDetails();
//        model.addAttribute("users", registrationEntityList);
//        List<UsersAssignedToTrainerEntity> trainerEntitie = gymService.getUsersAssignedToTrainerByTrainerName(trainerName);
//        if (!trainerEntitie.isEmpty()) {
//            List<String> user = new ArrayList<>();
//            for (UsersAssignedToTrainerEntity ref : trainerEntitie) {
//                user.add(ref.getUserName());
//            }
//            System.out.println(user);
//            model.addAttribute("user", user);
//            model.addAttribute("idtrainer",trainerId);
//            int val=gymService.deleteUserAssignedToTrainer(trainerName);
//            System.out.println(val);
//            int value = gymService.deleteTrainerSlot(trainerId);
//            System.out.println(value);
//            if (value > 0) {
//                model.addAttribute("listimg", entity);
//                List<TrainerEntity> trainerEntiti = gymService.getAllTrainerDetails();
//                model.addAttribute("trainerDetails", trainerEntiti);
//                model.addAttribute("deletedTrainerSlot", "Trainer And Slot Deleted SuccessFully");
//                return "AssignUsersToNewTrainer";
//            }
//
//            List<TrainerEntity> trainer = gymService.getAllTrainerDetails();
//            model.addAttribute("trainerDetails", trainer);
//            model.addAttribute("deletedTrainerSlot", "Trainer And Slot Not Deleted");
//
//
//            return "AssignUsersToNewTrainer";
//        } else {
//
//
//            int value = gymService.deleteTrainerSlot(trainerId);
//            if (value > 0) {
//                model.addAttribute("listimg", entity);
//                List<TrainerEntity> trainerEntiti = gymService.getAllTrainerDetails();
//                model.addAttribute("trainerDetails", trainerEntiti);
//                model.addAttribute("deletedTrainerSlot", "Trainer And Slot Deleted SuccessFully");
//                return "TrainerDetails";
//            }
//
//            List<TrainerEntity> trainer = gymService.getAllTrainerDetails();
//            model.addAttribute("trainerDetails", trainer);
//            model.addAttribute("deletedTrainerSlot", "Trainer And Slot Not Deleted");
//
//            return "TrainerDetails";
//        }
//    }
//
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
//    public String onassignUsersToNewTrainer(int trainerId,String trainerName,String selectedUserName,Model model,HttpSession httpSession){
//        AdminEntity entity = (AdminEntity) httpSession.getAttribute("adminEntity");
//
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
//}