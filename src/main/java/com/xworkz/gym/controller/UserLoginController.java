package com.xworkz.gym.controller;

import com.xworkz.gym.DTO.RegisterDto;
import com.xworkz.gym.Entity.*;
import com.xworkz.gym.constants.ProfileImagePath;
import com.xworkz.gym.repository.GymRepository;
import com.xworkz.gym.service.GymService;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Slf4j
@RequestMapping("/")
@Controller
public class UserLoginController {

    @Autowired
    private GymService service;

//    @GetMapping("/UserLogin")
//    public String onLogin() {
//        return "UserLogin";
//    }

    @Autowired
    private GymRepository repository;


    @PostMapping("/signIn")
    public String onUserLogin(@RequestParam String email, @RequestParam String password, Model model ,HttpSession httpSession) {
        log.info("======onUserLogin in UserController=============:");
        RegisterEntity entity = service.getEmail(email, password);
        System.out.println("to know the which value returning from service..." + entity);
        int loginCount;
        if (entity != null) {
            loginCount = entity.getLoginCount();
            log.info("Login Count:" + loginCount);
            if (loginCount == -1) {
                System.out.println("Redirecting to UpdatePassword page.");
                String name = entity.getName();
                model.addAttribute("userName", name);
                System.out.println(name);
                model.addAttribute("msg", "UserSuccess");
                return "resetPassword";
            } else {
               httpSession.setAttribute("userRegEntityHttp",entity);
                System.out.println("Redirecting to Success page.");
                String name = entity.getName();
                model.addAttribute("userName", name);
                model.addAttribute("register", entity);
                model.addAttribute("filePath", entity.getFilePath());

                model.addAttribute("list", entity);
                return "UserHome";
            }
        }
        else {
            System.out.println("User entity is null. Redirecting to SignIn.");
            model.addAttribute("msg", "Invalide Email Address or Password");
            return "UserLogin";
        }
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@RequestParam String email, @RequestParam String oldPassword,
                                @RequestParam String newPassword, @RequestParam String confirmPassword) {
        log.info("Email is: {}", email);
        log.info("Old password: {}", oldPassword);
        log.info("New password: {}", newPassword);
        log.info("Confirm password: {}", confirmPassword);
        System.out.println("===================reset password========================");
        String msg = service.resetPassword(email, oldPassword, newPassword, confirmPassword);
        if ("password updated successfully".equals(msg)) {
            return "UserSuccess";
        } else {
            return "resetPassword";
        }
    }

    //forget Password
    @PostMapping("/forgetPassword")
    public String forgotPassword(@RequestParam String email, @RequestParam String newPassword, @RequestParam String confirmPassword) {
        System.out.println("Received request for resetting password:");
        System.out.println("Email:" + email);
        System.out.println("New Password:" + newPassword);
        System.out.println("ConfirmPassword:" + confirmPassword);

        String response = service.resetPasswordByEmail(email, newPassword, confirmPassword);

        if ("password updated successfully".equals(response)) {
            return "UserLogin";
        } else {
            return "ForgetPassword";
        }
    }

    //------------------------------------update profile---------------------------------------------

//    @GetMapping("/updateProfile")
//    public String onUpdateProfile(@RequestParam int id, Model model) {
//        System.out.println("=============================update action+++========");
//        RegisterEntity entity = new RegisterEntity();
//        // registrationId=entity.getRegistrationId();
//        System.out.println("Why Id is coming" + id);
//        // Validate registrationId
//        if (id <= 0) {
//            model.addAttribute("error", "Invalid user ID.");
//            return "Success";  // Redirect to an error page if no valid ID is found
//        }
//
//        // Fetch user details from service
//        List<RegisterEntity> entities = service.getAllRegisteredUserDetailsById(id);
//        if (entities != null && !entities.isEmpty()) {
//            RegisterEntity entity1 = entities.get(0); // Get first user
//            model.addAttribute("register", entity1);
//            model.addAttribute("filePath", entity1.getFilePath());
//        } else {
//            model.addAttribute("error", "No user found with this ID");
//            return "ErrorPage";
//        }
//        return "UpdateUserProfile";
//        //return "UserProfile";
//
//    }

    @GetMapping("/download")
    public void display(HttpServletResponse response, @RequestParam String filePath) throws Exception {
        System.out.println("this is image" + filePath);
        response.setContentType("Image/jpg");
        File file = new File("C:\\ProfileImagePath\\" + filePath);
        InputStream inputStream = new BufferedInputStream(new FileInputStream(file));
        ServletOutputStream outputStream = response.getOutputStream();
        IOUtils.copy(inputStream, outputStream);
        response.flushBuffer();
    }

//
//    @PostMapping("/updateUserProfile")
//    public String onUpdating(String name, RegisterDto registerDto, @RequestParam("filePath") MultipartFile multipartFile, Model model) throws IOException {
//        System.out.println(name);
//
//        if (multipartFile.isEmpty()) {
//            RegisterDto dto = service.updateUserProfile(name, registerDto, null);
//            model.addAttribute("register", name);
//            return "UserSuccess";
//        }
//        else {
//            System.out.println("multipartFile=" + multipartFile);
//            System.out.println("multipartFile OriginalFileName==" + multipartFile.getOriginalFilename());
//            System.out.println("multipartFile==" + multipartFile.getContentType());
//
//            byte[] bytes = multipartFile.getBytes();
//            Path path = Paths.get("C:\\ProfileImagePath\\" + name + System.currentTimeMillis() + ".jpg");
//            //  Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath() + System.currentTimeMillis() + ".jpg");
//            Files.write(path, bytes);
//
//            String filePath = path.getFileName().toString();
//            System.err.println("filePath=====" + filePath);
//
//            RegisterDto dto = service.updateUserProfile(name, registerDto, filePath);
//            return "UserHome";
//        }
//    }

    //---------------------------------------------------------------------------------------------
    @GetMapping("/userHome")
    public String onHome(Model model, HttpSession httpSession) {
        RegisterEntity entity = (RegisterEntity) httpSession.getAttribute("userRegEntityHttp");
        model.addAttribute("list", entity);
        return "UserHome";
    }

    @GetMapping("/updateProfile")
    public String onUpdate(HttpSession httpSession,Model model){
        RegisterEntity entity1=(RegisterEntity) httpSession.getAttribute("userRegEntityHttp");
        String name = entity1.getName();
        int age = entity1.getAge();
        RegisterEntity entity=service.getAllRegistredUsersDetailsById(name,age);
        model.addAttribute("register",entity);
        return "UpdateUserProfile";
    }


    @PostMapping("/updateUserProfile")
    public String onUpdate(@RequestParam("thisfile") MultipartFile multipartFile,
                           RegisterDto registerDto,
                           Model model,
                           HttpServletRequest httpSession) throws IOException {

        // Get the current user from the session
//        RegisterEntity entity1 = (RegisterEntity) httpSession.getAttribute("userRegEntityHttp");
//        System.out.println("=============:"+entity1);
//        String name = entity1.getName();

        String filePath = null;

        if (!multipartFile.isEmpty()) {
            System.out.println(multipartFile);
            System.out.println(multipartFile.getOriginalFilename());

            byte[] bytes = multipartFile.getBytes();
            Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath() + System.currentTimeMillis() + ".jpg");
            Files.write(path, bytes);

            filePath = path.getFileName().toString();

        }

        RegisterDto updatedValue = service.updateUserProfile(registerDto.getName(), registerDto, filePath);
        httpSession.setAttribute("userRegEntityHttp",updatedValue);

        if (updatedValue != null) {
            RegisterEntity entity = service.getAllRegistredUsersDetailsById(registerDto.getName(),registerDto.getAge());

            HttpSession httpsession = httpSession.getSession(true);
            httpSession.setAttribute("register", entity);
            httpSession.setAttribute("picPaths", filePath);
            return "UserProfile";
        }
        return "UserHome";
    }


    @GetMapping("/userProfile")
    public String onUserProfile(HttpSession httpSession,Model model,String name) {
        RegisterEntity registrationEntity = (RegisterEntity) httpSession.getAttribute("userRegEntityHttp");
       model.addAttribute("register",registrationEntity);

        List<RegisterEntity> listRegi = service.getAllRegiDetails();
        System.out.println("========================================================="+listRegi);
        httpSession.setAttribute("register",listRegi);
        return "UserProfile";
    }

    @GetMapping("/trainerAndSlot")
    public String ontrainerAndSlot(HttpSession httpSession,Model model){
        System.out.println("===============ontrainerAndSlot in controller=================");
        Object object= httpSession.getAttribute("userRegEntityHttp");
        RegisterEntity registrationEntity=(RegisterEntity) object;
        System.out.println(registrationEntity);
        model.addAttribute("registrationEntity",registrationEntity);
        AssignTrainersEntity entity=service.getTrainerAndSlotByUserName(registrationEntity.getName());
        System.out.println(entity);
        model.addAttribute("entity",entity);
        return "DisplayUserTrainerAndSlot";
    }

    @GetMapping("/exerciseDiet")
    public String onExceriseAndDiet(Model model, HttpSession httpSession) {
        System.out.println("=========onExceriseAndDiet in Controller=========");
        RegisterEntity entity = (RegisterEntity) httpSession.getAttribute("userRegEntityHttp");
        model.addAttribute("list", entity);

        List<UserUpdatedExerciseAndDietEntity> userExerciseAndDietEntities = service.getAlluserExerciseAndDietEntitiesById(entity.getId());
        System.out.println(userExerciseAndDietEntities);
        List<UserExerciseAndDietEntity> userMonthlyImages = service.getuserMonthlyImages(entity.getId());
        model.addAttribute("viewUserExercise", userExerciseAndDietEntities);
        model.addAttribute("monthlyImages", userMonthlyImages);

        return "ViewUserExerciseDiet";
    }

}



//
//    @PostMapping("/updateUserProfile")
//    public String onUpdate(@RequestParam("thisfile") MultipartFile multipartFile,
//                           RegisterDto registerDto,
//                           Model model) throws IOException {
//
//        String filePath = null;
//
//        if (!multipartFile.isEmpty()) {
//            System.out.println(multipartFile);
//            System.out.println(multipartFile.getOriginalFilename());
//
//            byte[] bytes = multipartFile.getBytes();
//            Path path = Paths.get(ProfileImagePath.ProfileImagePath.getPath() + System.currentTimeMillis() + ".jpg");
//            Files.write(path, bytes);
//
//            filePath = path.getFileName().toString();
//        }
//        RegisterDto updatedValue = service.updateUserProfile(registerDto.getName(), registerDto, filePath);
//
//        if (updatedValue != null) {
//            // Fetch the updated user details
//            RegisterEntity entity = service.getAllRegistredUsersDetailsById(registerDto.getName(), registerDto.getAge());
//            model.addAttribute("register", entity);
////            model.addAttribute("picPaths", filePath);
//            return "UserProfile";
//        }
//        return "UserHome";
//    }




//    @GetMapping("/userProfile")
//    public String onUserProfile(HttpSession httpSession,Model model) {
//
//        RegisterEntity entity = service.getAllRegistredUsersDetailsById(registerDto.getName(),registerDto.getAge());
//
//        HttpSession httpsession = httpSession.getSession(true);
//        httpSession.setAttribute("register", entity);
//        httpSession.setAttribute("picPaths", filePath);
//
//        return "UserProfile";
//
//
//        RegisterEntity registrationEntity = (RegisterEntity) httpSession.getAttribute("userRegEntityHttp");
//        model.addAttribute("register",registrationEntity);
//        return "UserProfile";
//    }
