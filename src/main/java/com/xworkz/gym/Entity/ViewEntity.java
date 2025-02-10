package com.xworkz.gym.Entity;



import lombok.*;

import javax.persistence.*;


//@Getter
//@Setter
//@EqualsAndHashCode
@Data
@Entity
@RequiredArgsConstructor

@Table(name="view_table")
@NamedQuery(name = "getAllData", query = "SELECT e FROM ViewEntity e WHERE e.enquiryEntity.id = :setEnquiryId")
public class ViewEntity extends AbstractAuditEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "view_id")
    private int followUpViewId;
    private String name;
    private String area;
    private long phone;
    private String reasons;

    @ManyToOne
    @JoinColumn(name ="id" ,referencedColumnName ="id")
    private EnquiryEntity enquiryEntity;


}
