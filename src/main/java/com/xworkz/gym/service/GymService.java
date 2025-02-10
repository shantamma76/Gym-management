package com.xworkz.gym.service;

import com.xworkz.gym.DTO.EnquiryDto;
import com.xworkz.gym.DTO.RegisterDto;
import com.xworkz.gym.Entity.*;
import java.util.List;


public interface GymService {

    boolean getNameByEmail(String email, String password);  //read opration

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

    List<EnquiryEntity> getEnquiries();

    List<EnquiryEntity> getEnquiriesByStatus(String status);

    //view page
    boolean updateStatusAndReason(String name, String status, String reasons);

    boolean saveView(ViewEntity viewDto);

    List<ViewEntity> getAllFollowup(int id);

    //register
    boolean saveRegister(RegisterDto registerDto);

    boolean updateRegister(RegisterDto registerDto, String name, long phone);

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
    public List<SlotTimingsEntity> getAllslots();


    //trainer slot
    public boolean savetrainerdetails(String name, String phoneNumber, String slotTimings);
    public List<TrainerinfoEntity> getAlltrainerdetails();

    //delete
    boolean getDeleteTrainerById(int id);

    //update
    RegisterEntity getDetailsByEmail(String email);
    public boolean updateDetailsById(String packages, String trainer, String amount, int paid, double balance, double installment, int id);
}






