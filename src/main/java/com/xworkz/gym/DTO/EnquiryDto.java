package com.xworkz.gym.DTO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class EnquiryDto {

    private String name;
    private String email;
    private String area;
    private long phone;
    private int distance;
    private int age;

}
