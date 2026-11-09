package com.citizenservice.app.service;

import java.util.List;
/*import java.util.Optional;*/

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

/*import org.springframework.web.multipart.MultipartFile;*/

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.MarriageCertificate;
import com.citizenservice.app.model.User;
import com.citizenservice.app.model.UserRole;

public interface UserService {

	User getUserForLogin(String userName, String password);

	UserRole getUserRoleByUserId(Long userId);

	User changePassword(Long userId, String oldPassword, String newPassword);

	User editProfile(Long userId, String name, String mobileNumber, String emailId, String address);

	User getUserByUserNameAndMobileNumber(String userName, String mobileNumber);

	User saveOtpForForgotPassword(User existingUser, String otp);

	User getUserRoleById(Long userId);

	User matchOtp(String otp);

	User changePasswordForForgotCasePost(User existingUser, String password);    
	
	//public String saveImage(MultipartFile uploadFile,HttpServletRequest req) throws Exception;
	
	List<BirthCertificate> findAllBirthCertificates();
	/* User saveBirthCertificate(String name);*/
	void findOneBirthCertificate(long appId);
	User saveBirthCertificate(String cName, String gender, String dOB, String birthPlace,
			String birthProof, String fName, String idProofFather, String mName, String idProofMother,
			String marriageCertificate, String mobileNumber, String emailId, String address, String dist, String state,
			String country, String pinCode, String signFather, String signMother, User user)throws Exception;
	
	/*User saveBirthCertificate(String cName, String gender, String dOB, String birthPlace,
			MultipartFile birthProof, String fName, String idProofFather, String mName, String idProofMother,
			String marriageCertificate, String mobileNumber, String emailId, String address, String dist, String state,
			String country, String pinCode, String signFather, String signMother, User user,HttpServletRequest request) throws Exception;*/

	//BirthCertificate getApplicationStatusByCurrentUser(User user);
	
	List<DeathCertificate> findAllDeathCertificates();
	//User saveDeathCertificate(String name);
	void findOneDeathCertificate(long appId);
	User saveDeathCertificate(String name, String fName, String gender, String
	 dOB, String deathDate, String deathCause, String deathPlace, String
	  deathProofFile, String address, String policeStation, String dist, String
	  state, String country, String pinCode,String aName, String idProofApplicant,
	 String relation, String mobileNumber, String aAddress, String aPoliceStation,
	 String aDist, String aState, String aCountry, String aPinCode, String
	  signApplicant, User user);

	
	//DeathCertificate getApplicationStatusByCurrentUser1(User user);
	List<MarriageCertificate> findAllMarriageCertificates();
	void findOneMarriageCertificate(long appId);
	  User saveMarriageCertificate(String groomName, String groomIdProof, String
	  groomPhoto, String groomFather, String groomMother, String gDOB, String
	  gReligion, String gMobile, String gEmail, String gAddress, String gDist,
	  String gState, String gCountry, String gPin, String gWitness, String
	  gWitnessId, String gWitnessMobile, String gWitnessRelation, String
	  gWitnessAddress, String brideName, String brideIdProof, String bridePhoto,
	  String brideFather, String brideMother, String bDOB, String bReligion, String
	  bMobile, String bEmail, String bAddress, String bDist, String bState, String
	  bCountry, String bPin, String bWitness, String bWitnessId, String
	  bWitnessMobile, String bWitnessRelation, String bWitnessAddress, String
	  marriageDate, String marriageType, String marriageProof, String groomSign,
	  String brideSign, String gWitnessSign, String bWitnessSign,User user);
	 


	BirthCertificate getBirthApplicationStatusByCurrentUser(User user);
	DeathCertificate getDeathApplicationStatusByCurrentUser(User user);
	MarriageCertificate getMarriageApplicationStatusByCurrentUser(User user);

	



	 
	 
	
	
}
