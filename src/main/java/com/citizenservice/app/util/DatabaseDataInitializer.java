package com.citizenservice.app.util;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.MarriageCertificate;
import com.citizenservice.app.model.Role;
import com.citizenservice.app.model.User;
import com.citizenservice.app.model.UserRole;
import com.citizenservice.app.repository.BirthCertificateRepository;
import com.citizenservice.app.repository.DeathCertificateRepository;
import com.citizenservice.app.repository.MarriageCertificateRepository;
import com.citizenservice.app.repository.RoleRepository;
import com.citizenservice.app.repository.UserRepository;
import com.citizenservice.app.repository.UserRoleRepository;

/**
 * Self-healing database bootstrapper.
 * Executes asynchronously on ApplicationReadyEvent so it never delays
 * Tomcat HTTP port binding or triggers Render 502 timeouts.
 */
@Component
public class DatabaseDataInitializer {

	private static final Logger log = LoggerFactory.getLogger(DatabaseDataInitializer.class);

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private RoleRepository roleRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserRoleRepository userRoleRepository;

	@Autowired
	private BirthCertificateRepository birthCertificateRepository;

	@Autowired
	private DeathCertificateRepository deathCertificateRepository;

	@Autowired
	private MarriageCertificateRepository marriageCertificateRepository;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@EventListener(ApplicationReadyEvent.class)
	public void onApplicationReady() {
		Thread initThread = new Thread(() -> {
			try {
				// Brief pause to allow embedded Tomcat to complete HTTP handshake
				Thread.sleep(1500);
				log.info("Starting background DatabaseDataInitializer...");
				ensureTablesExist();
				seedRolesAndUsers();
				seedSampleCertificates();
				log.info("DatabaseDataInitializer completed successfully.");
			} catch (Exception e) {
				log.warn("DatabaseDataInitializer note: {}", e.getMessage());
			}
		}, "db-init-worker");
		initThread.setDaemon(true);
		initThread.start();
	}

	private void ensureTablesExist() {
		try {
			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `user` (" +
					"`user_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`user_name` varchar(50) NOT NULL, " +
					"`password` varchar(128) NOT NULL, " +
					"`mobile_no` varchar(20) DEFAULT NULL, " +
					"`st` varchar(20) DEFAULT NULL, " +
					"`created_by` bigint DEFAULT NULL, " +
					"`created_on` datetime DEFAULT NULL, " +
					"`updated_by` bigint DEFAULT NULL, " +
					"`updated_on` datetime DEFAULT NULL, " +
					"`remark` varchar(100) DEFAULT NULL, " +
					"`deleted` varchar(20) DEFAULT NULL, " +
					"`name` varchar(100) DEFAULT NULL, " +
					"`email` varchar(100) DEFAULT NULL, " +
					"`address` varchar(500) DEFAULT NULL, " +
					"`otp` varchar(45) DEFAULT NULL, " +
					"PRIMARY KEY (`user_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `role` (" +
					"`role_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`role_type` varchar(50) NOT NULL, " +
					"`remark` varchar(100) DEFAULT NULL, " +
					"`deleted` varchar(20) DEFAULT NULL, " +
					"`created_by` bigint DEFAULT NULL, " +
					"`created_on` datetime DEFAULT NULL, " +
					"`updated_by` bigint DEFAULT NULL, " +
					"`updated_on` datetime DEFAULT NULL, " +
					"PRIMARY KEY (`role_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `user_role` (" +
					"`user_role_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`user_id` bigint NOT NULL, " +
					"`role_id` bigint NOT NULL, " +
					"PRIMARY KEY (`user_role_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `birth_certificate` (" +
					"`application_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`child_name` varchar(100) DEFAULT NULL, " +
					"`gender` varchar(20) DEFAULT NULL, " +
					"`dob` varchar(30) DEFAULT NULL, " +
					"`birth_place` varchar(200) DEFAULT NULL, " +
					"`birth_proof` varchar(255) DEFAULT NULL, " +
					"`father_name` varchar(100) DEFAULT NULL, " +
					"`id_proof_father` varchar(255) DEFAULT NULL, " +
					"`mother_name` varchar(100) DEFAULT NULL, " +
					"`id_proof_mother` varchar(255) DEFAULT NULL, " +
					"`marriage_certificate` varchar(500) DEFAULT NULL, " +
					"`mobile_no` varchar(20) DEFAULT NULL, " +
					"`email` varchar(100) DEFAULT NULL, " +
					"`address` varchar(500) DEFAULT NULL, " +
					"`dist` varchar(50) DEFAULT NULL, " +
					"`state` varchar(50) DEFAULT NULL, " +
					"`country` varchar(50) DEFAULT NULL, " +
					"`pin_code` varchar(20) DEFAULT NULL, " +
					"`father_sign` varchar(255) DEFAULT NULL, " +
					"`mother_sign` varchar(255) DEFAULT NULL, " +
					"`st` varchar(45) DEFAULT NULL, " +
					"`user_id` bigint DEFAULT NULL, " +
					"PRIMARY KEY (`application_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `death_certificate` (" +
					"`application_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`deceased_name` varchar(100) DEFAULT NULL, " +
					"`father_husband_name` varchar(500) DEFAULT NULL, " +
					"`dob` varchar(30) DEFAULT NULL, " +
					"`gender` varchar(20) DEFAULT NULL, " +
					"`dod` varchar(30) DEFAULT NULL, " +
					"`cause` varchar(200) DEFAULT NULL, " +
					"`place_of_death` varchar(200) DEFAULT NULL, " +
					"`death_proof` varchar(255) DEFAULT NULL, " +
					"`address` varchar(500) DEFAULT NULL, " +
					"`police_station` varchar(100) DEFAULT NULL, " +
					"`dist` varchar(50) DEFAULT NULL, " +
					"`state` varchar(50) DEFAULT NULL, " +
					"`country` varchar(50) DEFAULT NULL, " +
					"`pin` varchar(20) DEFAULT NULL, " +
					"`applicant_name` varchar(100) DEFAULT NULL, " +
					"`id_proof` varchar(255) DEFAULT NULL, " +
					"`relation` varchar(100) DEFAULT NULL, " +
					"`mobile` varchar(20) DEFAULT NULL, " +
					"`address_of_applicant` varchar(500) DEFAULT NULL, " +
					"`police_station_of_applicant` varchar(100) DEFAULT NULL, " +
					"`dist_of_applicant` varchar(50) DEFAULT NULL, " +
					"`state_of_applicant` varchar(50) DEFAULT NULL, " +
					"`country_of_applicant` varchar(50) DEFAULT NULL, " +
					"`pin_of_applicant` varchar(20) DEFAULT NULL, " +
					"`applicant_sign` varchar(255) DEFAULT NULL, " +
					"`user` bigint DEFAULT NULL, " +
					"`status` varchar(45) DEFAULT NULL, " +
					"PRIMARY KEY (`application_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `marriage_certificate` (" +
					"`application_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`groom_name` varchar(500) DEFAULT NULL, " +
					"`groom_id_proof` varchar(300) DEFAULT NULL, " +
					"`groom_photo` varchar(300) DEFAULT NULL, " +
					"`groom_father` varchar(500) DEFAULT NULL, " +
					"`groom_mother` varchar(500) DEFAULT NULL, " +
					"`groom_dob` varchar(30) DEFAULT NULL, " +
					"`groom_religion` varchar(100) DEFAULT NULL, " +
					"`groom_mobile` varchar(20) DEFAULT NULL, " +
					"`groom_email` varchar(100) DEFAULT NULL, " +
					"`groom_address` varchar(500) DEFAULT NULL, " +
					"`groom_dist` varchar(50) DEFAULT NULL, " +
					"`groom_state` varchar(50) DEFAULT NULL, " +
					"`groom_country` varchar(50) DEFAULT NULL, " +
					"`groom_pin` varchar(20) DEFAULT NULL, " +
					"`groom_witness_name` varchar(500) DEFAULT NULL, " +
					"`groom_witness_id` varchar(300) DEFAULT NULL, " +
					"`groom_witness_mobile` varchar(20) DEFAULT NULL, " +
					"`groom_witness_relation` varchar(100) DEFAULT NULL, " +
					"`groom_witness_address` varchar(500) DEFAULT NULL, " +
					"`bride_name` varchar(500) DEFAULT NULL, " +
					"`bride_id_proof` varchar(300) DEFAULT NULL, " +
					"`bride_photo` varchar(300) DEFAULT NULL, " +
					"`bride_father` varchar(500) DEFAULT NULL, " +
					"`bride_mother` varchar(500) DEFAULT NULL, " +
					"`bride_dob` varchar(30) DEFAULT NULL, " +
					"`bride_religion` varchar(100) DEFAULT NULL, " +
					"`bride_mobile` varchar(20) DEFAULT NULL, " +
					"`bride_email` varchar(100) DEFAULT NULL, " +
					"`bride_address` varchar(500) DEFAULT NULL, " +
					"`bride_dist` varchar(50) DEFAULT NULL, " +
					"`bride_state` varchar(50) DEFAULT NULL, " +
					"`bride_country` varchar(50) DEFAULT NULL, " +
					"`bride_pin` varchar(20) DEFAULT NULL, " +
					"`bride_witness_name` varchar(500) DEFAULT NULL, " +
					"`bride_witness_id` varchar(300) DEFAULT NULL, " +
					"`bride_witness_mobile` varchar(20) DEFAULT NULL, " +
					"`bride_witness_relation` varchar(100) DEFAULT NULL, " +
					"`bride_witness_address` varchar(500) DEFAULT NULL, " +
					"`marriage_date` varchar(50) DEFAULT NULL, " +
					"`marriage_type` varchar(100) DEFAULT NULL, " +
					"`marriage_proof` varchar(300) DEFAULT NULL, " +
					"`groom_sign` varchar(300) DEFAULT NULL, " +
					"`bride_sign` varchar(300) DEFAULT NULL, " +
					"`groom_witness_sign` varchar(300) DEFAULT NULL, " +
					"`bride_witness_sign` varchar(300) DEFAULT NULL, " +
					"`user` bigint DEFAULT NULL, " +
					"`status` varchar(45) DEFAULT NULL, " +
					"PRIMARY KEY (`application_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS `test_upload` (" +
					"`application_id` bigint NOT NULL AUTO_INCREMENT, " +
					"`upload_file` varchar(250) DEFAULT NULL, " +
					"PRIMARY KEY (`application_id`)" +
					") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;");

			log.info("Verified all core tables exist in database.");
		} catch (Exception e) {
			log.warn("Table auto-creation notice: {}", e.getMessage());
		}
	}

	private void seedRolesAndUsers() {
		// 1. Ensure Roles exist
		Role adminRole = getOrCreateRole("Admin", "Administrator");
		Role citizenRole = getOrCreateRole("user", "General Citizen");
		Role authorityRole = getOrCreateRole("Authority", "Citizen Portal Authority");

		// 2. Ensure default admin user is active with password 'admin'
		User adminUser = getOrCreateOrActivateUser("admin", "admin", "System Administrator",
				"admin@citizenservice.gov", "9999999999", "Bhubaneswar, Odisha", adminRole);

		// 3. Ensure 'bittu123' user is active with password 'admin'
		User bittuUser = getOrCreateOrActivateUser("bittu123", "admin", "Bittu Pandey",
				"bittu123@citizenservice.gov", "7856451263", "Bardhaman, West Bengal", citizenRole);

		// 4. Ensure 'shu789' authority user is active with password 'admin'
		getOrCreateOrActivateUser("shu789", "admin", "Portal Officer",
				"authority@citizenservice.gov", "8888888888", "Cuttack, Odisha", authorityRole);
	}

	private Role getOrCreateRole(String roleType, String remark) {
		List<Role> list = roleRepository.findByRoleType(roleType);
		if (list != null && !list.isEmpty()) {
			Role role = list.get(0);
			if (role.getDeleted() != null) {
				role.setDeleted(null);
				role = roleRepository.save(role);
			}
			return role;
		}
		Role newRole = new Role();
		newRole.setRoleType(roleType);
		newRole.setRemark(remark);
		newRole.setDeleted(null);
		newRole.setCreatedOn(new Date());
		return roleRepository.save(newRole);
	}

	private User getOrCreateOrActivateUser(String userName, String rawPassword, String fullName,
			String email, String mobileNo, String address, Role role) {
		User user = userRepository.getUserByUserName(userName);
		String encodedPassword = passwordEncoder.encode(rawPassword);

		if (user == null) {
			user = new User();
			user.setUserName(userName);
			user.setPassword(encodedPassword);
			user.setName(fullName);
			user.setEmail(email);
			user.setMobileNo(mobileNo);
			user.setAddress(address);
			user.setDeleted(null);
			user.setCreatedOn(new Date());
			user = userRepository.save(user);
			log.info("Created new user: {}", userName);
		} else {
			// Always ensure password is valid and account is NOT deleted
			user.setPassword(encodedPassword);
			user.setDeleted(null);
			if (user.getName() == null) {
				user.setName(fullName);
			}
			if (user.getEmail() == null) {
				user.setEmail(email);
			}
			if (user.getMobileNo() == null) {
				user.setMobileNo(mobileNo);
			}
			user = userRepository.save(user);
			log.info("Verified / refreshed active user: {}", userName);
		}

		// Ensure UserRole mapping is in place
		UserRole userRole = userRoleRepository.getUserRoleByUserId(user.getUserId());
		if (userRole == null) {
			userRole = new UserRole();
			userRole.setUserId(user);
			userRole.setRoleId(role);
			userRoleRepository.save(userRole);
			log.info("Assigned role '{}' to user '{}'", role.getRoleType(), userName);
		} else if (userRole.getRoleId() == null || !role.getRoleId().equals(userRole.getRoleId().getRoleId())) {
			userRole.setRoleId(role);
			userRoleRepository.save(userRole);
			log.info("Updated role for user '{}' to '{}'", userName, role.getRoleType());
		}

		return user;
	}

	private void seedSampleCertificates() {
		try {
			User adminUser = userRepository.getUserByUserName("admin");
			User bittuUser = userRepository.getUserByUserName("bittu123");
			User targetUser = bittuUser != null ? bittuUser : adminUser;

			if (targetUser == null) {
				return;
			}

			// Seed Birth Certificate if none exists
			if (birthCertificateRepository.count() == 0) {
				BirthCertificate bc = new BirthCertificate();
				bc.setUserId(targetUser);
				bc.setChildName("Aarav Pandey");
				bc.setGender("male");
				bc.setDob("15/08/2020");
				bc.setBirthPlace("Apollo Hospital, Bhubaneswar");
				bc.setBirthProof("birth_proof_aarav.pdf");
				bc.setfName("Bittu Pandey");
				bc.setIdProofFather("father_aadhaar.pdf");
				bc.setmName("Ananya Pandey");
				bc.setIdProofMother("mother_aadhaar.pdf");
				bc.setMarriageCertificate("marriage_proof.pdf");
				bc.setMobileNumber("7856451263");
				bc.setEmailId("bittu123@citizenservice.gov");
				bc.setAddress("Plot 12, Sahid Nagar");
				bc.setDist("Khordha");
				bc.setState("Odisha");
				bc.setCountry("India");
				bc.setPinCode("751007");
				bc.setSignFather("father_sign.png");
				bc.setSignMother("mother_sign.png");
				bc.setSt("APPROVED");
				birthCertificateRepository.save(bc);
				log.info("Seeded sample Birth Certificate for '{}'", targetUser.getUserName());
			}

			// Seed Death Certificate if none exists
			if (deathCertificateRepository.count() == 0) {
				DeathCertificate dc = new DeathCertificate();
				dc.setUserId(targetUser);
				dc.setDeceasedName("Rameshwar Pandey");
				dc.setfName("Harihar Pandey");
				dc.setDob("10/04/1945");
				dc.setGender("male");
				dc.setDeathDate("20/11/2021");
				dc.setDeathCause("Natural / Age related");
				dc.setDeathPlace("Home, Bardhaman");
				dc.setDeathProofFile("hospital_death_report.pdf");
				dc.setAddress("Village Kalyanpur");
				dc.setPoliceStation("Bardhaman Sadar");
				dc.setDist("Bardhaman");
				dc.setState("West Bengal");
				dc.setCountry("India");
				dc.setPinCode("713101");
				dc.setaName("Bittu Pandey");
				dc.setIdProofApplicant("applicant_aadhaar.pdf");
				dc.setRelation("Grandson");
				dc.setMobileNumber("7856451263");
				dc.setaAddress("Village Kalyanpur");
				dc.setaPoliceStation("Bardhaman Sadar");
				dc.setaDist("Bardhaman");
				dc.setaState("West Bengal");
				dc.setaCountry("India");
				dc.setaPinCode("713101");
				dc.setSignApplicant("applicant_sign.png");
				dc.setStat("APPROVED");
				deathCertificateRepository.save(dc);
				log.info("Seeded sample Death Certificate for '{}'", targetUser.getUserName());
			}

			// Seed Marriage Certificate if none exists
			if (marriageCertificateRepository.count() == 0) {
				MarriageCertificate mc = new MarriageCertificate();
				mc.setUserId(targetUser);
				mc.setGroomName("Bittu Pandey");
				mc.setGroomFather("Suresh Pandey");
				mc.setGroomMother("Sunita Pandey");
				mc.setGroomDob("12/03/1995");
				mc.setGroomReligion("Hindu");
				mc.setGroomMobile("7856451263");
				mc.setGroomEmail("bittu123@citizenservice.gov");
				mc.setGroomAddress("Bardhaman, West Bengal");
				mc.setGroomDist("Bardhaman");
				mc.setGroomState("West Bengal");
				mc.setGroomCountry("India");
				mc.setGroomPin("713101");
				mc.setGroomPhoto("groom_photo.jpg");
				mc.setGroomIdProof("groom_aadhaar.pdf");
				mc.setGroomSign("groom_sign.png");
				mc.setGroomWitnessName("Rohan Das");
				mc.setGroomWitnessMobile("9876543210");
				mc.setGroomWitnessRelation("Friend");
				mc.setGroomWitnessAddress("Bardhaman");
				mc.setGroomWitnessId("witness1_id.pdf");
				mc.setGroomWitnessSign("witness1_sign.png");

				mc.setBrideName("Pooja Sharma");
				mc.setBrideFather("Rajesh Sharma");
				mc.setBrideMother("Geeta Sharma");
				mc.setBrideDob("24/07/1997");
				mc.setBrideReligion("Hindu");
				mc.setBrideMobile("9432109876");
				mc.setBrideEmail("pooja@citizenservice.gov");
				mc.setBrideAddress("Kolkata, West Bengal");
				mc.setBrideDist("Kolkata");
				mc.setBrideState("West Bengal");
				mc.setBrideCountry("India");
				mc.setBridePin("700001");
				mc.setBridePhoto("bride_photo.jpg");
				mc.setBrideIdProof("bride_aadhaar.pdf");
				mc.setBrideSign("bride_sign.png");
				mc.setBrideWitnessName("Sneha Sen");
				mc.setBrideWitnessMobile("9123456780");
				mc.setBrideWitnessRelation("Sister");
				mc.setBrideWitnessAddress("Kolkata");
				mc.setBrideWitnessId("witness2_id.pdf");
				mc.setBrideWitnessSign("witness2_sign.png");

				mc.setMarriageDate("18/02/2022");
				mc.setMarriageType("Hindu Marriage Act");
				mc.setMarriageProof("marriage_invitation_priest_certificate.pdf");
				mc.setStatus("APPROVED");
				marriageCertificateRepository.save(mc);
				log.info("Seeded sample Marriage Certificate for '{}'", targetUser.getUserName());
			}
		} catch (Exception e) {
			log.warn("Sample certificates seeding note: {}", e.getMessage());
		}
	}
}
