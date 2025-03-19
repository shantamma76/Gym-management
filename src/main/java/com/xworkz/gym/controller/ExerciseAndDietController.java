package com.xworkz.gym.controller;

import com.xworkz.gym.DTO.UserExerciseAndDietDTO;
import com.xworkz.gym.Entity.AdminEntity;
import com.xworkz.gym.Entity.RegisterEntity;
import com.xworkz.gym.Entity.UserExerciseAndDietEntity;
import com.xworkz.gym.Entity.UserUpdatedExerciseAndDietEntity;
import com.xworkz.gym.constants.ProfileImagePath;
import com.xworkz.gym.service.GymService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/")
public class ExerciseAndDietController {

    @Autowired
    private GymService service;

    @GetMapping("/UpdateExerciseAndDiet")
    public String onUpdate(HttpSession httpSession, Model model){
        System.out.println("====onUpdate in Controller===");
        List<RegisterEntity> list = service.getAllRegiDetails();
        System.out.println("================:"+list);
        AdminEntity adminEntity = (AdminEntity) httpSession.getAttribute("adminEntity");
        model.addAttribute("listimg",adminEntity);
        model.addAttribute("list",list);

        return "UpdateUserExerciseAndDiet";
    }


    @RequestMapping("/searchUser")
    public String onSearch(String searchName, Long searchPhone, Model model, HttpSession httpSession){
        System.out.println("============onSearch============in controller=======");
        List<RegisterEntity> registrationEntityList = service.getAllRegistredUsersDetailsByNameAndPhoneNo(searchName, searchPhone);
        System.out.println(registrationEntityList);
        AdminEntity entity=(AdminEntity) httpSession.getAttribute("adminEntity");
        System.out.println("=======entity=====:"+entity);
        model.addAttribute("listimg",entity);
        if(registrationEntityList.isEmpty()){
            model.addAttribute("listimg",entity);
            model.addAttribute("notFound","No One Registred With This Name And Phone Number. Please Check Name And Phone Number");
            return "UpdateUserExerciseAndDiet";
        }
        model.addAttribute("list",registrationEntityList);
        return "UpdateUserExerciseAndDiet";
    }

//-----------------------------------------------------

    @GetMapping("/updateDiet")
    public String onUpdateDiet(@RequestParam("id") int id , HttpSession httpSession, Model model){
        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity") ;
        model.addAttribute("list",adminEntity);
        System.out.println(id);
        model.addAttribute("Userid",id);
        return "ExerciseAndDiet";
    }

    @PostMapping("/exercisediet")
    public String onUpdates(@RequestParam("dietImage") MultipartFile multipartFile, @RequestParam int id, UserExerciseAndDietDTO userExerciseAndDietDTO , Model model, HttpSession httpSession) throws IOException {
        System.out.println("========== onUpdate in controller ==========:");
        System.out.println(id);
        System.out.println(userExerciseAndDietDTO);
        String filePath;

        if (multipartFile.isEmpty()) {
            return "ExerciseAndDiet";
        } else {
            System.out.println(multipartFile);
            System.out.println(multipartFile.getOriginalFilename());
            byte[] bytes = multipartFile.getBytes();
            Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath() + System.currentTimeMillis() + ".jpg");
            Files.write(path,bytes);
            filePath = path.getFileName().toString();
        }

        System.out.println(filePath);
        service.saveUserDietAndExercise(id,filePath,userExerciseAndDietDTO);

        List<RegisterEntity> list = service.getAllRegiDetails();
        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity");
        model.addAttribute("listimg",adminEntity);
        model.addAttribute("list",list);
        model.addAttribute("success", "Successfully Updated Exercise and Diet Plan");
        return "UpdateUserExerciseAndDiet";
    }

    @GetMapping("/viewUserExercise")
    public String onupdate(@RequestParam int id, HttpSession httpSession, Model model) {

        System.out.println(id);
        List<UserUpdatedExerciseAndDietEntity> userExerciseAndDietEntities =service.getAlluserExerciseAndDietEntitiesById(id);
        System.out.println(userExerciseAndDietEntities);

        List<UserExerciseAndDietEntity> userMonthlyImages =service.getuserMonthlyImages(id);
        System.out.println("==============user montly image===========:"+userMonthlyImages);

        model.addAttribute("viewUserExercise",userExerciseAndDietEntities);
        model.addAttribute("monthlyImages",userMonthlyImages);

        AdminEntity adminEntity=(AdminEntity) httpSession.getAttribute("adminEntity");
        System.out.println("========-------------------:adminEntity");
        model.addAttribute("listimg",adminEntity);

        return "ViewExerciseAndDiet";
    }


}
