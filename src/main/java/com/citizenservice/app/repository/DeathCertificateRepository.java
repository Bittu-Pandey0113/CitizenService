package com.citizenservice.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.Role;

public interface DeathCertificateRepository extends JpaRepository <DeathCertificate, Long>{
	
	
	  @Query("FROM DeathCertificate WHERE deathCertificateApplicationId=:appId")
	  DeathCertificate findDeathCertificateByAppId(@Param("appId")Long appId);
	  
	  @Query("FROM DeathCertificate WHERE userId.userId=:userId") 
	  DeathCertificate findByUserId(@Param("userId")Long userId);
	 
	
 
}
