package com.xworkz.gym.Entity;

import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data

@Entity
@Getter
@Setter
@Table(name = "register_table")

@NamedQuery(name = "updatedDetailsByName", query = "UPDATE RegisterEntity p SET p.packages = :packagesBy, p.trainer = :trainerBy, p.amount = :amountBy, p.balance = :balanceBy WHERE p.name = :nameBy")

@NamedQuery(name = "countNameBy", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.name = :setName")
@NamedQuery(name = "countByEmail", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.email = :setEmail")
@NamedQuery(name = "countByTrainer", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.trainer = :setTrainer")
@NamedQuery(name = "countByPhone", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.phone = :phoneBy")
@NamedQuery(name = "countByGymName", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.gymName = :setGymName")
@NamedQuery(name = "countByPaid", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.paid = :setPaid")
@NamedQuery(name = "countByInstallment", query = "SELECT COUNT(e) FROM RegisterEntity e WHERE e.installment = :setInstallment")

//===========user----
@NamedQuery(name= "getAllByEmail", query = "select ls from RegisterEntity ls where ls.email = :byEmail")
@NamedQuery(name = "resetCount", query = "UPDATE RegisterEntity p SET p.loginCount = :setLoginCount WHERE p.email = :byEmail")
@NamedQuery(name = "updateCount", query="update RegisterEntity ls set ls.loginCount = :setResetStatus where ls.email =: byEmail")

//count
@NamedQuery(name="updatePasswordByEmail", query="update RegisterEntity ls set ls.password = :setNewPassword, ls.loginCount = :setResetStatus where ls.email = :emailBy")

@NamedQuery(name="accountLockedTimeByEmail", query="update RegisterEntity p set p.accountLockedTime = :accountLockedTimeBy where p.email = :emailBy")
//@NamedQuery(name="getEmailPassword",query = "SELECT p FROM RegisterEntity p WHERE p.email = :emailBy AND p.password = :passwordBy")

//forget password
@NamedQuery(name = "resetPasswordByEmail", query = "update RegisterEntity p set p.password = :setNewPassword where p.email = :emailBy")

//Update Profile
@NamedQuery(name = "getAllRegDetailsById",query = "select re from RegisterEntity re where re.id = :getRegistrationId")
@NamedQuery(name = "updateUserProfileByName", query = "UPDATE RegisterEntity re SET re.age=:getAge,re.height=:getHeight,re.weight=:getWeight,re.filePath=:getFilePath where re.name=:getName")

//update
@NamedQuery(name = "updateValuesById", query = "UPDATE RegisterEntity p SET p.packages = :setPackage, p.trainer = :setTrainer, p.amount = :setAmount, p.paid = :setPaid, p.balance = :setBalance, p.installment = :setInstallment where p.id = :idBy")
public class RegisterEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    @Column(name="email")
    private String email;

    @Column(name="password")
    private String password;

    private Integer age;

    private String packages;
    private String trainer;
    private long phone;

    private String gymName;
    private String amount;
    private String discount;
    private int paid;
    private double balance;
    private double installment;

    @Column(name = "login_count")
    private Integer loginCount;

    //  Constructor to initialize loginCount with default value
//    public RegisterEntity() {
//        this.loginCount = 0;
//    }

    @Column(name="account_locked_time")
    private LocalDateTime accountLockedTime;

    private String filePath;
    private Integer height;
    private Integer weight;

}



