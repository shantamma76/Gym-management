package com.xworkz.gym.Entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name="dietandexercisetable")
@Data
@RequiredArgsConstructor
public class DietEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name="User_Name")
    private String name;

    @Column(name="User_Age")
    private int age;
    private String fitnessGoal;
    private String dietPlan;
    private String exercisePlan;


}
