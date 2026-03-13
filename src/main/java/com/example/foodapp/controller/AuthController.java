package com.example.foodapp.controller;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;
import com.example.foodapp.repository.DonationRepository;
import com.example.foodapp.service.UserService;

@Controller
public class AuthController {

	@Autowired
	private UserService userService;

	@Autowired
	private DonationRepository donationRepo;

	// Show home Page
	@GetMapping("/")
	public String homePage() {
		return "home";
	}

	// ================= LOGIN PAGE =================
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	// ================= LOGIN PROCESS =================
	@PostMapping("/login")
	public String loginUser(@ModelAttribute User user) {

		User existingUser = userService.authenticateUser(user.getEmail(), user.getPassword());

		if (existingUser != null) {

			Integer role = existingUser.getRole();

			if (role == 1) {
				return "redirect:/donor-dashboard";
			} else if (role == 2) {
				return "redirect:/ngo-dashboard";
			} else if (role == 3) {
				return "redirect:/admin-dashboard";
			}
		}

		return "login";
	}

	// ================= REGISTER PAGE =================
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}

	// ================= REGISTER PROCESS =================

	@PostMapping("/register")
	public String registerUser(@ModelAttribute User user, RedirectAttributes ra) {

	    boolean status = userService.registerUser(user);

	    if (!status) {
	        ra.addFlashAttribute("errorMessage", "Email already exists!");
	        return "redirect:/register";
	    }

	    return "redirect:/login";
	}

	// Show forgot-password Page
	@GetMapping("/forgotPassword")
	public String ForgotPasswordPage() {
		return "forgotPassword";
	}

	// Show donor-dashboard Page
	@GetMapping("/donor-dashboard")
	public String DonorPage() {
		return "donor-dashboard";
	}

	// Show add-donation Page
	@GetMapping("/addSurplusfood")
	public String AddDonationPage() {
		return "addSurplusfood";
	}

	@PostMapping("/addSurplusfood")
	public String addDonation(@RequestParam String foodName, @RequestParam String foodType,
			@RequestParam String quantity, @RequestParam String preparedDate, @RequestParam String preparedTime,
			@RequestParam String expiryTime, @RequestParam String pickupAddress, @RequestParam String contactPerson,
			@RequestParam String contactNumber) {

		Donation donation = new Donation();

		donation.setFoodName(foodName);
		donation.setFoodType(foodType);
		donation.setQuantity(quantity);
		donation.setPickupAddress(pickupAddress);
		donation.setContactPerson(contactPerson);
		donation.setContactNumber(contactNumber);

		// Combine date and time
		LocalDateTime preparedDateTime = LocalDateTime.parse(preparedDate + "T" + preparedTime);

		LocalDateTime expiryDateTime = LocalDateTime.parse(preparedDate + "T" + expiryTime);

		donation.setPreparedTime(preparedDateTime);
		donation.setExpiryTime(expiryDateTime);

		donation.setStatus("Available");

		// Temporary donor-id (replace with session later)
		donation.setDonorId(1);

		donationRepo.save(donation);

		return "redirect:/donor-dashboard";
	}

	// Show manage-donation Page
	@GetMapping("/manageDonation")
	public String ManageDonationPage() {
		return "manageDonation";
	}

	// Show donation-status Page
	@GetMapping("/donation-status")
	public String DonationStatusPage() {
		return "donation-status";
	}

	// Show settings Page
	@GetMapping("/settings")
	public String SettingsPage() {
		return "settings";
	}

	// Show ngo-dashboard Page
	@GetMapping("/ngo-dashboard")
	public String NGOPage() {
		return "ngo-dashboard";
	}

	// Show ngo-dashboard Page
	@GetMapping("/viewDonation")
	public String ViewDonationPage() {
		return "viewDonation";
	}

	// Show ngo-dashboard Page
	@GetMapping("/search-food")
	public String SearchFoodPage() {
		return "search-food";
	}

	// Show ngo-dashboard Page
	@GetMapping("/view-map")
	public String ViewMapPage() {
		return "view-map";
	}

	// Show ngo-dashboard Page
	@GetMapping("/acceptDonation")
	public String AcceptDonationPage() {
		return "acceptDonation";
	}

	// Show ngo-dashboard Page
	@GetMapping("/pickup")
	public String PickupPage() {
		return "pickup";
	}

	// Show admin-dashboard Page
	@GetMapping("/admin-dashboard")
	public String AdminPage() {
		return "admin-dashboard";
	}

	// Show manage-users Page
	@GetMapping("/manageUsers")
	public String ManageUsersPage() {
		return "manageUsers";
	}

	// Show manage donation-admin Page
	@GetMapping("/manageDonation-admin")
	public String ManageDonationAdminPage() {
		return "manageDonation-admin";
	}

	// Show notification-status Page
	@GetMapping("/notification-status")
	public String NotificationStatusPage() {
		return "notification-status";
	}

	// Show reports-analytics Page
	@GetMapping("/reports-analytics")
	public String ReportsAnalysisPage() {
		return "reports-analytics";
	}

	// Show edit-user Page
	@GetMapping("/editUser")
	public String EditUserPage() {
		return "editUser";
	}

	// Show edit-donation Page
	@GetMapping("/editDonation")
	public String EditDonationPage() {
		return "editDonation";
	}

	// Show view-user Page
	@GetMapping("/viewUser")
	public String ViewUserPage() {
		return "viewUser";
	}

}
