package com.xworkz.gym.Entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;

@MappedSuperclass
@Data
public class AbstractAuditEntity implements Serializable {

    @Column(name="updated_date")
    private LocalDateTime updatedOn;

}




