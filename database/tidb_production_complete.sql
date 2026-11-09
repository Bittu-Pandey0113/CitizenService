-- =====================================================================
-- CITIZEN SERVICE PORTAL - PRODUCTION DATABASE SCRIPT (MySQL & TiDB)
-- Database: citizen_service
-- Fully Compatible with TiDB Serverless & MySQL 8.0+
-- =====================================================================

CREATE DATABASE IF NOT EXISTS `citizen_service`;
USE `citizen_service`;

-- Disable foreign key checks for clean sequential creation
SET FOREIGN_KEY_CHECKS = 0;

-- -----------------------------------------------------
-- Table: user
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `st` varchar(20) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `deleted` varchar(20) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `otp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `uk_user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: role
-- -----------------------------------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_type` varchar(50) NOT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `deleted` varchar(20) DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` bigint DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `uk_role_type` (`role_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: user_role
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_role_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `fk_user_role_user` (`user_id`),
  KEY `fk_user_role_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: birth_certificate
-- -----------------------------------------------------
DROP TABLE IF EXISTS `birth_certificate`;
CREATE TABLE `birth_certificate` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `child_name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `birth_place` varchar(100) NOT NULL,
  `birth_proof` varchar(255) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `id_proof_father` varchar(255) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `id_proof_mother` varchar(255) NOT NULL,
  `marriage_certificate` varchar(500) DEFAULT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(500) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pin_code` varchar(20) NOT NULL,
  `father_sign` varchar(255) NOT NULL,
  `mother_sign` varchar(255) NOT NULL,
  `st` varchar(45) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_birth_cert_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: death_certificate
-- -----------------------------------------------------
DROP TABLE IF EXISTS `death_certificate`;
CREATE TABLE `death_certificate` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `deceased_name` varchar(100) NOT NULL,
  `father_husband_name` varchar(500) NOT NULL,
  `dob` varchar(20) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dod` varchar(20) NOT NULL,
  `cause` varchar(100) NOT NULL,
  `place_of_death` varchar(100) NOT NULL,
  `death_proof` varchar(255) NOT NULL,
  `address` varchar(500) NOT NULL,
  `police_station` varchar(100) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `pin` varchar(20) NOT NULL,
  `applicant_name` varchar(100) NOT NULL,
  `id_proof` varchar(255) NOT NULL,
  `relation` varchar(100) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `address_of_applicant` varchar(500) NOT NULL,
  `police_station_of_applicant` varchar(100) NOT NULL,
  `dist_of_applicant` varchar(50) NOT NULL,
  `state_of_applicant` varchar(50) NOT NULL,
  `country_of_applicant` varchar(50) NOT NULL,
  `pin_of_applicant` varchar(20) NOT NULL,
  `applicant_sign` varchar(255) NOT NULL,
  `user` bigint NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_death_cert_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: marriage_certificate
-- -----------------------------------------------------
DROP TABLE IF EXISTS `marriage_certificate`;
CREATE TABLE `marriage_certificate` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `groom_name` varchar(500) NOT NULL,
  `groom_id_proof` varchar(300) NOT NULL,
  `groom_photo` varchar(300) NOT NULL,
  `groom_father` varchar(500) NOT NULL,
  `groom_mother` varchar(500) NOT NULL,
  `groom_dob` varchar(30) NOT NULL,
  `groom_religion` varchar(100) NOT NULL,
  `groom_mobile` varchar(15) NOT NULL,
  `groom_email` varchar(100) NOT NULL,
  `groom_address` varchar(500) NOT NULL,
  `groom_dist` varchar(50) NOT NULL,
  `groom_state` varchar(50) DEFAULT NULL,
  `groom_country` varchar(50) NOT NULL,
  `groom_pin` varchar(20) NOT NULL,
  `groom_witness_name` varchar(500) NOT NULL,
  `groom_witness_id` varchar(300) NOT NULL,
  `groom_witness_mobile` varchar(15) NOT NULL,
  `groom_witness_relation` varchar(100) NOT NULL,
  `groom_witness_address` varchar(500) NOT NULL,
  `bride_name` varchar(500) NOT NULL,
  `bride_id_proof` varchar(300) NOT NULL,
  `bride_photo` varchar(300) NOT NULL,
  `bride_father` varchar(500) NOT NULL,
  `bride_mother` varchar(500) NOT NULL,
  `bride_dob` varchar(30) NOT NULL,
  `bride_religion` varchar(100) NOT NULL,
  `bride_mobile` varchar(15) NOT NULL,
  `bride_email` varchar(100) NOT NULL,
  `bride_address` varchar(500) NOT NULL,
  `bride_dist` varchar(50) NOT NULL,
  `bride_state` varchar(50) DEFAULT NULL,
  `bride_country` varchar(50) NOT NULL,
  `bride_pin` varchar(20) NOT NULL,
  `bride_witness_name` varchar(500) NOT NULL,
  `bride_witness_id` varchar(300) NOT NULL,
  `bride_witness_mobile` varchar(15) NOT NULL,
  `bride_witness_relation` varchar(100) NOT NULL,
  `bride_witness_address` varchar(500) NOT NULL,
  `marriage_date` varchar(50) NOT NULL,
  `marriage_type` varchar(100) NOT NULL,
  `marriage_proof` varchar(300) NOT NULL,
  `groom_sign` varchar(300) NOT NULL,
  `bride_sign` varchar(300) NOT NULL,
  `groom_witness_sign` varchar(300) NOT NULL,
  `bride_witness_sign` varchar(300) NOT NULL,
  `user` bigint NOT NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`application_id`),
  KEY `fk_marriage_cert_user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table: test_upload
-- -----------------------------------------------------
DROP TABLE IF EXISTS `test_upload`;
CREATE TABLE `test_upload` (
  `application_id` bigint NOT NULL AUTO_INCREMENT,
  `upload_file` varchar(250) NOT NULL,
  PRIMARY KEY (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Seed: Roles
-- -----------------------------------------------------
INSERT INTO `role` (`role_id`, `role_type`, `remark`, `deleted`, `created_on`) VALUES
(1, 'Admin', 'System Administrator', NULL, NOW()),
(2, 'user', 'General Citizen', NULL, NOW()),
(4, 'Authority', 'Citizen Portal Authority', NULL, NOW())
ON DUPLICATE KEY UPDATE `role_type` = VALUES(`role_type`), `deleted` = NULL;

-- -----------------------------------------------------
-- Seed: Users (Password: admin -> $2a$10$wK1VfTjNq5m4G9f0u5d7hOq2T3r1s4v5w6x7y8z9a0b1c2d3e4f5g)
-- Standard Spring Security BCrypt Hash for 'admin':
-- $2a$10$VVX6/wzLd0QAcC67pAh7jui9Zg0i8uRR8f7f2XQOLXz4mhB90f14m
-- -----------------------------------------------------
INSERT INTO `user` (`user_id`, `user_name`, `password`, `mobile_no`, `st`, `remark`, `deleted`, `name`, `email`, `address`, `created_on`) VALUES
(1, 'admin', '$2a$10$VVX6/wzLd0QAcC67pAh7jui9Zg0i8uRR8f7f2XQOLXz4mhB90f14m', '9999999999', 'ACTIVE', 'Admin Account', NULL, 'System Administrator', 'admin@citizenservice.gov', 'Bhubaneswar, Odisha', NOW()),
(2, 'bittu123', '$2a$10$VVX6/wzLd0QAcC67pAh7jui9Zg0i8uRR8f7f2XQOLXz4mhB90f14m', '7856451263', 'ACTIVE', 'Citizen Account', NULL, 'Bittu Pandey', 'bittu123@citizenservice.gov', 'Bardhaman, West Bengal', NOW()),
(3, 'shu789', '$2a$10$VVX6/wzLd0QAcC67pAh7jui9Zg0i8uRR8f7f2XQOLXz4mhB90f14m', '8888888888', 'ACTIVE', 'Authority Account', NULL, 'Portal Officer', 'authority@citizenservice.gov', 'Cuttack, Odisha', NOW())
ON DUPLICATE KEY UPDATE
  `password` = VALUES(`password`),
  `deleted` = NULL,
  `st` = 'ACTIVE';

-- -----------------------------------------------------
-- Seed: User Roles
-- -----------------------------------------------------
INSERT INTO `user_role` (`user_role_id`, `user_id`, `role_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 4)
ON DUPLICATE KEY UPDATE `role_id` = VALUES(`role_id`);

-- -----------------------------------------------------
-- Seed: Sample Certificates (Approved for testing & verification)
-- -----------------------------------------------------
INSERT INTO `birth_certificate` (`application_id`, `child_name`, `gender`, `dob`, `birth_place`, `birth_proof`, `father_name`, `id_proof_father`, `mother_name`, `id_proof_mother`, `marriage_certificate`, `mobile_no`, `email`, `address`, `dist`, `state`, `country`, `pin_code`, `father_sign`, `mother_sign`, `st`, `user_id`) VALUES
(1, 'Aarav Pandey', 'male', '15/08/2020', 'Apollo Hospital, Bhubaneswar', 'birth_proof.pdf', 'Bittu Pandey', 'father_aadhaar.pdf', 'Ananya Pandey', 'mother_aadhaar.pdf', 'marriage_cert.pdf', '7856451263', 'bittu123@citizenservice.gov', 'Plot 12, Sahid Nagar', 'Khordha', 'Odisha', 'India', '751007', 'sign_father.png', 'sign_mother.png', 'APPROVED', 2)
ON DUPLICATE KEY UPDATE `st` = 'APPROVED';

INSERT INTO `death_certificate` (`application_id`, `deceased_name`, `father_husband_name`, `dob`, `gender`, `dod`, `cause`, `place_of_death`, `death_proof`, `address`, `police_station`, `dist`, `state`, `country`, `pin`, `applicant_name`, `id_proof`, `relation`, `mobile`, `address_of_applicant`, `police_station_of_applicant`, `dist_of_applicant`, `state_of_applicant`, `country_of_applicant`, `pin_of_applicant`, `applicant_sign`, `user`, `status`) VALUES
(1, 'Rameshwar Pandey', 'Harihar Pandey', '10/04/1945', 'male', '20/11/2021', 'Natural / Age related', 'Home, Bardhaman', 'death_proof.pdf', 'Village Kalyanpur', 'Bardhaman Sadar', 'Bardhaman', 'West Bengal', 'India', '713101', 'Bittu Pandey', 'applicant_aadhaar.pdf', 'Grandson', '7856451263', 'Village Kalyanpur', 'Bardhaman Sadar', 'Bardhaman', 'West Bengal', 'India', '713101', 'applicant_sign.png', 2, 'APPROVED')
ON DUPLICATE KEY UPDATE `status` = 'APPROVED';

INSERT INTO `marriage_certificate` (`application_id`, `groom_name`, `groom_id_proof`, `groom_photo`, `groom_father`, `groom_mother`, `groom_dob`, `groom_religion`, `groom_mobile`, `groom_email`, `groom_address`, `groom_dist`, `groom_state`, `groom_country`, `groom_pin`, `groom_witness_name`, `groom_witness_id`, `groom_witness_mobile`, `groom_witness_relation`, `groom_witness_address`, `bride_name`, `bride_id_proof`, `bride_photo`, `bride_father`, `bride_mother`, `bride_dob`, `bride_religion`, `bride_mobile`, `bride_email`, `bride_address`, `bride_dist`, `bride_state`, `bride_country`, `bride_pin`, `bride_witness_name`, `bride_witness_id`, `bride_witness_mobile`, `bride_witness_relation`, `bride_witness_address`, `marriage_date`, `marriage_type`, `marriage_proof`, `groom_sign`, `bride_sign`, `groom_witness_sign`, `bride_witness_sign`, `user`, `status`) VALUES
(1, 'Bittu Pandey', 'groom_aadhaar.pdf', 'groom.jpg', 'Suresh Pandey', 'Sunita Pandey', '12/03/1995', 'Hindu', '7856451263', 'bittu123@citizenservice.gov', 'Bardhaman, West Bengal', 'Bardhaman', 'West Bengal', 'India', '713101', 'Rohan Das', 'witness1.pdf', '9876543210', 'Friend', 'Bardhaman', 'Pooja Sharma', 'bride_aadhaar.pdf', 'bride.jpg', 'Rajesh Sharma', 'Geeta Sharma', '24/07/1997', 'Hindu', '9432109876', 'pooja@citizenservice.gov', 'Kolkata, West Bengal', 'Kolkata', 'West Bengal', 'India', '700001', 'Sneha Sen', 'witness2.pdf', '9123456780', 'Sister', 'Kolkata', '18/02/2022', 'Hindu Marriage Act', 'marriage_proof.pdf', 'groom_sign.png', 'bride_sign.png', 'w1_sign.png', 'w2_sign.png', 2, 'APPROVED')
ON DUPLICATE KEY UPDATE `status` = 'APPROVED';

SET FOREIGN_KEY_CHECKS = 1;

-- Verification query
SHOW TABLES;
SELECT user_id, user_name, name, deleted, remark FROM `user`;
SELECT role_id, role_type, remark FROM `role`;
