package com.example.foodapp.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.Notification;
import com.example.foodapp.model.User;
import com.example.foodapp.repository.DonationRepository;
import com.example.foodapp.repository.NotificationRepository;

@Service
public class DonationService {

	@Autowired
	private DonationRepository donationRepo;

	@Autowired
	private NotificationRepository notificationRepo;

	// ================= SAVE =================
	public void saveDonation(Donation donation) {
		if (donation != null) {
			donationRepo.save(donation);
		}
	}

	// ================= FETCH =================
	public List<Donation> getDonationsByStatus(String status) {
		return donationRepo.findByStatus(status);
	}

	public List<Donation> getDonationsByDonor(User donor) {
		return donationRepo.findByDonor(donor);
	}

	public Optional<Donation> getDonationById(Integer id) {
		return donationRepo.findById(id);
	}

	public List<Donation> getDonationsByNgo(User ngo) {
		return donationRepo.findByNgo(ngo);
	}

	public List<Donation> getDonationsByStatusAndNgo(String status, User ngo) {
		return donationRepo.findByStatusAndNgo(status, ngo);
	}

	// ================= BUSINESS LOGIC =================
	@Transactional
	public void acceptDonation(Integer donationId, User ngo) {

		Donation donation = donationRepo.findById(donationId)
				.orElseThrow(() -> new RuntimeException("Donation not found with id: " + donationId));

		// Prevent re-accepting
		if (!"CREATED".equalsIgnoreCase(donation.getStatus())) {
			throw new RuntimeException("Donation already processed");
		}

		donation.setStatus("ACCEPTED");
		donation.setNgo(ngo);
		donationRepo.save(donation);

		// Create Notification
		if (donation.getDonor() != null) {
			Notification notification = new Notification(
					"Your donation '" + donation.getFoodName() + "' has been accepted by " + ngo.getOrganizationName(),
					donation.getDonor());
			notificationRepo.save(notification);
		}
	}

	// ================= DASHBOARD =================
	public long getPendingRequestsCount() {
		return donationRepo.countByStatus("CREATED");
	}

	public List<Donation> getRecentDonations() {
		return donationRepo.findTop5ByOrderByDonationIdDesc();
	}

	public long getTotalDonations() {
		return donationRepo.count();
	}

	public Double getTotalFoodQuantity() {
		Double total = donationRepo.sumQuantity();
		return total != null ? total : 0.0; // avoid null issue
	}

	public List<Object[]> getDonationStatusCounts() {
		return donationRepo.getDonationStatusCounts();
	}

	public List<Object[]> getMonthlyDonations() {
		return donationRepo.getMonthlyDonations();
	}
	public List<Donation> getDonationsByUser(Integer userId) {
	    return donationRepo.findByDonor_UserId(userId);
	}
	public List<Donation> searchByCity(String city) {
	    return donationRepo.findByPickupAddressContainingIgnoreCase(city);
	}


	public List<Donation> searchByCityAndFoodType(String city, String foodType) {
	    return donationRepo.findByPickupAddressContainingIgnoreCaseAndFoodTypeIgnoreCase(city, foodType);
	}
	public List<Donation> getAllDonations() {
	    return donationRepo.findAll();
	}
	public List<Donation> searchByFoodType(String foodType) {
	    return donationRepo.findByFoodTypeFlexible(foodType);
	}
	public List<Donation> getNewDonations() {
	    return donationRepo.findByStatusOrderByDonationIdDesc("CREATED");
	}
	public List<Donation> getAvailableDonations() {
	    return donationRepo.findAvailableDonations();
	}
	public List<Donation> searchAvailableByCity(String city) {
	    return donationRepo.findByPickupAddressContainingIgnoreCaseAndStatus(city, "CREATED");
	}

	public List<Donation> searchAvailableByFoodType(String foodType) {
	    return donationRepo.findByFoodTypeIgnoreCaseAndStatus(foodType, "CREATED");
	}

	public List<Donation> searchAvailableByCityAndFoodType(String city, String foodType) {
	    return donationRepo.findByPickupAddressContainingIgnoreCaseAndFoodTypeIgnoreCaseAndStatus(city, foodType, "CREATED");
	}
	
}