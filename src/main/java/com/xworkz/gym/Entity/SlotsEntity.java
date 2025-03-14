package com.xworkz.gym.Entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "trainerslot_table")

@NamedQuery(name = "GetslotList", query = "SELECT e FROM SlotsEntity e")
@NamedQuery(name = "getTimeSlotEntity",query = "SELECT a FROM SlotsEntity a")
public class SlotsEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "startTimings")
    private String startTimings;

    @Column(name = "endTimings")
    private String endTimings;

    private String duration;




}
