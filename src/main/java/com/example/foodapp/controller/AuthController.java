package com.example.foodapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.example.foodapp.model.User;

@Controller
public class AuthController {

	// Show home Page
	@GetMapping("/")
	public String HomePage() {
		return "home";
	}

	// Show login Page
	@GetMapping("/login")
	public String LoginPage() {
		return "login";
	}

	// Show register Page
	@GetMapping("/register")
	public String RegisterPage() {
		return "register";
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
