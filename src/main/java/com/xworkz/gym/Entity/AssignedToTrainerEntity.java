//package com.xworkz.gym.Entity;
//
//import lombok.Data;
//import lombok.NoArgsConstructor;
//
//import javax.persistence.*;
//
//@Entity
//@Table(name = "usersassignedtotrainer")
//@Data
//@NoArgsConstructor
//
////@NamedQuery(name = "getTrainerAndSlotByUserName",query = "select a from UsersAssignedToTrainerEntity a where a.userName=:getUserName")
////@NamedQuery(name = "getUsersAssignedToTrainerByTrainerName",query = "select a from UsersAssignedToTrainerEntity a where a.trainerName=:getTrainerName")
////@NamedQuery(name = "deleteUserAssignedToTrainer",query = "DELETE  from UsersAssignedToTrainerEntity a where a.trainerName=:getTrainerName")
//
//public class AssignedToTrainerEntity {
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    private int id;
//    private String trainerName;
//    private String userName;
//    private String slot;
//
//    public AssignedToTrainerEntity(String trainerName,String userName,String slot) {
//        this.trainerName = trainerName;
//        this.userName = userName;
//        this.slot=slot;
//    }
//
//}