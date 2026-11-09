package com.citizenservice.app.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.CrudRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.MarriageCertificate;
import com.citizenservice.app.model.User;
import com.citizenservice.app.model.UserRole;
import com.citizenservice.app.repository.BirthCertificateRepository;
import com.citizenservice.app.repository.DeathCertificateRepository;
import com.citizenservice.app.repository.MarriageCertificateRepository;
import com.citizenservice.app.repository.TestUploadRepository;
import com.citizenservice.app.repository.UserRepository;
import com.citizenservice.app.repository.UserRoleRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserRoleRepository userRoleRepository;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private BirthCertificateRepository birthCertificateRepository;

	
	@Autowired 
    private DeathCertificateRepository deathCertificateRepository;
	 
	
	@Autowired
	private TestUploadRepository testUploadRepository;

	
	
	  @Autowired
	   private MarriageCertificateRepository marriageCertificateRepository;
	 
	/*
	 * @Autowired private CommonService commonService;
	 */
	/*
	 * @Autowired private MarriageCertificateRepository
	 * marriageCertificateRepository;
	 */

	@Override
	public User getUserForLogin(String userName, String password) {
		return userRepository.getUserForLogin(userName, password);
	}

	@Override
	public UserRole getUserRoleByUserId(Long userId) {
		return userRoleRepository.getUserRoleByUserId(userId);
	}

	@Override
	public User changePassword(Long userId, String oldPassword, String newPassword) {

		User user = userRepository.findById(userId).orElseThrow();
		User finalUser = null;
		if (bCryptPasswordEncoder.matches(oldPassword, user.getPassword())) {
			user.setPassword(bCryptPasswordEncoder.encode(newPassword));
			user.setUpdatedBy(user);
			user.setUpdatedOn(new Date());
			finalUser = userRepository.save(user);
		}

		return finalUser;
	}

	@Override
	public User editProfile(Long userId, String name, String mobileNumber, String emailId, String address) {

		User finalUser = null;
		User user = userRepository.findById(userId).orElseThrow();
		user.setName(name);
		user.setMobileNo(mobileNumber);
		user.setEmail(emailId);
		user.setAddress(address);
		user.setUpdatedBy(user);
		user.setUpdatedOn(new Date());
		finalUser = userRepository.save(user);

		return finalUser;
	}

	@Override
	public User getUserByUserNameAndMobileNumber(String userName, String mobileNumber) {
		return userRepository.getUserByUserNameAndMobileNumber(userName, mobileNumber);
	}

	@Override
	public User saveOtpForForgotPassword(User existingUser, String otp) {
		existingUser.setOtp(otp);
		return userRepository.save(existingUser);
	}

	@Override
	public User getUserRoleById(Long userId) {
		return userRepository.findById(userId).orElseThrow();
	}

	@Override
	public User matchOtp(String otp) {
		return userRepository.matchOtp(otp);
	}

	@Override
	public User changePasswordForForgotCasePost(User existingUser, String password) {

		existingUser.setPassword(bCryptPasswordEncoder.encode(password));
		existingUser.setOtp(null);
		User finalUser = userRepository.save(existingUser);

		return finalUser;
	}
	
	/*
	 * @Override public String saveImage(MultipartFile birthProof,HttpServletRequest
	 * req) throws Exception { String folder="c:/photos/"; byte[] bytes =
	 * birthProof.getBytes(); Path path =
	 * Paths.get(folder+birthProof.getOriginalFilename()); Files.write(path, bytes);
	 * return path.toString(); }
	 */

	@Override
	public User saveBirthCertificate(String cname, String gender, String dOB, String birthPlace,String birthProofFile,
			String fName, String idProofFather, String mName, String idProofMother, String marriageCertificate,
			String mobileNumber, String emailId, String address, String dist, String state, String country,
			String pinCode, String signFather, String signMother, User user) throws Exception {
	
	/*@Override
	 * public User saveBirthCertificate(String cname, String gender, String dOB, String birthPlace, MultipartFile birthProofFile,
			String fName, String idProofFather, String mName, String idProofMother, String marriageCertificate,
			String mobileNumber, String emailId, String address, String dist, String state, String country,
			String pinCode, String signFather, String signMother, User user, HttpServletRequest request) throws Exception{*/

		BirthCertificate birthCertificate = new BirthCertificate();
		birthCertificate.setChildName(cname);
		birthCertificate.setGender(gender);
		birthCertificate.setDob(dOB);
		birthCertificate.setBirthPlace(birthPlace);
		birthCertificate.setBirthProof(birthProofFile);
		//String path=saveImage(birthProofFile,request);
		//birthCertificate.setBirthProof(path);
		
		/*
		 * String folder="c:/photos/"; 
		 * byte[] bytes = uploadFile.getBytes();
		 *  Path path = Paths.get(folder+uploadFile.getOriginalFilename()); 
		 * Files.write(path, bytes);
		 */
		
		//birthCertificate.setBirthProof(commonService.saveImage(birthProofFile));
		birthCertificate.setfName(fName);
		birthCertificate.setIdProofFather(idProofFather);
		birthCertificate.setmName(mName);
		birthCertificate.setIdProofMother(idProofMother);
		birthCertificate.setMarriageCertificate(marriageCertificate);
		birthCertificate.setMobileNumber(mobileNumber);
		birthCertificate.setEmailId(emailId);
		birthCertificate.setAddress(address);
		birthCertificate.setDist(dist);
		birthCertificate.setState(state);
		birthCertificate.setCountry(country);
		birthCertificate.setPinCode(pinCode);
		birthCertificate.setSignFather(signFather);
		birthCertificate.setSignMother(signMother);
		birthCertificate.setUserId(user);
		birthCertificate.setSt("APPLIED");

		/*
		 * @Override public void saveImage(MultipartFile uploadFile) throws Exception {
		 * String folder="c:/photos/"; byte[] bytes = uploadFile.getBytes(); Path path =
		 * Paths.get(folder+uploadFile.getOriginalFilename()); Files.write(path, bytes);
		 * }
		 */
		
		
		
		/*
		 * System.out.println("the value is "+cname); System.out.println(" "+gender);
		 * System.out.println(" "+dOB); System.out.println(" "+birthPlace);
		 * System.out.println(" "+birthProofFile); System.out.println(" "+fName);
		 * System.out.println(" "+idProofFather); System.out.println(" "+mName);
		 * 
		 * System.out.println(" "+idProofMother);
		 * System.out.println(" "+marriageCertificate);
		 * System.out.println(" "+mobileNumber); System.out.println(" "+emailId);
		 * System.out.println(" "+address); System.out.println(" "+dist);
		 * System.out.println(" "+state); System.out.println(" "+country);
		 * System.out.println(" "+pinCode); System.out.println(" "+signFather);
		 * System.out.println(" "+signMother);
		 */

		birthCertificateRepository.save(birthCertificate);

		return null;
	}

	@Override
	public User saveDeathCertificate(String name, String fName, String dOB, String gender, String deathDate,
			String deathCause, String deathPlace, String deathProofFile, String address, String policeStation,
			String dist, String state, String country, String pinCode, String aName, String idProofApplicant,
			String relation, String mobileNumber, String aAddress, String aPoliceStation, String aDist, String aState,
			String aCountry, String aPinCode, String signApplicant, User user) {

		DeathCertificate deathCertificate = new DeathCertificate();
		deathCertificate.setDeceasedName(name);
		deathCertificate.setfName(fName);
		deathCertificate.setDob(dOB);
		deathCertificate.setGender(gender);
		deathCertificate.setDeathDate(deathDate);
		deathCertificate.setDeathCause(deathCause);
		deathCertificate.setDeathPlace(deathPlace);
		deathCertificate.setDeathProofFile(deathProofFile);
		deathCertificate.setAddress(address);
		deathCertificate.setPoliceStation(policeStation);
		deathCertificate.setDist(dist);
		deathCertificate.setState(state);
		deathCertificate.setCountry(country);
		deathCertificate.setPinCode(pinCode);
		deathCertificate.setaName(aName);
		deathCertificate.setIdProofApplicant(idProofApplicant);
		deathCertificate.setRelation(relation);
		deathCertificate.setMobileNumber(mobileNumber);
		deathCertificate.setaAddress(aAddress);
		deathCertificate.setaPoliceStation(aPoliceStation);
		deathCertificate.setaDist(aDist);
		deathCertificate.setaState(aState);
		deathCertificate.setaCountry(aCountry);
		deathCertificate.setaPinCode(aPinCode);
		deathCertificate.setSignApplicant(signApplicant);
		deathCertificate.setUserId(user);
		deathCertificate.setStat("APPLIED");

		/*
		 * System.out.println("the value is "+name); System.out.println(" "+fName);
		 * System.out.println(" "+dOB); System.out.println(" "+gender);
		 * System.out.println(" "+deathDate); System.out.println(" "+deathCause);
		 * System.out.println(" "+deathPlace); System.out.println(" "+deathProofFile);
		 * System.out.println(" "+address); System.out.println(" "+policeStation);
		 * System.out.println(" "+dist); System.out.println(" "+state);
		 * System.out.println(" "+country); System.out.println(" "+pinCode);
		 * System.out.println(" "+aName); System.out.println(" "+idProofApplicant);
		 * System.out.println(" "+relation); System.out.println(" "+mobileNumber);
		 * System.out.println(" "+aAddress); System.out.println(" "+aPoliceStation);
		 * System.out.println(" "+aDist); System.out.println(" "+aState);
		 * System.out.println(" "+aCountry); System.out.println(" "+aPinCode);
		 * System.out.println(" "+signApplicant);
		 */

		deathCertificateRepository.save(deathCertificate);

		return null;
	}

	@Override
	public List<BirthCertificate> findAllBirthCertificates() {

		List<BirthCertificate> b = new ArrayList<BirthCertificate>();

		b = birthCertificateRepository.findAll();
		return b;
	}

	@Override
	public void findOneBirthCertificate(long appId) {
		BirthCertificate b = birthCertificateRepository.findBirthCertificateByAppId(appId);
		b.setSt("APPROVED");
		birthCertificateRepository.save(b);

	}

	@Override
	public BirthCertificate getBirthApplicationStatusByCurrentUser(User user) {
		Long userId = user.getUserId();
		BirthCertificate b=null;
		
		 b= birthCertificateRepository.findByUserId(userId);
		return b;
	}

	@Override
	public List<DeathCertificate> findAllDeathCertificates() {

		
		  List<DeathCertificate> d = new ArrayList<DeathCertificate>();
		  
		  d = deathCertificateRepository.findAll(); 
		  return d;
		 
	}

	@Override
	public void findOneDeathCertificate(long appId) {
		
		  DeathCertificate d = deathCertificateRepository.findDeathCertificateByAppId(appId);
		  d.setStat("APPROVED");
		  deathCertificateRepository.save(d);
		 

	}

	@Override
	public DeathCertificate getDeathApplicationStatusByCurrentUser(User user) {
		
		  Long userId = user.getUserId();
		  DeathCertificate d =deathCertificateRepository.findByUserId(userId); 
		  return d;
		 
	}
	@Override
	public List<MarriageCertificate> findAllMarriageCertificates() {
		
		
		  List<MarriageCertificate> m = new ArrayList<MarriageCertificate>();
		  
		  m= marriageCertificateRepository.findAll(); 
		  return m;
		 
		
	}

	@Override
	public void findOneMarriageCertificate(long appId) {
		
		  MarriageCertificate m =marriageCertificateRepository.findMarriageCertificateByAppId(appId);
		  m.setStatus("APPROVED"); 
		  marriageCertificateRepository.save(m);
		 
		
	}

	@Override
	public MarriageCertificate getMarriageApplicationStatusByCurrentUser(User user) {
		
		  Long userId = user.getUserId();
		   MarriageCertificate m =marriageCertificateRepository.findByUserId(userId); 
		  return m;
		 
		
	}

	/*
	 * @Override public User saveImage(MultipartFile uploadFile) { // TODO
	 * Auto-generated method stub return null; }
	 */
	
	
	
	/*
	 * @Override public void saveImage(MultipartFile uploadFile) throws Exception {
	 * String folder="c:/photos/"; byte[] bytes = uploadFile.getBytes(); Path path =
	 * Paths.get(folder+uploadFile.getOriginalFilename()); Files.write(path, bytes);
	 * }
	 */
	
	

	
	  @Override public User saveMarriageCertificate(String groomName,String
	  groomIdProof,String groomPhoto , String groomFather,String groomMother,String
	  gDOB,String gReligion,String gMobile, String gEmail,String gAddress,String
	  gDist,String gState,String gCountry,String gPin, String gWitness,String
	  gWitnessId,String gWitnessMobile,String gWitnessRelation,String
	  gWitnessAddress, String brideName,String brideIdProof,String
	  bridePhoto,String brideFather, String brideMother,String bDOB,String
	  bReligion,String bMobile,String bEmail,String bAddress,String bDist, String
	  bState,String bCountry,String bPin,String bWitness,String bWitnessId, String
	  bWitnessMobile,String bWitnessRelation,String bWitnessAddress,String
	  marriageDate,String marriageType, String marriageProof,String
	  groomSign,String brideSign,String gWitnessSign,String bWitnessSign,User user) {
	  
	  MarriageCertificate marriageCertificate =new MarriageCertificate();
	  marriageCertificate.setGroomName(groomName);
	  marriageCertificate.setGroomIdProof(groomIdProof);
	  marriageCertificate.setGroomPhoto(groomPhoto);
	  marriageCertificate.setGroomFather(groomFather);
	  marriageCertificate.setGroomMother( groomMother);
	  marriageCertificate.setGroomDob(gDOB);
	  marriageCertificate.setGroomReligion(gReligion);
	  marriageCertificate.setGroomMobile(gMobile);
	  marriageCertificate.setGroomEmail(gEmail);
	  marriageCertificate.setGroomAddress(gAddress);
	  marriageCertificate.setGroomDist(gDist);
	  marriageCertificate.setGroomState(gState);
	  marriageCertificate.setGroomCountry(gCountry);
	  marriageCertificate.setGroomPin(gPin);
	  marriageCertificate.setGroomWitnessName(gWitness);
	  marriageCertificate.setGroomWitnessId(gWitnessId);
	  marriageCertificate.setGroomWitnessMobile(gWitnessMobile);
	  marriageCertificate.setGroomWitnessRelation(gWitnessRelation);
	  marriageCertificate.setGroomWitnessAddress(gWitnessAddress);
	  marriageCertificate.setBrideName(brideName);
	  marriageCertificate.setBrideIdProof(brideIdProof);
	  marriageCertificate.setBridePhoto(bridePhoto);
	  marriageCertificate.setBrideFather(brideFather);
	  marriageCertificate.setBrideMother(brideMother);
	  marriageCertificate.setBrideDob(bDOB);
	  marriageCertificate.setBrideReligion(bReligion);
	  marriageCertificate.setBrideMobile(bMobile);
	  marriageCertificate.setBrideEmail(bEmail);
	  marriageCertificate.setBrideAddress(bAddress);
	  marriageCertificate.setBrideDist(bDist);
	  marriageCertificate.setBrideState(bState);
	  marriageCertificate.setBrideCountry(bCountry);
	  marriageCertificate.setBridePin(bPin);
	  marriageCertificate.setBrideWitnessName(bWitness);
	  marriageCertificate.setBrideWitnessId(bWitnessId);
	  marriageCertificate.setBrideWitnessMobile(bWitnessMobile);
	  marriageCertificate.setBrideWitnessRelation(bWitnessRelation);
	  marriageCertificate.setBrideWitnessAddress(bWitnessAddress);
	  marriageCertificate.setMarriageDate(marriageDate);
	  marriageCertificate.setMarriageType(marriageType);
	  marriageCertificate.setMarriageProof(marriageProof);
	  marriageCertificate.setGroomSign(groomSign);
	  marriageCertificate.setBrideSign(brideSign);
	  marriageCertificate.setGroomWitnessSign(gWitnessSign);
	  marriageCertificate.setBrideWitnessSign(bWitnessSign);
	  marriageCertificate.setUserId(user);
	  marriageCertificate.setStatus("APPLIED");
	  
	  
	  
		/*
		 * System.out.println("the value is "+cname); System.out.println(" "+gender);
		 * System.out.println(" "+dOB); System.out.println(" "+birthPlace);
		 * System.out.println(" "+birthProofFile); System.out.println(" "+fName);
		 * System.out.println(" "+idProofFather); System.out.println(" "+mName);
		 * 
		 * System.out.println(" "+idProofMother);
		 * System.out.println(" "+marriageCertificate);
		 * System.out.println(" "+mobileNumber); System.out.println(" "+emailId);
		 * System.out.println(" "+address); System.out.println(" "+dist);
		 * System.out.println(" "+state); System.out.println(" "+country);
		 * System.out.println(" "+pinCode); System.out.println(" "+signFather);
		 * System.out.println(" "+signMother);
		 */
	  
	  
	  marriageCertificateRepository.save(marriageCertificate);
	  
	  
	  
	  
	  return null; 
	  }

	/*
	 * @Override public User saveBirthCertificate(String cName, String gender,
	 * String dOB, String birthPlace, MultipartFile birthProof, String fName, String
	 * idProofFather, String mName, String idProofMother, String
	 * marriageCertificate, String mobileNumber, String emailId, String address,
	 * String dist, String state, String country, String pinCode, String signFather,
	 * String signMother, User user) { // TODO Auto-generated method stub return
	 * null; }
	 */
	
	 

}
