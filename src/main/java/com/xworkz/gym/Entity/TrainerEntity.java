package com.xworkz.gym.Entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name="trainerinfo_table")

@NamedQuery(name = "GetTrainerInfoList", query = "SELECT e FROM TrainerEntity e")

//@NamedQuery(name = "getAllTrainerDetails",query = "select a from TrainerEntity a")
//@NamedQuery(name = "deleteTrainerSlotById",query = "DELETE  from TrainerEntity a where a.id=:getId")
@NamedQuery(name = "getAllTrainerDetails", query = "select ta from TrainerEntity ta")
@NamedQuery(name = "deleteTrainerDetails", query = "delete from TrainerEntity ta where ta.id=: setId")
@NamedQuery(name = "getTrainerSlot", query = "select ta.slotTimings from TrainerEntity ta where ta.trainerName=: setName")

@NamedQuery(name = "getTrainerEntityById", query = "Select re from TrainerEntity re where re.id=:setId")
@NamedQuery(name = "getAllTrainerEntityDetails", query = "SELECT p FROM TrainerEntity p")

//--------------------------------------ren
@NamedQuery(name = "getTrainerList", query = "SELECT a FROM TrainerEntity a ORDER BY a.slotTimings DESC")
@NamedQuery(name = "getTrainerById", query = "select a from TrainerEntity a where a.id = :byId")

public class TrainerEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "name")
    private String trainerName;

    // @Column(name = "PhoneNumber")
    private String phoneNumber;

    @Column(name = "slotTimings")
    private String slotTimings;


}
