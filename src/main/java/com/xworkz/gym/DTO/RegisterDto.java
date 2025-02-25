package com.xworkz.gym.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RegisterDto {

    private String name;
    private String email;
    //private String password;
    private int age;
    private String packages;
    private String trainer;
    private long phone;
    private String gymName;
    private String amount;
    private String discount;
    private int paid;
    private double balance;
    private double installment;
   // private int loginCount;

    private int height;
    private int weight;



}

