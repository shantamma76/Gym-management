package com.xworkz.gym.Entity;

import lombok.Data;
import javax.persistence.*;

@Entity
@Data
@Table(name="gym_name")

@NamedQuery(name="getAllGymDetails", query = "select a from AddGymEntity a")
public class AddGymEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String gymName;

    @Column(name="owner_name")
    private String ownerName;

    private String location;


}
