package com.example.foodapp.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.foodapp.model.Donation;
import com.example.foodapp.model.User;
import com.example.foodapp.repository.DonationRepository;
import com.example.foodapp.service.DonationService;
import com.example.foodapp.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

	@Autowired
	private UserService userService;

	@Autowired
	private DonationService donationService;

	

	@Autowired
	private DonationRepository donationRepository;

	// ================= HOME =================
	@GetMapping("/")
	public String homePage() {
		return "home";
	}

	// ================= LOGIN =================
	@GetMapping("/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/login")
	public String loginUser(@ModelAttribute User user, @RequestParam("role") String selectedRole, HttpSession session) {

		User existingUser = userService.authenticateUser(user.getEmail(), user.getPassword());

		if (existingUser != null) {

			String role = existingUser.getRole();

			if (role != null && role.equalsIgnoreCase(selectedRole)) {

				session.setAttribute("loggedUser", existingUser);

				if (role.equalsIgnoreCase("donor")) {
					return "redirect:/donor-dashboard";
				} else if (role.equalsIgnoreCase("ngo")) {
					return "redirect:/ngo-dashboard";
				} else if (role.equalsIgnoreCase("admin")) {
					return "redirect:/admin-dashboard";
				}
			}
		}

		return "login";
	}

	// ================= REGISTER =================
	@GetMapping("/register")
	public String registerPage() {
		return "register";
	}

	@PostMapping("/register")
	public String registerUser(@ModelAttribute User user) {

		boolean status = userService.registerUser(user);

		if (!status) {
			return "redirect:/register";
		}

		return "redirect:/login";
	}

	// ================= LOGOUT =================
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}

	// ================= DONOR DASHBOARD =================
	@GetMapping("/donor-dashboard")
	public String donorDashboard(HttpSession session, Model model) {

	    User loggedUser = (User) session.getAttribute("loggedUser");

	    if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
	        return "redirect:/login";
	    }

	    // ✅ Get all donations of this donor
	    List<Donation> donations = donationService.getDonationsByUser(loggedUser.getUserId());

	    // ✅ ADD LIST
	    model.addAttribute("donations", donations);

	    // ✅ CALCULATE COUNTS
	    long totalDonations = donations.size();

	    long pendingDonations = donations.stream()
	            .filter(d -> "CREATED".equalsIgnoreCase(d.getStatus()))
	            .count();

	    long acceptedDonations = donations.stream()
	            .filter(d -> "ACCEPTED".equalsIgnoreCase(d.getStatus()))
	            .count();

	    long expiredDonations = donations.stream()
	            .filter(d -> "EXPIRED".equalsIgnoreCase(d.getStatus()))
	            .count();

	    // ✅ ADD COUNTS TO MODEL
	    model.addAttribute("totalDonations", totalDonations);
	    model.addAttribute("pendingDonations", pendingDonations);
	    model.addAttribute("acceptedDonations", acceptedDonations);
	    model.addAttribute("expiredDonations", expiredDonations);

	    // ✅ ADD NAME (for welcome text)
	    model.addAttribute("name", loggedUser.getName());

	    return "donor-dashboard";
	}
	// ================= ADD DONATION =================
	@GetMapping("/addSurplusfood")
	public String addDonationPage(HttpSession session) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}

		return "addSurplusfood";
	}

	@PostMapping("/addSurplusfood")
	public String addDonation(Donation donation, HttpSession session) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}

		donation.setDonor(loggedUser);
		donation.setStatus("CREATED");

		donationService.saveDonation(donation);

		return "redirect:/donor-dashboard";
	}

	// ================= DONOR DONATION LIST =================
	// Show manage-donation Page
	@GetMapping("/manageDonation")
	public String ManageDonationPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		List<Donation> donorDonations = donationService.getDonationsByDonor(loggedUser);
		model.addAttribute("donations", donorDonations);
		return "manageDonation";
	}

	@GetMapping("/editDonation/{id}")
	public String editDonation(@PathVariable Integer id, HttpSession session, Model model) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}

		Donation donation = donationService.getDonationById(id).orElse(null);

		if (donation == null) {
			return "redirect:/donor-dashboard";
		}
		if (donation.getStatus().equals("ACCEPTED") || donation.getStatus().equals("CANCELLED")) {
			return "redirect:/donor-dashboard";
		}

		model.addAttribute("donation", donation);

		return "editDonation";
	}

	// update donation-donor
	@PostMapping("/updateDonation")
	public String updateDonation(@ModelAttribute Donation donation) {

		Donation existing = donationRepository.findById(donation.getDonationId()).get();

		existing.setFoodName(donation.getFoodName());
		existing.setFoodType(donation.getFoodType());
		existing.setQuantity(donation.getQuantity());
		existing.setPickupAddress(donation.getPickupAddress());
		existing.setExpiryTime(donation.getExpiryTime());
		existing.setStatus(donation.getStatus());

		donationRepository.save(existing);

		return "redirect:/manageDonation";
	}

	@GetMapping("/cancelDonation/{id}")
	public String cancelDonation(@PathVariable Integer id, HttpSession session) {

	    User loggedUser = (User) session.getAttribute("loggedUser");

	    // ✅ Session check
	    if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
	        return "redirect:/login";
	    }

	    Donation donation = donationService.getDonationById(id).orElse(null);

	    // ✅ Null check
	    if (donation == null) {
	        return "redirect:/donor-dashboard";
	    }

	    // ✅ Prevent invalid cancellation
	    if ("ACCEPTED".equalsIgnoreCase(donation.getStatus()) ||
	        "CANCELLED".equalsIgnoreCase(donation.getStatus())) {
	        return "redirect:/donor-dashboard";
	    }

	    // ✅ Update status
	    donation.setStatus("CANCELLED");
	    donationService.saveDonation(donation);

	    return "redirect:/manageDonation";  // better consistency
	}

	@GetMapping("/donation-status")
	public String DonationStatusPage(HttpSession session, Model model) {
		User loggedUser = (User) session.getAttribute("loggedUser");
		if (loggedUser == null || !"donor".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}
		List<Donation> donorDonations = donationService.getDonationsByDonor(loggedUser);
		model.addAttribute("donations", donorDonations);
		return "donation-status";
	}

	// ================= NGO DASHBOARD =================
	@GetMapping("/ngo-dashboard")
	public String ngoDashboard(HttpSession session, Model model) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}

		model.addAttribute("totalDonations", donationRepository.count());
		model.addAttribute("pendingDonations", donationService.getDonationsByStatus("CREATED").size());
		model.addAttribute("acceptedDonations",
				donationService.getDonationsByStatusAndNgo("ACCEPTED", loggedUser).size());

		return "ngo-dashboard";
	}

	// ================= VIEW DONATIONS (NGO) =================
	@GetMapping("/viewDonation")
	public String viewDonationPage(HttpSession session, Model model) {

	    User loggedUser = (User) session.getAttribute("loggedUser");

	    if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
	        return "redirect:/login";
	    }

	    // ✅ ONLY NEW DONATIONS (LATEST FIRST)
	    List<Donation> donations = donationService.getAvailableDonations();

	    model.addAttribute("donations", donations);

	    return "viewDonation";
	}

	// ================= SHOW ACCEPT PAGE =================
	@GetMapping("/acceptDonation/{id}")
	public String acceptDonationPage(@PathVariable Integer id, Model model, HttpSession session) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null || !"ngo".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}

		Donation donation = donationRepository.findById(id).orElse(null);

		model.addAttribute("donation", donation);

		return "acceptDonation";
	}

	// ================= ACCEPT DONATION =================
	@PostMapping("/acceptDonation")
	public String acceptDonation(@RequestParam Integer donationId, HttpSession session) {

	    User loggedUser = (User) session.getAttribute("loggedUser");

	    Donation donation = donationRepository.findById(donationId).orElse(null);

	    if (donation != null) {
	        donation.setStatus("ACCEPTED");   // ✅ THIS MUST HAPPEN
	        donation.setNgo(loggedUser);
	        donationRepository.save(donation);
	    }

	    return "redirect:/viewDonation";
	}

	@GetMapping("/search-food")
	public String searchFood(
	        @RequestParam(required = false) String city,
	        @RequestParam(required = false) String foodType,
	        Model model) {

	    // ✅ Normalize foodType
	    if (foodType != null) {
	        foodType = foodType.toLowerCase().replace("-", " ").trim();
	    }

	    List<Donation> donations;

	    if (city != null && !city.isEmpty() &&
	        foodType != null && !foodType.isEmpty()) {

	        donations = donationService.searchAvailableByCityAndFoodType(city, foodType);

	    } else if (city != null && !city.isEmpty()) {

	        donations = donationService.searchAvailableByCity(city);

	    } else if (foodType != null && !foodType.isEmpty()) {

	        donations = donationService.searchAvailableByFoodType(foodType);

	    } else {
	        donations = donationService.getNewDonations();
	    }

	    model.addAttribute("donations", donations);
	    return "search-food";
	}
	
	
	
	@GetMapping("/pickup/{id}")
	public String loadPickupPage(@PathVariable Integer id, Model model) {

	    System.out.println("Pickup page opened for ID: " + id);

	    Donation donation = donationService.getDonationById(id)
	            .orElseThrow(() -> new RuntimeException("Donation not found"));

	    model.addAttribute("donation", donation);

	    return "pickup";
	}
	@PostMapping("/verify-otp")
	@ResponseBody
	public String verifyOTP(@RequestParam Integer donationId,
	                        @RequestParam String otp) {

	    boolean isValid = "1234".equals(otp); // temporary

	    return isValid ? "SUCCESS" : "INVALID";
	}
	@PostMapping("/confirm-pickup")
	public String confirmPickup(
	        @RequestParam Integer donationId,
	        @RequestParam String actualPickupTime,
	        @RequestParam String volunteerName,
	        @RequestParam String vehicleNumber,
	        @RequestParam String foodCondition,
	        @RequestParam String pickupRemarks) {

	    Donation donation = donationService.getDonationById(donationId).orElse(null);

	    if (donation != null) {
	        donation.setStatus("PICKED_UP");
	        donation.setVolunteerName(volunteerName);
	        donation.setVehicleNumber(vehicleNumber);
	        donation.setFoodCondition(foodCondition);
	        donation.setPickupRemarks(pickupRemarks);

	        donationService.saveDonation(donation);
	    }

	    return "redirect:/viewDonation";
	}
	// ================= ADMIN DASHBOARD =================
	@GetMapping("/reports-analytics")
	public String reportsPage(HttpSession session, Model model) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		// ✅ Secure Access
		if (loggedUser == null || !"ADMIN".equalsIgnoreCase(loggedUser.getRole())) {
			return "redirect:/login";
		}

		// ================= SUMMARY =================
		model.addAttribute("totalDonations", donationService.getTotalDonations());
		model.addAttribute("totalDonors", userService.countByRole("DONOR"));
		model.addAttribute("totalNGOs", userService.getActiveNGOsCount());
		model.addAttribute("foodSaved", donationService.getTotalFoodQuantity());

		// ================= RECENT DATA =================
		model.addAttribute("recentDonations", donationService.getRecentDonations());

		// ================= 📊 MONTHLY CHART =================
		List<Object[]> monthly = donationService.getMonthlyDonations();

		List<Integer> months = new ArrayList<>();
		List<Long> counts = new ArrayList<>();

		for (Object[] obj : monthly) {
			months.add(((Number) obj[0]).intValue()); // safer casting
			counts.add(((Number) obj[1]).longValue());
		}

		model.addAttribute("months", months);
		model.addAttribute("counts", counts);

		// ================= 🥧 STATUS CHART =================
		List<Object[]> statusList = donationService.getDonationStatusCounts();

		List<String> statusLabels = new ArrayList<>();
		List<Long> statusCounts = new ArrayList<>();

		for (Object[] obj : statusList) {
			statusLabels.add((String) obj[0]);
			statusCounts.add(((Number) obj[1]).longValue());
		}

		model.addAttribute("statusLabels", statusLabels);
		model.addAttribute("statusCounts", statusCounts);

		return "reports-analytics";
	}

	@GetMapping("/profile")
	public String profilePage(HttpSession session, Model model) {

		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null) {
			return "redirect:/login";
		}

		User donor = userService.findByEmail(loggedUser.getEmail());
		model.addAttribute("donor", donor);

		return "profile"; // profile.jsp
	}

	@PostMapping("/updateProfile")
	public String updateProfile(@RequestParam String name, @RequestParam String phone, @RequestParam String address,
			HttpSession session) {
		User loggedUser = (User) session.getAttribute("loggedUser");

		if (loggedUser == null) {
			return "redirect:/login";
		}

		User user = userService.findByEmail(loggedUser.getEmail());

		user.setName(name);
		user.setPhone(phone);
		user.setAddress(address);

		userService.updateUser(user);

		session.setAttribute("loggedUser", user);

		return "redirect:/profile";
	}
	@GetMapping("/admindashboard")
	public String adminDashboard() {
		return "admin-dashboard";
	}
}