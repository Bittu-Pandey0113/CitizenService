package com.citizenservice.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.citizenservice.app.model.MarriageCertificate;

public interface MarriageCertificateRepository extends JpaRepository <MarriageCertificate, Long>{

	/*
	 * void save(MarriageCertificate marriageCertificate);
	 * 
	 * List<MarriageCertificate> findAll();
	 * 
	 * MarriageCertificate findMarriageCertificateByAppId(long appId);
	 * 
	 * MarriageCertificate findByUserId(Long userId);
	 */
	

	
	  @Query("FROM MarriageCertificate WHERE marriageCertificateApplicationId=:appId")
	  MarriageCertificate findMarriageCertificateByAppId(@Param("appId")Long appId);
	  
	  @Query("FROM MarriageCertificate WHERE userId.userId=:userId") MarriageCertificate
	  findByUserId(@Param("userId")Long userId);
	 
	 

}
