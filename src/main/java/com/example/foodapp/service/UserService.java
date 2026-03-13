package com.example.foodapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.foodapp.model.User;
import com.example.foodapp.repository.UserRepository;

@Service
public class UserService {

    @Autowired
    private UserRepository repo;

    // LOGIN
    public User authenticateUser(String email, String password) {

        User existingUser = repo.findByEmail(email);

        if (existingUser != null && existingUser.getPassword().equals(password)) {
            return existingUser;
        }

        return null;
    }

    // REGISTER

    public boolean registerUser(User user) {

        // check email first
        User existingUser = repo.findByEmail(user.getEmail());

        if (existingUser != null) {
            return false;   // duplicate email
        }

        repo.save(user);
        return true;
    }
}


