package com.xworkz.gym.Entity;

import lombok.*;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Data
//@Getter
//@Setter
//@EqualsAndHashCode
@NoArgsConstructor
@Table(name="enquiry_table")
@NamedQuery(name="countByName", query = "select count(e) from EnquiryEntity e where e.name = :setName")
@NamedQuery(name="countByArea", query = "select count(e) from EnquiryEntity e where e.area = :setArea")
@NamedQuery(name="countPhoneBy", query = "select count(e) from EnquiryEntity e where e.phone = :setPhone")
@NamedQuery(name="countByDistance", query = "select count(e) from EnquiryEntity e where e.distance = :setDistance")
@NamedQuery(name="countByAge", query = "select count(e) from EnquiryEntity e where e.age = :setAge")

public class EnquiryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String area;
    private long phone;
    private int distance;
    private int age;

    private String status;
    private String reasons;

//    @OneToMany(mappedBy = "enquiryEntity")
//    private List<ViewEntity> followUpViewEntities = new ArrayList<>();

 }





