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

@NamedQuery(name="getAllDetailsOfEnquiry",query = "select e from EnquiryEntity e")

//getting joined names only in register page
@NamedQuery(name = "getJoiningNamesOnly", query = "SELECT e.name FROM EnquiryEntity e WHERE e.reasons = 'joining'")
//when name is select that time phone and email will automatically populated in registerPage
@NamedQuery(name="getPhoneNoByName", query = "select p.phone from EnquiryEntity p where p.name = :setName")
@NamedQuery(name="getEmailAddByName", query = "SELECT p.email FROM EnquiryEntity p WHERE p.name = :byName")

@NamedQuery(name="getPhone",query  ="select p.phone from EnquiryEntity p where p.name = :byName")
public class EnquiryEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String email;
    private String area;
    private long phone;
    private int distance;
    private int age;

    private String status;
    private String reasons;

//    @OneToMany(mappedBy = "enquiryEntity")
//    private List<ViewEntity> followUpViewEntities = new ArrayList<>();

 }





