package com.xworkz.gym.service;

import com.xworkz.gym.DTO.*;
import com.xworkz.gym.Entity.*;
import java.util.List;


public interface GymService {

    //admin
    boolean getNameByEmail(String email, String password);  //read opration

    //save enquiry details
    boolean saveEnquiry(EnquiryDto enquiryDto);

    Long countEmail(String email); //admin ajax validation

    Long countPassword(String password);

    Long countName(String name);

    Long countArea(String area);

    Long countPhone(long phone);

    Long countDistance(int distance);

    Long countAge(int age);

    Long countNameBy(String name); //for register ajax validation

    Long countByEmail(String email);

    Long countByTrainer(String trainer);

    Long countByPhone(long phone);

    Long countByGymName(String gymName);

    //enquiry
    List<EnquiryEntity> getEnquiries();
    List<EnquiryEntity> getEnquiriesByStatus(String status);

    //view page
    boolean updateStatusAndReason(String name, String status, String reasons);
    List<ViewEntity> getAllFollowup(int id);
    boolean saveView(ViewEntity viewDto);


    //register
    boolean saveRegister(RegisterDto registerDto);
    //dropdown enquiry names in register
    List<EnquiryEntity> getAllEnquiry();
    String getPhoneNumberByName(String name);

    //update register details
    RegisterEntity getDetailsByEmail(String email);
    public boolean updateDetailsById(String packages, String trainer, String amount, int paid, double balance, double installment, int id);

    // boolean updateRegister(RegisterDto registerDto, String name, long phone);

    //sending mail to users
    boolean sendEmail(String email, String password);

    //----------------user login--------------------
    RegisterEntity getEmail(String email, String password);
    String resetPassword(String email, String oldPassword, String newPassword, String confirmPassword);

    //forget password
    String resetPasswordByEmail(String email,String newPassword,String confirmPassword);

    //Update Profile
    List<RegisterEntity> getAllRegisteredUserDetailsById(int id);
    RegisterDto updateUserProfile(String name,RegisterDto registrationDTO, String filePath);

    //-------------time slot-----------------
    public boolean saveSlots(String startTimings, String endTimings, String duration);
    public List<SlotsEntity> getAllslots();

    //trainer slot
    public boolean savetrainerdetails(String trainerName, String phoneNumber, String slotTimings);
    public List<TrainerEntity> getAlltrainerdetails();

    //delete
    boolean getDeleteTrainerById(int id);



    //==========Assign trainers to users frm me========
    List<RegisterEntity> getAllRegiDetails();    //getting data from register details

    //=============for assign trainers and slots working========================================================================
    List<RegisterEntity> assignSlot();
    List<TrainerEntity> getTrainerDetails();
    List<SlotsEntity> getTimeSlot();
    RegisterEntity searchDetails(String name,String email);
    boolean updateSlot(int entityId, int trainerId);

   // public RegisterEntity getNamesStartingWith(String prefix);


    //-----------------------diet plane frm cha-------------------
    public List<RegisterEntity> getAllRegistredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo);
    void saveUserDietAndExercise(int id, String filePath, UserExerciseAndDietDTO userExerciseAndDietDTO);

    List<UserUpdatedExerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id);
    List<UserExerciseAndDietEntity> getuserMonthlyImages(int id);

    //----user profile
    RegisterEntity getAllRegistredUsersDetailsById(String name);
    public AssignTrainersEntity getTrainerAndSlotByUserName(String name);


}






