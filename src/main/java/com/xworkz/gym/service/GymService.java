package com.xworkz.gym.service;

import com.xworkz.gym.DTO.AssignTrainersDto;
import com.xworkz.gym.DTO.DietDto;
import com.xworkz.gym.DTO.EnquiryDto;
import com.xworkz.gym.DTO.RegisterDto;
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

    //update register details
    RegisterEntity getDetailsByEmail(String email);
    public boolean updateDetailsById(String packages, String trainer, String amount, int paid, double balance, double installment, int id);

    // boolean updateRegister(RegisterDto registerDto, String name, long phone);

    //sending mail to users
    boolean sendEmail(String email, String password);

    //----------------user login--------------------
    RegisterEntity getEmail(String email, String password);
    String resetPassword(String email, String oldPassword, String newPassword, String confirmPassword);

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


  //  boolean updateTrainerToUSer(String name, String trainerName, String slotTimings);



    //=======ar======

   // List<RegisterEntity> getCustomrtDetailsWithTrainer();
    //RegisterEntity getDatabyIdToAssigntrainer(int id, String trainer);

    //==========Assign trainers to users========
    List<RegisterEntity> getAllRegiDetails();    //getting data from register details
    List<TrainerEntity> getTrainerDetails();    //getting data from TrainerEntity
    TrainerEntity getByIdToAssignTrainer(int id, String trainerName, String slotTimings);
    boolean saveTrainerAssignDetails(AssignTrainersDto assignTrainersDto);

    boolean saveDietAndExercise(DietDto dietDto);

    List<EnquiryEntity> getAllEnquiry();
    String getPhoneNumberByName(String name);




}






