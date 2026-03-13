package com.example.foodapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.example.foodapp.model.Donation;

public interface DonationRepository extends JpaRepository<Donation, Integer> {

}