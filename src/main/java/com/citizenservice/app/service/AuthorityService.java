package com.citizenservice.app.service;

import java.util.List;

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.MarriageCertificate;

public interface AuthorityService {
	
	
	List<BirthCertificate> findAllBirthCertificates();
	List<DeathCertificate> findAllDeathCertificates();
	List<MarriageCertificate> findAllMarriageCertificates();

}
