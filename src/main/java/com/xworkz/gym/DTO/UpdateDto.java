package com.xworkz.gym.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
public class UpdateDto {

        private int id;
        private String name;
        private long phone;
        private String packages;
        private String trainer;
        private int amount;
        private int balance;

}

