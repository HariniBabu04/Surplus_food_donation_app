package com.example.foodapp.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;

public interface DonationRepository extends JpaRepository<Donation, Integer> {
    List<Donation> findByStatus(String status);
    List<Donation> findByNgo(User ngo);
    List<Donation> findByDonor(User donor);
    List<Donation> findByStatusAndNgo(String status, User ngo);
    
    long countByStatus(String status);

    List<Donation> findTop5ByOrderByDonationIdDesc();
    
    // Search donations by city and status
    List<Donation> findByPickupAddressContainingAndStatus(String city, String status);
    @Query("SELECT SUM(d.quantity) FROM Donation d")
    Double sumQuantity();
   
  
    @Query("SELECT d.status, COUNT(d) FROM Donation d GROUP BY d.status")
    List<Object[]> getDonationStatusCounts();
    @Query("SELECT FUNCTION('MONTH', d.preparedTime), COUNT(d) FROM Donation d GROUP BY FUNCTION('MONTH', d.preparedTime)")
    List<Object[]> getMonthlyDonations();
    List<Donation> findByDonor_UserId(Integer userId);
    List<Donation> findByPickupAddressContainingIgnoreCase(String city);

    List<Donation> findByFoodTypeIgnoreCase(String foodType);

    List<Donation> findByPickupAddressContainingIgnoreCaseAndFoodTypeIgnoreCase(String city, String foodType);
    @Query("SELECT d FROM Donation d WHERE LOWER(d.foodType) LIKE LOWER(CONCAT('%', :foodType, '%'))")
    List<Donation> findByFoodTypeFlexible(@Param("foodType") String foodType);
    List<Donation> findByStatusOrderByDonationIdDesc(String status);
   
    List<Donation> findByPickupAddressContainingIgnoreCaseAndStatus(String city, String status);

    List<Donation> findByFoodTypeIgnoreCaseAndStatus(String foodType, String status);

    List<Donation> findByPickupAddressContainingIgnoreCaseAndFoodTypeIgnoreCaseAndStatus(String city, String foodType, String status);
    @Query("SELECT d FROM Donation d WHERE LOWER(d.foodType) LIKE LOWER(CONCAT('%', :foodType, '%')) AND d.status = 'CREATED'")
    List<Donation> findByFoodTypeFlexibleAvailable(@Param("foodType") String foodType);
    @Query("SELECT d FROM Donation d WHERE LOWER(d.status) IN ('created','accepted') ORDER BY d.donationId DESC")
    List<Donation> findActiveDonations();

    @Query("SELECT d FROM Donation d WHERE d.status IN ('CREATED','ACCEPTED')")
    List<Donation> findAvailableDonations();
}