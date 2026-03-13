package com.example.foodapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodapp.model.User;
import com.example.foodapp.repository.UserRepo;

@Service
public class UserService {
@Autowired
private UserRepo repo;
	public User authenticate(String email,String password) {
		User user=repo.findByEmailAndPassword(email,password);
	    return user;
	}
		}
	

