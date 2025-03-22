package com.xworkz.gym.service;

import com.xworkz.gym.DTO.*;
import com.xworkz.gym.Entity.*;
import com.xworkz.gym.constants.StatusEnum;
import com.xworkz.gym.repository.GymRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.Random;


@Slf4j
@Service
public class GymServiceImpl implements GymService {

    @Autowired
    private GymRepository repository;

    @Override
    public Long countEmail(String email) {
        return repository.countEmail(email);
    }

    @Override
    public Long countPassword(String password) {
        return repository.countPassword(password);
    }

    @Override
    public Long countName(String name) {
        return repository.countName(name);
    }

    @Override
    public Long countArea(String area) {
        return repository.countArea(area);
    }

    @Override
    public Long countPhone(long phone) {
        return repository.countPhone(phone);
    }

    @Override
    public Long countDistance(int distance) {
        return repository.countDistance(distance);
    }

    @Override
    public Long countAge(int age) {
        return repository.countAge(age);
    }

    @Override
    public Long countNameBy(String name) {
        return repository.countNameBy(name);
    }

    @Override
    public Long countByEmail(String email) {
        return repository.countByEmail(email);
    }

    @Override
    public Long countByTrainer(String trainer) {
        return repository.countByTrainer(trainer);
    }

    @Override
    public Long countByPhone(long phone) {
        return repository.countByPhone(phone);
    }

    @Override
    public Long countByGymName(String gymName) {
        return repository.countByGymName(gymName);
    }

    @Override
    public List<EnquiryEntity> getEnquiries() {
        return repository.findAll();
    }

    @Override
    public List<EnquiryEntity> getEnquiriesByStatus(String status) {
        return repository.findByStatus(status);
    }

    @Override
    public boolean updateStatusAndReason(String name, String status, String reasons) {
        System.out.println("updateStatusAndReason in GymServiceImpl");

        boolean saved = repository.updateStatusAndReason(name, status, reasons);
        EnquiryEntity enquiryEntity = repository.getEnquiryEntityByName(name);
        EnquiryEntity enquiry = new EnquiryEntity();
        System.out.println("EnquiryEntity in updateStatusAndReason:" + enquiryEntity);
        ViewEntity viewEntity = new ViewEntity();
        viewEntity.setName(enquiryEntity.getName());
        viewEntity.setArea(enquiryEntity.getArea());
        viewEntity.setPhone(enquiryEntity.getPhone());
        viewEntity.setReasons(reasons);
        enquiry.setId(enquiryEntity.getId());
        viewEntity.setEnquiryEntity(enquiry);
        viewEntity.setUpdatedOn(LocalDateTime.now());
        saveView(viewEntity);
        if (saved)
            return true;

        return false;
    }

    @Override
    public boolean saveView(ViewEntity viewEntity) {
        log.info("saveView in ServiceImpl");
        boolean saved = repository.saveView(viewEntity);
        if (saved) {
            System.out.println("savedView is saved");
            return true;
        }
        System.out.println("this is not saved");
        return false;
    }

    @Override
    public List<ViewEntity> getAllFollowup(int id) {
        System.out.println("getAllFollowup in serviceImpl:" + repository.getAllData(id));
        return repository.getAllData(id);
    }


    //-------------------------------------------------------------------------
    //admin

    @Override
    public boolean getNameByEmail(String email, String password) {
        log.info("Checking credentials for email: {}", email);
        AdminEntity adminentity = repository.adminentity(email);
        System.out.println("................." + adminentity);
        if (adminentity.getEmail().equals(email) && adminentity.getPassword().equals(password)) {
            return true;
        }
        return false;
    }

    @Override
    public boolean saveEnquiry(EnquiryDto enquiryDto) {
        log.info("Saving enquiry for: {}", enquiryDto.getName());

        if (enquiryDto == null) {
            log.warn("Enquiry data is null!");
            return false;
        }
        EnquiryEntity entity = new EnquiryEntity();
        System.out.println("======enquiry=====:" + entity);
        entity.setName(enquiryDto.getName());
        entity.setEmail(enquiryDto.getEmail());
        entity.setArea(enquiryDto.getArea());
        entity.setPhone(enquiryDto.getPhone());
        entity.setDistance(enquiryDto.getDistance());
        entity.setAge(enquiryDto.getAge());
        entity.setStatus(StatusEnum.Enquired.name());


        boolean enquirySaved = repository.saveEnquiry(entity);

        if (enquirySaved) {
            log.info("Enquiry data saved successfully");
            return true;
        } else {
            log.warn("Failed to save enquiry data");
            return false;
        }
    }


    @Override
    public boolean saveRegister(RegisterDto registerDto) {
        log.info("Registering user:", registerDto.getName());

        if (registerDto == null) {
            log.warn("Register data is null!");
            return false;
        }
        RegisterEntity entity = new RegisterEntity();
        entity.setName(registerDto.getName());
        entity.setEmail(registerDto.getEmail());
        entity.setAge(registerDto.getAge());
        entity.setPackages(registerDto.getPackages());
        entity.setTrainer(registerDto.getTrainer());
        entity.setPhone(registerDto.getPhone());
        entity.setAmount(registerDto.getAmount());
        entity.setDiscount(registerDto.getDiscount());
        entity.setGymName(registerDto.getGymName());
        entity.setPaid(registerDto.getPaid());
        entity.setBalance(registerDto.getBalance());
        entity.setInstallment(registerDto.getInstallment());
        entity.setLoginCount(-1);

        String generatedPassword = generateRandomPassword();
        entity.setPassword(generatedPassword);

        boolean isSaved = repository.saveRegister(entity);
        if (isSaved) {
            sendEmail(registerDto.getEmail(), generatedPassword);
            return true;
        }
        return false;
    }


    private String generateRandomPassword() {
        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        Random random = new Random();
        StringBuilder password = new StringBuilder();

        for (int i = 0; i < 8; i++) {
            password.append(characters.charAt(random.nextInt(characters.length())));
        }
        return password.toString();
    }

    @Override
    public boolean sendEmail(String email, String password) {
        log.info("Sending password email to {}", email);

        final String senderEmail = "siraganshantamma@gmail.com";
        final String senderPassword = "hhae fwza swyx wlyb";

        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(prop, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(senderEmail, senderPassword);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(senderEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Your Gym Account Password");
            message.setText("Your password: " + password);
            Transport.send(message);

            log.info("Password email sent successfully to {}", email);
            return true;
        } catch (MessagingException e) {
            log.error("Failed to send email", e);
            return false;
        }
    }

    //update register details
    @Override
    public RegisterEntity getDetailsByEmail(String email) {
        return repository.findByEmailCustom(email);

    }

    @Override
    public boolean updateDetailsById(String packages, String amount, int paid, double balance, double installment, String name) {
        repository.updateValuesById(packages, amount, paid, balance, installment, name);
        return true;
    }
//    @Override
//    public boolean updateRegister(RegisterDto registerDto, String name, long phone) {
//        //log.info("Updating registration details for: {}", name);
//        System.out.println("==========update Registration============");
//        RegisterEntity entity = repository.updateRegister(name, phone);
//
//        if (entity != null) {
//            entity.setPackages(registerDto.getPackages());
//            entity.setPhone(registerDto.getPhone());
//            entity.setTrainer(registerDto.getTrainer());
//            entity.setAmount(registerDto.getAmount());
//            entity.setBalance(registerDto.getBalance());
//
//            repository.saveRegister(entity);
//            return true;
//        }
//
//        log.warn("Failed to update registration details for {}", name);
//        return false;
//    }

    //------------------------------user login--------------------------------------------
    @Override
    public RegisterEntity getEmail(String email, String password) {
        System.out.println("==========getEmail in serviceImpl================");
        RegisterEntity entity = repository.userSave(email);
        System.out.println("===== in Service=======:" + entity);
//        return res;
        if (entity != null) {
            System.out.println("====================:" + entity.toString());
            if (password.equals(entity.getPassword()) && entity.getLoginCount() == -1) {
                System.err.println("===============matches==================");
                return entity;
            } else if (!(password.equals(entity.getPassword())) && (entity.getLoginCount() >= 0 && entity.getLoginCount() < 3)) {
                repository.updateCount(email, entity.getLoginCount());
                System.out.println("password entered is wrong===================");
                return null;
            } else if (!(password.equals(entity.getPassword())) && entity.getLoginCount() == 3) {
                System.out.println("locked");
                if (entity.getAccountLockedTime() == null) repository.updateLockedAccountTimeByEmail(email);
                return null;
            } else if (password.equals(entity.getPassword()) && (entity.getLoginCount() < 3 && entity.getLoginCount() > -1)) {
                boolean reset = repository.resetCount(email, entity.getLoginCount());
                if (reset) return entity;
                else return null;
            }
        }
        return null;
    }

    @Override
    public String resetPassword(String email, String oldPassword, String newPassword, String confirmPassword) {

        System.out.println("reset password in service");
        if (newPassword.equals(confirmPassword)) {
            //repository.getEmail(email);
            String msg = repository.updatePasswordByEmail(email, newPassword);
        }
        return "password updated successfully";
    }

    //forget Password
    @Override
    public String resetPasswordByEmail(String email, String newPassword, String confirmPassword) {
        System.out.println("reset password in service");
        if (newPassword.equals(confirmPassword)) {
            repository.userSave(email);
            return repository.resetPasswordByEmail(email, newPassword);
        }
        return "password updated successfully";
    }

    //------------------profile------------------------trial
    @Override
    public List<RegisterEntity> getAllRegisteredUserDetailsById(int id) {

        return repository.getAllRegisteredUserDetailsById(id);
    }

    @Override
    public RegisterDto updateUserProfile(String name, RegisterDto registerDto, String filePath) {
        return repository.updateUserProfile(name, registerDto, filePath);
    }

//    @Override
//    public RegisterDto updateUserProfile(int id, RegisterDto registerDto, String filePath) {
//        return repository.updateUserProfile(id, registerDto, filePath);
//    }

    //------time slot----
    @Override
    public boolean saveSlots(String startTimings, String endTimings, String duration) {
        SlotsEntity entity = new SlotsEntity();
        entity.setStartTimings(startTimings);
        entity.setEndTimings(endTimings);
        entity.setDuration(duration);
        return repository.saveSlots(entity);
    }

    @Override
    public List<SlotsEntity> getAllslots() {
        return repository.findallslots();
    }

    @Override
    public boolean savetrainerdetails(String trainerName, String phoneNumber, String slotTimings) {

        TrainerEntity entity = new TrainerEntity();
        entity.setTrainerName(trainerName);
        entity.setPhoneNumber(phoneNumber);
        entity.setSlotTimings(slotTimings);
        return repository.savetrainerdetails(entity);
    }

    @Override
    public List<TrainerEntity> getAlltrainerdetails() {
        return repository.findAlltrainerlist();

    }

    //delete
    @Override
    public boolean getDeleteTrainerById(int id) {
        return repository.getDeleteTrainerById(id);
    }


//-------------------Assign trainer to user-----------------

    //getting data from register details
    @Override
    public List<RegisterEntity> getAllRegiDetails() {
        System.out.println("----------------------get alla details in ServiceImpl- --------------");
        return repository.getAllRegiDetails();
    }


    //fetching all names from EnquiryEntity in register
    @Override
    public List<EnquiryEntity> getAllEnquiry() {
        System.out.println("----------------------get alla details in ServiceImpl- --------------");
        if ((repository.getAllEnquiry() != null)) {
            return repository.getAllEnquiry();
        }
        return Collections.emptyList();
    }

    @Override
    public String getPhoneNumberByName(String name) {
        System.out.println("======getPhoneNumberByName in service=======");
        String num = repository.getPhoneNumberByName(name);
        return num;
    }


    @Override
    public String getEmailByName(String name) {
        System.out.println("======getPhoneNumberByName in service=======");
        String mail = repository.getEmailByName(name);
        return mail;
    }

//--------------------------------------trail frm ren------------------------------------------


    @Override
    public List<RegisterEntity> assignSlot() {

        List<RegisterEntity> retrive = repository.assignSlot();
        return retrive;
    }


    @Override
    public List<TrainerEntity> getTrainerDetails() {
        List<TrainerEntity> retrive = repository.getTrainerDetails();
        return retrive;
    }

    @Override
    public List<SlotsEntity> getTimeSlot() {

        List<SlotsEntity> retrive = repository.getTimeSlot();
        return retrive;
    }

    @Override
    public RegisterEntity searchDetails(String name, String email) {

        log.info("search in service");

        RegisterEntity entity = repository.searchDetails(name, email);
        return entity;
    }

//


    //trial frm me
//    @Override
//    public RegisterEntity getNamesStartingWith(String prefix) {
//      System.out.println("============service============");
//        return repository.findNamesByPrefix(prefix);  // Example method to get names by prefix
//    }


    //diet plan
    @Override
    public List<RegisterEntity> getAllRegistredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhone) {
        return repository.getAllRegistredUsersDetailsByNameAndPhoneNo(searchName, searchPhone);
    }

    @Override
    public void saveUserDietAndExercise(int id, String filePath, UserExerciseAndDietDTO userExerciseAndDietDTO) {
//copy utils: BEanUtils.copy
        UserExerciseAndDietEntity entity = new UserExerciseAndDietEntity();
        entity.setId(id);
        entity.setMonday(userExerciseAndDietDTO.getMonday());
        entity.setTuesday(userExerciseAndDietDTO.getTuesday());
        entity.setWednesday(userExerciseAndDietDTO.getWednesday());
        entity.setThursday(userExerciseAndDietDTO.getThursday());
        entity.setFriday(userExerciseAndDietDTO.getFriday());
        entity.setSaturday(userExerciseAndDietDTO.getSaturday());
        entity.setSunday(userExerciseAndDietDTO.getSunday());
        entity.setMonth(userExerciseAndDietDTO.getMonth());
        entity.setDietPlan(userExerciseAndDietDTO.getDietPlan());
        entity.setUsermonthlyImage(filePath);
        repository.saveUserDietAndExercise(entity);

        UserUpdatedExerciseAndDietEntity userUpdatedExerciseAndDietEntity = new UserUpdatedExerciseAndDietEntity();
        userUpdatedExerciseAndDietEntity.setId(id);
        userUpdatedExerciseAndDietEntity.setMonday(userExerciseAndDietDTO.getMonday());
        userUpdatedExerciseAndDietEntity.setTuesday(userExerciseAndDietDTO.getTuesday());
        userUpdatedExerciseAndDietEntity.setWednesday(userExerciseAndDietDTO.getWednesday());
        userUpdatedExerciseAndDietEntity.setThursday(userExerciseAndDietDTO.getThursday());
        userUpdatedExerciseAndDietEntity.setFriday(userExerciseAndDietDTO.getFriday());
        userUpdatedExerciseAndDietEntity.setSaturday(userExerciseAndDietDTO.getSaturday());
        userUpdatedExerciseAndDietEntity.setSunday(userExerciseAndDietDTO.getSunday());
        userUpdatedExerciseAndDietEntity.setMonth(userExerciseAndDietDTO.getMonth());
        userUpdatedExerciseAndDietEntity.setDietPlan(userExerciseAndDietDTO.getDietPlan());
        userUpdatedExerciseAndDietEntity.setUsermonthlyImage(filePath);
        repository.saveUserUpdatedDietAndExercise(userUpdatedExerciseAndDietEntity);
    }

    @Override
    public List<UserUpdatedExerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id) {
        System.out.println("=======getAlluserExerciseAndDietEntitiesById in service======");
        return repository.getAlluserExerciseAndDietEntitiesById(id);
    }

    @Override
    public List<UserExerciseAndDietEntity> getuserMonthlyImages(int id) {
        return repository.getuserMonthlyImages(id);
    }


    @Override
    public RegisterEntity getAllRegistredUsersDetailsById(String name, int age) {
        return repository.getAllRegistredUsersDetailsById(name, age);
    }

    @Override
    public AssignTrainersEntity getTrainerAndSlotByUserName(String name) {
        return repository.getTrainerAndSlotByUserName(name);
    }

    @Override
    public boolean saveGymDetails(AddGymDto addGymDto) {
        AddGymEntity entity = new AddGymEntity();
        entity.setGymName(addGymDto.getGymName());
        entity.setOwnerName(addGymDto.getOwnerName());
        entity.setLocation(addGymDto.getLocation());

        boolean saved = repository.saveGymDetails(entity);
        if (saved) {
            System.out.println("this is saved");
            return true;
        }
        System.out.println("this is not saved");
        return false;
    }

    @Override
    public List<AddGymEntity> getAllGymDetails() {
        System.out.println("getAllGymDetails in service");
        return repository.getAllGymDetails();

    }

    @Override
    public List<AssignTrainersEntity> getAllAssignTrainer() {
        System.out.println("getAllAssignTrainer in serviceImpl");
        return repository.getAllAssignTrainer();
    }

    //pagination in update-----------------------------------------------
    @Override
    public List<RegisterEntity> getAllRegiDetails(int page, int size) {
        // Pass the page and size to the repository for pagination
        return repository.getAllRegiDetails(page, size);
    }

    @Override
    public int getTotalPages(int size) {
        // Calculate total number of pages based on the total count and page size
        int totalCount = repository.getTotalRegisterCount();
        return (int) Math.ceil((double) totalCount / size);
    }

    //pagination in view register details------------------
    @Override
    public List<RegisterEntity> getAllRegisterDetails(int startIndex, int pageSize) {
        System.out.println("----------------------get paginated details in ServiceImpl- --------------");
        return repository.getAllRegisterDetails(startIndex, pageSize);
    }

    @Override
    public long getTotalRecords() {
        return repository.getTotalRecords();
    }

//    @Override
//    public boolean saveAssignTrainer(AssignTrainersDto assignTrainersDto) {
//        return false;
//    }

    @Override
    public String getNameById(int id) {
        System.out.println("===== ---getNameById--- =====:");
        return repository.getNamesById(id);
    }

    @Override
    public TrainerEntity getTrainerDetailsById(int id) {
        return null;
    }

    @Override
    public boolean saveAssignTrainer(int entityId, int tarinerId) {
        System.out.println("Save Assign Trainer in ServiceImpl");

        AssignTrainersEntity entity = new AssignTrainersEntity();
        System.out.println("================:" + entity);
        entity.setName(entity.getName());
        entity.setTrainerName(entity.getTrainerName());
        entity.setSlotTimings(entity.getSlotTimings());

        String saved = repository.getNamesById(entityId);
        System.out.println("===========:" + saved);

        return false;
    }

    @Override
    public boolean saveTrainer(AssignTrainersDto assignTrainersDto) {
        System.out.println("=---------------------serviceImpl----------------------------===");
        AssignTrainersEntity entity = new AssignTrainersEntity();
        System.out.println("======entity in service ====:"+entity);
        entity.setName(assignTrainersDto.getName());
        entity.setTrainerName(assignTrainersDto.getTrainerName());
        entity.setSlotTimings(assignTrainersDto.getSlotTimings());
        return repository.saveTrainer(entity);
    }


}







    //==========================

//    @Override
//    public void assignUsersToTrainer(String trainerName, List<String> userNames, String slot) {
//        for (String username : userNames) {
//
//          UsersAssignedToTrainerEntity trainerUser = new UsersAssignedToTrainerEntity(trainerName, username, slot);
//            repository.saveAssignUsersToTrainer(trainerUser);
//        }
//
//    }






    //===================================================================
//    @Override
//    public void saveTrainerDetails(TrainerDTO trainerDTO) {
//
//        TrainerEntity trainerEntity=new TrainerEntity();
//        trainerEntity.setTrainerName(trainerDTO.getTrainerName());
//        trainerEntity.setPhoneNumber(trainerDTO.getPhoneNumber());
//        trainerEntity.setSlotTime(trainerDTO.getTrainerDropdown());
//        System.out.println(trainerEntity);
//
//        repository.saveTrainerDetails(trainerEntity);
//    }
//
//    @Override
//    public void saveslots(String startTime, String endTime, String duration) {
//        SlotsEntity entity =new SlotsEntity();
//        entity.setStartTime(startTime);
//        entity.setEndTime(endTime);
//        entity.setDuration(duration);
//        repository.saveslots(entity);
//    }
//
//    @Override
//    public List<SlotsEntity> getAllSlotsDetails() {
//
//        return repository.getAllSlotsDetails();
//    }
//
//    @Override
//    public List<TrainerEntity> getAllTrainerDetails() {
//
//        return repository.getAllTrainerDetails();
//    }
//
//    @Override
//    public int deleteSlotById(int idForDelete) {
//        return repository.deleteSlotById(idForDelete);
//    }
//
//    @Override
//    public void assignUsersToTrainer(String trainerName, List<String> userNames,String slot) {
//        for (String username : userNames) {
//            UsersAssignedToTrainerEntity trainerUser = new UsersAssignedToTrainerEntity(trainerName, username,slot);
//            repository.saveAssignUsersToTrainer(trainerUser);
//        }
//    }
//
//    @Override
//    public int deleteTrainerSlot(int trainerId) {
//        return repository.deleteTrainerSlot(trainerId);
//    }
//
//    @Override
//    public UsersAssignedToTrainerEntity getTrainerAndSlotByUserName(String name) {
//        return  repository.getTrainerAndSlotByUserName(name);
//    }
//
//    @Override
//    public List<UsersAssignedToTrainerEntity> getUsersAssignedToTrainerByTrainerName(String trainerName) {
//        return  repository.getUsersAssignedToTrainerByTrainerName(trainerName);
//    }
//
//    @Override
//    public int deleteUserAssignedToTrainer(String trainerName) {
//        return repository.deleteUserAssignedToTrainer(trainerName);
//    }
//
//    @Override
//    public List<RegisterEntity> getAllRegistredUsersDetails() {
//        return repository.getAllRegistredUsersDetails();
//    }









