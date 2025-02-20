package com.xworkz.gym.Entity;

import lombok.Data;


import javax.persistence.*;

@Data
@Entity
@Table(name="assignTrainerToUser")
public class AssignTrainersEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "userName")
    private String name;

    @Column(name="trainer_name")
    private String trainerName;

    @Column(name = "slots")
    private String slotTimings;


}
