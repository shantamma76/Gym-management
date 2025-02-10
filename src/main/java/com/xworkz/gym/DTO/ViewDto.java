package com.xworkz.gym.DTO;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor

public class ViewDto {

    private int followUpViewId;
    private String name;
    private String area;
    private long phone;
    private String reasons;


}
