package com.example.foodapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.foodapp.model.User;

public interface UserRepo extends JpaRepository<User,Integer> {
	User findByEmailAndPassword(String email,String password);

}
