package com.citizenservice.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.citizenservice.app.model.User;

public interface TestUploadRepository extends JpaRepository<User, Long> { 

}
