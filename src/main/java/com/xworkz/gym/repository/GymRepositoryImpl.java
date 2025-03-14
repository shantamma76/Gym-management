package com.xworkz.gym.repository;

import com.xworkz.gym.DTO.RegisterDto;
import com.xworkz.gym.Entity.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Slf4j
@Repository
public class GymRepositoryImpl implements GymRepository {

    @Autowired
    EntityManagerFactory emf;
    private EntityTransaction et;

    @Override
    public boolean getNameByEmail(String email, String password) {
        System.out.println("getNameByEmailAndPassword in GymRepositoryImpl");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            Query query = entityManager.createNamedQuery("getNameByEmailAndPassword");
            query.setParameter("byEmail", email);
            query.setParameter("byPassword", password);
            Object singleResult = query.getSingleResult();
            entityTransaction.commit();

            if (singleResult != null) {
                System.out.println("result is not null");
                return true;
            }
            System.out.println("it is null");
            return false;
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            return false;
        } finally {
            entityManager.close();
        }
    }

    //---------------------------------------------------------------------------------------
    @Override
    public boolean saveEnquiry(EnquiryEntity enquiryEntity) {
        System.out.println("Running saveEnquiry in GymRepositoryImpl");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            entityTransaction.begin();
            entityManager.persist(enquiryEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            return false;
        } finally {
            entityManager.close();
        }
    }

    //Admin ajax validation
    @Override
    public Long countEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = (Long) em.createNamedQuery("findByEmail").setParameter("emailBy", email).getSingleResult();
        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countPassword(String password) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = (Long) em.createNamedQuery("findByPassword").setParameter("passwordBy", password).getSingleResult();
        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    //Enquiry Ajax Validation
    @Override
    public Long countName(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        Long count = (Long) em.createNamedQuery("countByName").setParameter("setName", name).getSingleResult();
        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countArea(String area) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByArea").setParameter("setArea", area).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countPhone(long phone) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countPhoneBy").setParameter("setPhone", phone).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countDistance(int distance) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByDistance").setParameter("setDistance", distance).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countAge(int age) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByAge").setParameter("setAge", age).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    //Registration ajax validation
    @Override
    public Long countNameBy(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countNameBy").setParameter("setName", name).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }


    @Override
    public Long countByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByEmail").setParameter("setEmail", email).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countByTrainer(String trainer) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByTrainer").setParameter("setTrainer", trainer).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countByPhone(long phone) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByPhone").setParameter("phoneBy", phone).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public Long countByGymName(String gymName) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        Long count = (Long) em.createNamedQuery("countByGymName").setParameter("setGymName", gymName).getSingleResult();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return count;
    }

    @Override
    public List<EnquiryEntity> findAll() {
        System.out.println(" findAll in GymRepositoryImpl");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        String query = "SELECT e FROM EnquiryEntity e ";
        return entityManager.createQuery(query, EnquiryEntity.class).getResultList();
    }

    @Override
    public List<EnquiryEntity> findByStatus(String status) {
        System.out.println("findByStatus in GymRepositoryImpl");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        String query = "SELECT e FROM EnquiryEntity e WHERE e.status = :status";
        return entityManager.createQuery(query, EnquiryEntity.class).setParameter("status", status).getResultList();
    }

    @Override
    public boolean updateStatusAndReason(String name, String status, String reasons) {
        System.out.println("updateStatusAndReason in GymRepositoryImpl");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        boolean isUpdated = false;
        try {
            entityTransaction.begin();
            String query = "UPDATE EnquiryEntity e SET e.status = :status, e.reasons = :reasons WHERE e.name = :name";
            int rowsAffected = entityManager.createQuery(query).setParameter("status", status).setParameter("reasons", reasons).setParameter("name", name).executeUpdate();

            entityTransaction.commit();
            isUpdated = rowsAffected > 0;

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            return false;
        } finally {
            entityManager.close();
        }

        return isUpdated;
    }

    //---------------------------------------------for registration------------------------------------

    @Override
    public boolean saveRegister(RegisterEntity registerEntity) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            entityManager.merge(registerEntity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            return false;
        } finally {
            entityManager.close();
        }
    }


    //new update of register
    @Override
    public RegisterEntity findByEmailCustom(String email) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            String query = "SELECT u FROM RegisterEntity u WHERE u.email = :email";
            return entityManager.createQuery(query, RegisterEntity.class).setParameter("email", email).getSingleResult();

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }


    @Override
    public boolean updateValuesById(String packages, String trainer, String amount, int paid, double balance, double installment, int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            int value = em.createNamedQuery("updateValuesById").setParameter("setPackage", packages).setParameter("setTrainer", trainer).setParameter("setAmount", amount).setParameter("setPaid", paid).setParameter("setBalance", balance).setParameter("setInstallment", installment).setParameter("idBy", id).executeUpdate();
            et.commit();

            if (value > 0) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }


//    @Override
//    public RegisterEntity updateRegister(String name, long phone) {
//        System.out.println("============findByNameAndPhone in GymRepositoryImpl============");
//        EntityManager entityManager = emf.createEntityManager();
//        EntityTransaction entityTransaction = entityManager.getTransaction();
//        String queryStr = "SELECT e FROM RegisterEntity e WHERE e.name = :name AND e.phone = :phone";
//        RegisterEntity result = null;
//
//        try {
//            entityTransaction.begin();
//            Query query = entityManager.createQuery(queryStr);
//            query.setParameter("name", name);
//            query.setParameter("phone", phone);
//            result = (RegisterEntity) query.getSingleResult();
//            entityTransaction.commit();
//
//        } catch (Exception e) {
//            System.out.println("error in update:" + e.getMessage());
//            if (entityTransaction.isActive()) {
//                entityTransaction.isActive();
//            }
//        } finally {
//            entityManager.close();
//        }
//        return result;
//    }

    //-------------------------------------------------for view page------------------------------------------------------
    @Override
    public EnquiryEntity getEnquiryEntityByName(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        String queryStr = "SELECT e FROM EnquiryEntity e WHERE e.name = :setName";
        EnquiryEntity result = null;

        try {
            et.begin();
            Query query = em.createQuery(queryStr);
            query.setParameter("setName", name);
            result = (EnquiryEntity) query.getSingleResult();
            System.out.println(result);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace(); // Log the exception
        } finally {
            em.close();
        }
        return result;
    }

    @Override
    public boolean saveView(ViewEntity viewEntity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        try {
            et.begin();
            em.persist(viewEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return true;

    }

    @Override
    public List<ViewEntity> getAllData(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<ViewEntity> list = null;

        try {
            List<ViewEntity> result = em.createNamedQuery("getAllData").setParameter("setEnquiryId", id).getResultList();
            System.out.println("viewDetails in repo======" + result.toString());
            return result;
        } catch (Exception e) {
            e.getMessage();
        } finally {
            em.close();
        }
        return Collections.emptyList();
    }

    //---------------------user login ------------------------

//    @Override
//    public RegisterEntity  getEmail(String email, String password) {
//        System.out.println("========getEmail in repository===");
//        EntityManager em = emf.createEntityManager();
//        EntityTransaction et = em.getTransaction();
//
//        try{
//            et.begin();
//            Object singleResult = em.createNamedQuery("getEmailPassword").setParameter("emailBy", email).setParameter("passwordBy", password).getSingleResult();
//            System.out.println("---Single result in repo.."+singleResult);
//            et.commit();
//            return (RegisterEntity) singleResult;
//
//        } catch (Exception e){
//            if(et.isActive()){
//                et.rollback();
//            }
//            return null;
//        } finally {
//            em.close();
//        }
//    }

    @Override
    public RegisterEntity userSave(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegisterEntity entity = null;
        try {
            Query query = em.createNamedQuery("getAllByEmail");
            query.setParameter("byEmail", email);

            entity = (RegisterEntity) query.getSingleResult();
            System.out.println("Entity from repository " + entity.toString());

//                List<RegisterEntity> result = query.getResultList();
//
//                if (!result.isEmpty()) {
//                    entity = result.get(0);  // You can select the first or handle according to your logic
//                    System.out.println("Entity from repository: " + entity);

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
        return entity;
    }


    @Override
    public void updateCount(String email, int count) {
        int result = count + 1;
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        int value;
        try {
            et.begin();
            value = em.createNamedQuery("updateCount").setParameter("setResetStatus", result).setParameter("byEmail", email).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public boolean resetCount(String email, int count) {
        System.out.println("=========resetCount in repoImpl============");
        int result = 0;
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            value = em.createNamedQuery("resetCount").setParameter("setLoginCount", 0).setParameter("byEmail", email).executeUpdate();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        if (value > 0) {
            return true;
        } else {
            return false;
        }

    }

    @Override
    public String updatePasswordByEmail(String email, String newPassword) {
        System.out.println("=====updatePasswordByEmail========");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            System.out.println("Email:" + email);
            System.out.println("newPassword:" + newPassword);

            Query query = em.createNamedQuery("updatePasswordByEmail");
            query.setParameter("setNewPassword", newPassword);
            query.setParameter("setResetStatus", 0);
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();
            et.commit();

            if (value > 0) {
                return "Password updated successfully";
            } else {
                return "Password is not updated";
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
        return "password updated successfully";
    }


    //Account Locked
    @Override
    public String updateLockedAccountTimeByEmail(String email) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            Query query = em.createNamedQuery("accountLockedTimeByEmail");
            query.setParameter("accountLockedTimeBy", LocalDateTime.now());
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();
            et.commit();

            if (value > 0) {
                System.out.println("Account lock time is set to current time");
            } else {
                System.out.println("Failed to set account lock time");
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            {
                em.close();
            }
        }
        return "Account lock time is set";
    }

    @Override
    public String resetPasswordByEmail(String email, String newPassword) {
        System.out.println("Entering repository resetPasswordByEmail");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();

            Query query = em.createNamedQuery("resetPasswordByEmail");
            query.setParameter("setNewPassword", newPassword);
            query.setParameter("emailBy", email);

            int value = query.executeUpdate();
            et.commit();

            System.out.println("Rows affected:" + value);

            if (value > 0) {
                return "password updated successfully";
            } else {
                return "Password Updated";
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return "password updated successfully";
    }


    //--------------------

    //Update Profile
    @Override
    public List<RegisterEntity> getAllRegisteredUserDetailsById(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegisterEntity> list = em.createNamedQuery("getAllRegDetailsById", RegisterEntity.class).setParameter("getRegistrationId", id).getResultList();
        try {
            et.begin();
            em.merge(list);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        System.out.println(list);
        return list;
    }

    @Override
    public RegisterDto updateUserProfile(@RequestParam String name, RegisterDto registerDto, String filePath) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        int value = 0;
        try {
            et.begin();
            value = em.createNamedQuery("updateUserProfileByName")
                    .setParameter("getAge", registerDto.getAge())
                    .setParameter("getHeight", registerDto.getHeight())
                    .setParameter("getWeight", registerDto.getWeight())
                    .setParameter("getFilePath", filePath).setParameter("getName", name)
                    .executeUpdate();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return registerDto;
    }


//    @Override
//    public int updateUserProfile(RegistrationEntity entity, String filePath,int id) {
//        EntityManager em = entityManagerFactory.createEntityManager();
//        EntityTransaction et = em.getTransaction();
//        int value=0;
//        try {
//            et.begin();
//            value=em.createNamedQuery("updateUserProfile").setParameter("getprofileImage",filePath).setParameter("getName",entity.getName()).setParameter("getEmail",entity.getEmail()).setParameter("getPhoneNo",entity.getPhoneNumber()).setParameter("getAge",entity.getAge()).setParameter("getWeight",entity.getWeight()).setParameter("getHeight",entity.getHeight()).setParameter("getChestSize",entity.getChestSize()).setParameter("getId",id).executeUpdate();
//
//            et.commit();
//        } catch (Exception e) {
//            if (et.isActive()) {
//                et.rollback();
//            }
//        } finally {
//            em.close();
//        }
//        return value;
//    }


    //------------time slot-------
    @Override
    public boolean saveSlots(SlotsEntity slotTimings) {
        System.out.println("=========save slots=======in repoimpl=======");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(slotTimings);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<SlotsEntity> findallslots() {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("GetslotList");
            List<SlotsEntity> result = query.getResultList();
            transaction.commit();
            return result;

        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    @Override
    public boolean savetrainerdetails(TrainerEntity entity) {

        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(entity);
            transaction.commit();
            return true;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public List<TrainerEntity> findAlltrainerlist() {
        System.out.println("=====find All trainer list in repo======");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            transaction.begin();
            Query query = entityManager.createNamedQuery("GetTrainerInfoList");
            List<TrainerEntity> result = query.getResultList();
            transaction.commit();
            return result;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
        return null;
    }

    //delete
    @Override
    public boolean getDeleteTrainerById(int id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            entityTransaction.begin();
            TrainerEntity entity = entityManager.find(TrainerEntity.class, id);
            if (entity != null) {
                entityManager.remove(entity);
                entityTransaction.commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            entityManager.close();
        }
    }

    //--------------------------------------------------
//    @Override
//    public RegisterEntity getDataById(int id) {
//
//        EntityManager entityManager = emf.createEntityManager();
//        EntityTransaction entityTransaction = entityManager.getTransaction();
//        try {
//            Query query = entityManager.createNamedQuery("getRegisterEntityById");
//            query.setParameter("setId", id);
//            return (RegisterEntity) query.getSingleResult();
//        } catch (Exception e) {
//            if (entityTransaction.isActive()) {
//                entityTransaction.rollback();
//            }
//            e.printStackTrace();
//            return null;
//        }
//    }
//
//    @Override
//    public boolean updateEntity(RegisterEntity entity) {
//        EntityManager entityManager = emf.createEntityManager();
//        EntityTransaction entityTransaction = entityManager.getTransaction();
//        try {
//            entityTransaction.begin();
//            entityManager.merge(entity);
//            entityTransaction.commit();
//            return true;
//        } catch (Exception e) {
//            if (emf.createEntityManager().getTransaction().isActive())
//                emf.createEntityManager().getTransaction().rollback();
//            return false;
//        }
//    }


    @Override
    public List<RegisterEntity> getAllRegiDetails() {
        System.out.println("---------------get all details in RepoImpl-------------");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();

        try {
            Query query = entityManager.createNamedQuery("getAllDetailsOfCustomer");
            return query.getResultList();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
        } finally {
            entityManager.close();
        }
        return Collections.emptyList();
    }

//    @Override
//    public List<RegisterEntity> getCustomrtDetailsWithTrainer() {
//        System.out.println("-----------get getCustomrtDetailsWithTrainer in Repo----------");
//        EntityManager entityManager = emf.createEntityManager();
//        EntityTransaction entityTransaction = entityManager.getTransaction();
//        try {
//            entityTransaction.begin();
//            Query query = entityManager.createNamedQuery("getAllDetailsofCustomrtWithTrainer");
//            System.out.println("getAllDetailsofCustomrtWithTrainer:========" + query.getResultList());
//            return query.getResultList();
//        } catch (Exception e) {
//            if (entityTransaction.isActive())
//                entityTransaction.rollback();
//            e.printStackTrace();
//            return Collections.emptyList();
//        }
//
//    }

    //=======trial me=======
    @Override
    public List<TrainerEntity> getTrainers() {
        System.out.println("---------------get all details in RepoImpl-------------");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            Query query = entityManager.createNamedQuery("getAllTrainerEntityDetails");
            return query.getResultList();

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    @Override
    public TrainerEntity getDataByTrainerId(int id) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            Query query = entityManager.createNamedQuery("getTrainerEntityById");
            query.setParameter("setId", id);
            return (TrainerEntity) query.getSingleResult();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean updateTrainerEntity(TrainerEntity entity) {
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            entityTransaction.begin();
            entityManager.merge(entity);
            entityTransaction.commit();
            return true;
        } catch (Exception e) {
            if (emf.createEntityManager().getTransaction().isActive())
                emf.createEntityManager().getTransaction().rollback();
            return false;
        }
    }


    @Override
    public boolean saveTrainerAssignDetails(AssignTrainersEntity assignTrainersEntity) {
        System.out.println("======== saveTrainerAssignDetails ========:");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(assignTrainersEntity);
            et.commit();
            System.out.println("=====saved data in repo======");
            return true;
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            System.out.println("=====not saved data in repo======");
            return false;
        } finally {
            em.close();
        }
    }


    @Override
    public List<EnquiryEntity> getAllEnquiry() {
        System.out.println("---------------getAllEnquiry in RepoImpl-------------");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        try {
            Query query = entityManager.createNamedQuery("getAllDetailsOfEnquiry");
            return query.getResultList();
        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();
            return Collections.emptyList();
        }
    }

    @Override
    public String getPhoneNumberByName(String name) {
        System.out.println("---------------getPhoneNumberByName in RepoImpl-------------");
        EntityManager entityManager = emf.createEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        String phone = null;
        try {

            Query query = entityManager.createNamedQuery("getPhoneNoByName");
            query.setParameter("setName", name);
            Long phoneNumber = (Long) query.getSingleResult();  // Assuming it's stored as Long in DB
            return phoneNumber.toString(); // Convert to String if needed

        } catch (Exception e) {
            if (entityTransaction.isActive()) {
                entityTransaction.rollback();
            }
            e.printStackTrace();

        }
        return phone;
    }


    @Override
    public void updateUserDetails(RegisterEntity registerEntity) {

        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(registerEntity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
            //` emf.close();
        }
    }


    //-------------------------------------------------------------------------------------

    @Override
    public List<RegisterEntity> assignSlot() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        log.info("getting all data in repository");
        try {

            Query query = em.createNamedQuery("assignSlot");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }


        return Collections.emptyList();
    }


    @Override
    public List<TrainerEntity> getTrainerDetails() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        log.info("getting all data in repository");


        try {

            Query query = em.createNamedQuery("getTrainerList");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }


        return Collections.emptyList();
    }

    @Override
    public List<SlotsEntity> getTimeSlot() {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        log.info("getting all data in repository");
        try {
            Query query = em.createNamedQuery("getTimeSlotEntity");
            log.info("returning from database...");
            return query.getResultList();
        } catch (Exception e) {
            et.isActive();
            {
                et.rollback();
            }

        } finally {
            em.close();
        }
        return Collections.emptyList();
    }

    @Override
    public RegisterEntity searchDetails(String name, String email) {
        log.info("search in repository");

        EntityManager em = emf.createEntityManager();

        try {
            log.info("query is running");
            Query query = em.createNamedQuery("findByNameAndEmail");
            query.setParameter("SetName", name);
            query.setParameter("SetEmail", email);

            log.info("get name and email.....");

            return (RegisterEntity) query.getSingleResult();

        } catch (NoResultException e) {
            log.info("No entity found for given name and email.");
            return null;
        } catch (Exception e) {
            log.error("Error fetching entity", e);
            return null;
        } finally {
            em.close();
        }
    }


    @Override
    public boolean updateSlot(int entityId, int trainerId) {
        log.info("assign slot request in service ");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        log.info("assign slot request in service... ");
        try {
            et.begin();
            log.info("begin...... ");
            Query query = em.createNamedQuery("updateTrainerId");
            log.info("named query is executing.... ");
            query.setParameter("trainerId", trainerId);
            query.setParameter("entityId", entityId);
            log.info("named query is executing.... ");
            int updatedRows = query.executeUpdate();
            log.info("updating.....");
            et.commit();
            log.info("committing....");
            return updatedRows > 0;
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }


    //--------------------diet from chara
    @Override
    public List<RegisterEntity> getAllRegistredUsersDetailsByNameAndPhoneNo(String searchName, Long searchPhoneNo) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        List<RegisterEntity> list = em.createNamedQuery("getAllRegistredUsersDetailsByNameAndPhoneNo").setParameter("getName", searchName).setParameter("getPhoneNo", searchPhoneNo).getResultList();
        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return list;
    }


    @Override
    public void saveUserDietAndExercise(UserExerciseAndDietEntity entity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.persist(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public void saveUserUpdatedDietAndExercise(UserUpdatedExerciseAndDietEntity entity) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            em.merge(entity);
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public List<UserUpdatedExerciseAndDietEntity> getAlluserExerciseAndDietEntitiesById(int id) {
        System.out.println("===== getAlluserExerciseAndDietEntitiesById in repo ====");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<UserUpdatedExerciseAndDietEntity> list = em.createNamedQuery("getAlluserExerciseAndDietEntitiesById", UserUpdatedExerciseAndDietEntity.class).setParameter("getId", id).getResultList();

        try {
            et.begin();
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        System.out.println(list);
        return list;
    }


    @Override
    public List<UserExerciseAndDietEntity> getuserMonthlyImages(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        List<UserExerciseAndDietEntity> list = em.createNamedQuery("getuserMonthlyImages", UserExerciseAndDietEntity.class).setParameter("getId", id).getResultList();

        try {
            et.begin();

            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        System.out.println(list);
        return list;
    }


    @Override
    public RegisterEntity getAllRegistredUsersDetailsById(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        RegisterEntity registrationEntity = null;
        try {
            et.begin();
            List<RegisterEntity> list = em.createNamedQuery("getAllRegistredUsersDetailsById").setParameter("getId", name).getResultList();

            if (!list.isEmpty()) {
                registrationEntity = list.get(0);
            }

            et.commit();

        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return registrationEntity;
    }

    @Override
    public AssignTrainersEntity getTrainerAndSlotByUserName(String name) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        AssignTrainersEntity entity = null;

        try {
            et.begin();
            List<AssignTrainersEntity> trainerEntities = em.createNamedQuery("getTrainerAndSlotByUserName", AssignTrainersEntity.class).setParameter("getUserName", name).getResultList();
            if (!trainerEntities.isEmpty()) {
                entity = trainerEntities.get(0);
            }
            et.commit();
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }
        return entity;
    }

    //--------------
//    @Override
//    public RegisterEntity findNamesByPrefix(String prefix) {
//        System.out.println("===================reposi====================");
//        EntityManager em = emf.createEntityManager();
//        EntityTransaction et = em.getTransaction();
//        List<RegisterEntity> result = null;
//
//        try {
//            et.begin();
//            result = em.createQuery("SELECT p.name FROM RegisterEntity p WHERE p.name LIKE :prefix")
//                    .setParameter("prefix", prefix + "%")
//                    .getResultList();
//
//        } catch (Exception e) {
//            if (et.isActive()) {
//                et.rollback();
//            }
//        } finally {
//            em.close();
//        }
//        return null;
//    }






}

















