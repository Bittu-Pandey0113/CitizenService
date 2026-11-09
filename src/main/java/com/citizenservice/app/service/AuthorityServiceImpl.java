package com.citizenservice.app.service;

import java.util.List;

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.Role;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.MarriageCertificate;
public class AuthorityServiceImpl implements AuthorityService {
	
	/*
	 * @Override public List<Role> findAllActiveRole() { return
	 * roleRepository.findAllActiveRole();
	 */
		//@Override
		//List<BirthCertificate> findAllBirthCertificates();

	@Override
	public
	List<MarriageCertificate> findAllMarriageCertificates(){
		return null;
	}

	@Override
	public List<BirthCertificate> findAllBirthCertificates() {
		return null;
	}

	@Override
	public List<DeathCertificate> findAllDeathCertificates() {
		return null;
	}}
