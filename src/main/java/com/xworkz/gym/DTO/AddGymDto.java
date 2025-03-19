package com.xworkz.gym.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;

@Data
@NoArgsConstructor
public class AddGymDto {

    private String gymName;
    private String ownerName;
    private String location;

}



