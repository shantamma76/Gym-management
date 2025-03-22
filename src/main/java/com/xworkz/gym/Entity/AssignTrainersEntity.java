package com.xworkz.gym.Entity;

import lombok.Data;

import javax.persistence.*;


@Data
@Entity
@Table(name = "assigntrainertouser")

@NamedQuery(name = "getTrainerAndSlotByUserName",query = "select a from AssignTrainersEntity a where a.name=:getUserName")
//@NamedQuery(name = "getUsersAssignedToTrainerByTrainerName",query = "select a from AssignTrainersEntity a where a.trainerName=:getTrainerName")

@NamedQuery(name = "getUsersAssignedToTrainerByTrainerName",query = "select a from AssignTrainersEntity a where a.trainerName=:getTrainerName")
@NamedQuery(name="getAllAssignTrainerDetails",query = "select a from AssignTrainersEntity a")
public class AssignTrainersEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "userName")
    private String name;

    @Column(name = "trainer_name")
    private String trainerName;

    @Column(name = "slots")
    private String slotTimings;


}
