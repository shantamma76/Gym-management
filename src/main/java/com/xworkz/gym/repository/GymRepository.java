package com.xworkz.gym.repository;

import com.xworkz.gym.DTO.RegisterDto;
import com.xworkz.gym.Entity.*;

import java.util.List;

public interface GymRepository {

    boolean getNameByEmail(String email, String password); //admin login

    boolean saveEnquiry(EnquiryEntity enquiryEntity);//for enquiry form

    //For admin ajax validation
    Long countEmail(String email);

    Long countPassword(String password);

    //For enquiry ajax validation
    Long countName(String name);   //for Enquiry ajax validation

    Long countArea(String area);

    Long countPhone(long phone);

    Long countDistance(int distance);

    Long countAge(int age);

    // For Register ajax validation
    Long countNameBy(String name); //for register ajax validation
    Long countByEmail(String email);
    Long countByTrainer(String trainer);
    Long countByPhone(long phone);
    Long countByGymName(String gymName);

    //followUp
    List<EnquiryEntity> findAll();
    List<EnquiryEntity> findByStatus(String status);
    boolean updateStatusAndReason(String name, String status, String reasons);

    //Registration
    boolean saveRegister(RegisterEntity registerEntity);
    //update register
    public RegisterEntity findByEmailCustom(String email);
    public boolean updateValuesById(String packages, String trainer, String amount, int paid, double balance, double installment, int id);

    //public RegisterEntity updateRegister(String name, long phone);

    //viewpage
    EnquiryEntity getEnquiryEntityByName(String name);
    boolean saveView(ViewEntity viewEntity);
    List<ViewEntity> getAllData(int id); //viewDetails

    //-------------------------user login-----------------------------------
    RegisterEntity userSave(String email);

    void updateCount(String email, int count);
    boolean resetCount(String email, int count);
    String updatePasswordByEmail(String email, String newPassword);
    String updateLockedAccountTimeByEmail(String email);

    //------------------Update Profile---------------------------
    List<RegisterEntity> getAllRegisteredUserDetailsById(int id);
    RegisterDto updateUserProfile(String name, RegisterDto registrationDTO, String filePath);

    //----time slot-----
    public boolean saveSlots(SlotsEntity slotTimings);
    List<SlotsEntity> findallslots();

    //--trainer slot-----
    boolean savetrainerdetails(TrainerEntity entity);
    List<TrainerEntity> findAlltrainerlist();

    //delete slot
    public boolean getDeleteTrainerById(int id);

    //----------------------------------------------
    //RegisterEntity getDataById(int id);
    //boolean updateEntity(RegisterEntity entity);
    //List<RegisterEntity> getCustomrtDetailsWithTrainer();

    //--------------meeeeeeeeee--------------------------
    List<RegisterEntity> getAllRegiDetails();
    List<TrainerEntity> getTrainerDetails();

    TrainerEntity getDataByTrainerId(int id);
    boolean updateTrainerEntity(TrainerEntity entity);

    boolean saveTrainerAssignDetails(AssignTrainersEntity assignTrainersEntity);

    boolean saveDietAndExercise(DietEntity dietEntity);

    List<EnquiryEntity> getAllEnquiry();
    String getPhoneNumberByName(String name);

    //========================
    public void updateUserDetails(RegisterEntity registerEntity);

}



