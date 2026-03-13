package com.example.foodapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.foodapp.model.User;
import com.example.foodapp.repository.UserRepo;
import com.example.foodapp.service.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserRepo repo;
	
	@Autowired
	private UserService service;
	//Display Home page
	@GetMapping("/")
    public String home() {
	return "home";
    }
	
	//Display Login page
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	//Display  register page
	@GetMapping("/register")
	public String register() {
		return "register";
	}
	
	//Display Forgot password page
	@GetMapping("/forgotPassword")
	public String forgotPass() {
		return "forgotPassword";
	}
	
	//Display accept donation page
	@GetMapping("/accept")
	public String acceptDonation() {
		return "acceptDonation";
	}
	
	//Display add surplus food page
	@GetMapping("/add")
	public String addSurplusfood() {
		return "addSurplusfood";
	}
	
	//Display admin dashboard page
	@GetMapping("/admin")
	public String adminDashboard() {
		return "adminDashboard";
	}
	
	//Display donation status page
	@GetMapping("/donationstatus")
	public String donationStatus() {
		return "donation-satus";
	}
	
	//Display donor dashboaard page
	@GetMapping("/donor")
	public String donorDashboard() {
		return "donor-dashboard";
	}
	
	//Display edit donation page
	@GetMapping("/editdonation")
	public String editDonation() {
		return "editDonation";
	}
	
	//Display edit user page
	@GetMapping("/edituser")
	public String editUser() {
		return "editUser";
	}
	
	//Display  manage donation page
	@GetMapping("/managedonation")
	public String manageDonation() {
		return "manageDonation";
	}
	
	//Display manage donation-admin page
	@GetMapping("/managedonation-admin")
	public String manageDonationAdmin() {
		return "manageDonation-admin";
	}
	
	//Display manage user page
	@GetMapping("/manageuser")
	public String manageUser() {
		return "manageUsers";
	}
	
	//Display ngo dashboard page
	@GetMapping("/ngo")
	public String ngoDashboard() {
		return "ngo-dashboard";
	}
	
	//Display pickup page
	@GetMapping("/pickup")
	public String pickup() {
		return "pickup";
	}
	
	//Display profile page
	@GetMapping("/profile")
	public String profile() {
		return "profile";
	}
	
	//Display report analytics page
	@GetMapping("/reportanalytics")
	public String reportAnalytics() {
		return "report-analytics";
	}
	
	//Display search food page
	@GetMapping("/search")
	public String searchFood() {
		return "search-food";
	}
	
	//Display settings page
	@GetMapping("/settings")
	public String settings() {
		return "settings";
	}
	
	//Display view donation page
	@GetMapping("/viewdonation")
	public String viewDonation() {
		return "viewDonation";
	}
	
	
	//Display view map page
	@GetMapping("/viewmap")
	public String viewMap() {
		return "view-map";
	}
	
	//Display view user page
	@GetMapping("/viewuser")
	public String viewUser() {
		return "viewUser";
	}
	
	//Display access denied page
	@GetMapping("/accessdenied")
	public String accessDenied() {
		return "accessdenied";
	}
	
	//Display view user page
	@GetMapping("/notification")
	public String notification() {
		return "notification-status";
	}
	@PostMapping("/register")
		public String registerUser(User user) {
			repo.save(user);
			return "register";
		}
	@PostMapping("/login")
	public String loginUser(@RequestParam String email,
	                        @RequestParam String password,
	                        @RequestParam String role,
	                        Model model) {

	    User user = service.authenticate(email, password);

	    if(user != null) {

	        model.addAttribute("name", user.getName());

	        if(role.equals("donor")) {
	            return "donor-dashboard";
	        }
	        else if(role.equals("ngo")) {
	            return "ngo-dashboard";
	        }
	        else if(role.equals("admin")) {
	            return "adminDashboard";
	        }
	    }

	    return "login";
	}
}


