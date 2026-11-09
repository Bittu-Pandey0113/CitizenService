package com.citizenservice.app.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.LoggedInUser;
import com.citizenservice.app.model.MarriageCertificate;
import com.citizenservice.app.model.Role;
import com.citizenservice.app.model.User;
import com.citizenservice.app.model.UserRole;
import com.citizenservice.app.repository.BirthCertificateRepository;
import com.citizenservice.app.repository.DeathCertificateRepository;
import com.citizenservice.app.repository.MarriageCertificateRepository;
import com.citizenservice.app.service.AdminService;
import com.citizenservice.app.service.UserService;
import com.citizenservice.app.util.OtpGenerator;
import com.citizenservice.app.util.SecurityHelper;
import com.citizenservice.app.util.SendSmsUtil;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private AdminService adminService;

	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private BirthCertificateRepository birthCertificateRepository;

	@Autowired
	private DeathCertificateRepository deathCertificateRepository;

	@Autowired
	private MarriageCertificateRepository marriageCertificateRepository;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String dashBoardPage(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
			String logout, RedirectAttributes message) {

		if (error != null) {
			model.addAttribute("error_msg", "Your username and password is invalid.");
			message.addFlashAttribute("loginFail", "Invalid User Credential");
			return "redirect:/";
		} else if (logout != null) {
			model.addAttribute("success_msg", "You have been logged out successfully.");
			message.addFlashAttribute("logout", "User Logged Out Successfully");
			return "redirect:/";
		} else {
			return "redirect:/dashBoard.htm";
		}

	}

	@RequestMapping(value = "/changePassword.htm", method = RequestMethod.GET)
	public String changePassword(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		User loggedinUser = SecurityHelper.getCurrentUser();
		Long userId = loggedinUser.getUserId();
		model.addAttribute("userId", userId);
		User user = adminService.getUserById(userId);
		model.addAttribute("userPassword", user.getPassword());
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());
		model.addAttribute("userName", user.getName());
		model.addAttribute("roleName", userRole.getRoleId().getRoleType());

		return "site.changePassword";
	}

	@RequestMapping(value = "/changePassword.htm", method = RequestMethod.POST)
	public String updatePassword(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes message, @RequestParam(value = "userId", required = false) Long userId,
			@RequestParam(value = "oldPassword", required = false) String oldPassword,
			@RequestParam(value = "newPassword", required = false) String newPassword) {

		User loggedinUser = SecurityHelper.getCurrentUser();
		String currentLoggedinUserPassword = loggedinUser.getPassword();
		if (bCryptPasswordEncoder.matches(oldPassword, currentLoggedinUserPassword)) {
			User user = userService.changePassword(userId, oldPassword, newPassword);
			if (user != null) {
				message.addFlashAttribute("changePasswordSuccessMessage", "Password Changed Successfully.");
			} else {
				message.addFlashAttribute("changePasswordFailureMessage", "Unable To Change Password.");
			}
		} else {
			message.addFlashAttribute("mismatchPassword", "Unable To Match With Old Password");
			return "redirect:/changePassword.htm";
		}

		return "redirect:/dashBoard.htm";
	}

	@RequestMapping(value = "/editProfile.htm", method = RequestMethod.GET)
	public String editProfile(ModelMap model, HttpServletRequest request, HttpServletResponse response) {

		User loggedinUser = SecurityHelper.getCurrentUser();
		Long userId = loggedinUser.getUserId();
		User user = adminService.getUserById(userId);
		UserRole userRole = userService.getUserRoleByUserId(userId);
		model.addAttribute("role", userRole.getRoleId());
		model.addAttribute("user", user);
		model.addAttribute("userName", user.getName());
		model.addAttribute("roleName", userRole.getRoleId().getRoleType());

		return "site.editProfile";
	}

	@RequestMapping(value = "/editProfile.htm", method = RequestMethod.POST)
	public String editProfile(ModelMap model, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes message, @RequestParam(value = "userId", required = false) Long userId,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "mobileNumber", required = false) String mobileNumber,
			@RequestParam(value = "emailId", required = false) String emailId,
			@RequestParam(value = "address", required = false) String address) {

		User user = userService.editProfile(userId, name, mobileNumber, emailId, address);
		if (user != null) {
			message.addFlashAttribute("editProfileSuccessMessage", "Profile Updated Successfully.");
		} else {
			message.addFlashAttribute("editProfileFailureMessage", "Unable To Update Profile.");
		}

		return "redirect:/dashBoard.htm";
	}

	@GetMapping("/forgotPassword.htm")
	public String forgotPassword(HttpServletRequest request, Model model) {

		return "site.forgotPassword";
	}

	@PostMapping("/forgotPassword.htm")
	public String forgotPasswordPost(HttpServletRequest request, Model model,
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "mobileNumber", required = false) String mobileNumber, RedirectAttributes message) {

		User existingUser = userService.getUserByUserNameAndMobileNumber(userName, mobileNumber);
		if (existingUser == null) {
			message.addFlashAttribute("noDataFound", "This UserName or MobileNumber is not associated with any User.");
			return "redirect:/forgotPassword.htm";
		} else {
			String mobNumber = existingUser.getMobileNo();
			String otp = OtpGenerator.otpGenertor();
			String msg = "Hi " + existingUser.getName() + ", Use " + otp
					+ " as One Time Password for changing your Medisoft account's password.";
			SendSmsUtil.sendTransactionalMessage(mobNumber, msg);
			User user = userService.saveOtpForForgotPassword(existingUser, otp);
			if (user != null) {
				message.addFlashAttribute("successOtpMsg",
						"OTP has been sent successfully to the registered mobile number.");
			} else {
				message.addFlashAttribute("failureOtpMsg", "Unable to send OTP.");
			}

			return "redirect:/submitOtp.htm?userId=" + existingUser.getUserId();
		}

	}

	@GetMapping("/resendOtp.htm")
	public String resendOtp(HttpServletRequest request, Model model,
			@RequestParam(value = "userId", required = false) Long userId, RedirectAttributes message) {

		User existingUser = userService.getUserRoleById(userId);

		String mobNumber = existingUser.getMobileNo();
		String otp = OtpGenerator.otpGenertor();
		String msg = "Hi " + existingUser.getName() + ", Use " + otp
				+ " as One Time Password for changing your Medisoft account's password.";
		SendSmsUtil.sendTransactionalMessage(mobNumber, msg);
		User user = userService.saveOtpForForgotPassword(existingUser, otp);
		if (user != null) {
			message.addFlashAttribute("successOtpMsg",
					"OTP has been sent successfully to the registered mobile number.");
		} else {
			message.addFlashAttribute("failureOtpMsg", "Unable to send OTP.");
		}

		return "redirect:/submitOtp.htm?userId=" + existingUser.getUserId();
	}

	@GetMapping("/submitOtp.htm")
	public String submitOtp(HttpServletRequest request, Model model,
			@RequestParam(value = "userId", required = false) Long userId) {

		User existingUser = userService.getUserRoleById(userId);
		model.addAttribute("user", existingUser);

		return "site.submitOtp";
	}

	@PostMapping("/submitOtpPost.htm")
	public String submitOtpPost(HttpServletRequest request, Model model,
			@RequestParam(value = "otp", required = false) String otp,
			@RequestParam(value = "userId", required = false) Long userId, RedirectAttributes message) {

		User existingUser = userService.getUserRoleById(userId);

		User user = userService.matchOtp(otp);
		if (user != null) {
			return "redirect:/changePasswordForForgotCase.htm?userId=" + user.getUserId();
		} else {
			message.addFlashAttribute("failureOtpSubmissionMsg", "Please enter valid OTP.");
			return "redirect:/submitOtp.htm?userId=" + existingUser.getUserId();
		}
	}

	@GetMapping("/changePasswordForForgotCase.htm")
	public String changePasswordForForgotCase(HttpServletRequest request, Model model,
			@RequestParam(value = "userId", required = false) Long userId) {

		User existingUser = userService.getUserRoleById(userId);

		model.addAttribute("user", existingUser);

		return "site.changePasswordForForgotCase";
	}

	@PostMapping("/changePasswordForForgotCase.htm")
	public String changePasswordForForgotCasePost(HttpServletRequest request, Model model,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "userId", required = false) Long userId, RedirectAttributes message) {

		User existingUser = userService.getUserRoleById(userId);

		User finalUser = userService.changePasswordForForgotCasePost(existingUser, password);
		if (finalUser != null) {
			message.addFlashAttribute("successPwdChangeMsg", "Password has been changed successfully.");
		} else {
			message.addFlashAttribute("failurePwdChangeMsg", "Unable to change password.");
		}

		return "redirect:/";
	}

	@GetMapping("/checkApplicationStatus.htm")
	public String showApplicationStatusForm(HttpServletRequest request, Model model
	/* @RequestParam(value="userId", required=false)Long userId */) {
		User user = SecurityHelper.getCurrentUser();
		BirthCertificate b = userService.getBirthApplicationStatusByCurrentUser(user);
		// User existingUser = userService.getUserRoleById(userId);
		if (b != null)
			model.addAttribute("birthStatus", b.getSt());

		DeathCertificate d = userService.getDeathApplicationStatusByCurrentUser(user);
		if (d != null)
			model.addAttribute("deathStatus", d.getStat());

		MarriageCertificate m = userService.getMarriageApplicationStatusByCurrentUser(user);
		if (m != null)
			model.addAttribute("marriageStatus", m.getStatus());

		return "site.showapplicationStatusForm";
	}

	@GetMapping("/testUpload.htm")
	public String fileUploadTestingr(HttpServletRequest request, Model model
	/* , @RequestParam("userIdForDisableUser")Long userIdForDisableUser */) {
		/*
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user);
		 */

		return "site.testUpload";
	}
	/*
	 * @PostMapping("/testUpload.htm") public String
	 * UploadTestingr(HttpServletRequest request, Model
	 * model, @RequestParam("newFile") MultipartFile
	 * birthProofFile, @RequestParam("userIdForDisableUser")Long
	 * userIdForDisableUser){
	 * 
	 * User user = adminService.getUserById(userIdForDisableUser);
	 * adminService.disableUser(user); try { userService.saveImage(birthProofFile);
	 * } catch (Exception e) {
	 * 
	 * e.printStackTrace(); } return null; }
	 */

	@GetMapping("/applyBirthCertificate.htm")
	public String showBirthApplicationForm(HttpServletRequest request, Model model
	/* @RequestParam(value="userId", required=false)Long userId */) {

		// User existingUser = userService.getUserRoleById(userId);
		// model.addAttribute("user", existingUser);

		return "site.showbirthapplicationform";
	}

	@PostMapping("/applyBirthCertificate.htm")
	public String applyBirthCeritificate(HttpServletRequest request, Model model,

			@RequestParam(value = "cname") String cName, @RequestParam(value = "gender") String gender,
			@RequestParam(value = "dOB") String dOB, @RequestParam(value = "birthPlace") String birthPlace,
			//@RequestParam(value = "birthProofFile") MultipartFile birthProofFile, 
			@RequestParam(value = "birthProofFile") String birthProofFile, 
			@RequestParam(value = "fName") String fName,
			@RequestParam(value = "idProofFather") String idProofFather, @RequestParam(value = "mName") String mName,
			@RequestParam(value = "idProofMother") String idProofMother,
			@RequestParam(value = "marriageCertificate") String marriageCertificate,
			@RequestParam(value = "mobileNumber") String mobileNumber, @RequestParam(value = "emailId") String emailId,
			@RequestParam(value = "address") String address, @RequestParam(value = "dist") String dist,
			@RequestParam(value = "state") String state, @RequestParam(value = "country") String country,
			@RequestParam(value = "pinCode") String pinCode, @RequestParam(value = "signFather") String signFather,
			@RequestParam(value = "signMother") String signMother, RedirectAttributes message) throws Exception {
		
		User user = SecurityHelper.getCurrentUser();
		
		// User existingUser =
		// userService.getUserByUserNameAndMobileNumber(userName,mobileNumber);
		
		/*
		 * @PostMapping("/testUpload.htm") public String
		 * UploadTestingr(HttpServletRequest request, Model
		 * model, @RequestParam("newFile") MultipartFile
		 * uploadFile, @RequestParam("userIdForDisableUser")Long userIdForDisableUser){
		 * 
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user); try { adminService.saveImage(uploadFile); }
		 * catch (Exception e) {
		 * 
		 * e.printStackTrace(); } return null; }
		 */
		
		userService.saveBirthCertificate(cName, gender, dOB, birthPlace,
				  birthProofFile, fName, idProofFather, mName, idProofMother,
				  marriageCertificate, mobileNumber, emailId, address, dist, state, country,
				  pinCode, signFather, signMother,user);
		
		/*
		 * userService.saveBirthCertificate(cName, gender, dOB, birthPlace,
		 * birthProofFile, fName, idProofFather, mName, idProofMother,
		 * marriageCertificate, mobileNumber, emailId, address, dist, state, country,
		 * pinCode, signFather, signMother,user,request);
		 */
		
		
		/*
		 * try { userService.saveBirthCertificate(cName, gender, dOB, birthPlace,
		 * birthProofFile, fName, idProofFather, mName, idProofMother,
		 * marriageCertificate, mobileNumber, emailId, address, dist, state, country,
		 * pinCode, signFather, signMother,user); } catch (Exception e) {
		 * e.printStackTrace(); }
		 */
		 

		// System.out.println("the value is "+cName);
		// System.out.println(" "+gender);
		// System.out.println(" "+dOB);
		// System.out.println(" "+birthPlace);
		// System.out.println(" "+birthProofFile);
		// System.out.println(" "+fName);
		// System.out.println(" "+idProofFather);
		// System.out.println(" "+mName);
		// System.out.println(" "+idProofMother);
		// System.out.println(" "+marriageCertificate);
		// System.out.println(" "+mobileNumber);
		// System.out.println(" "+emailId);
		// System.out.println(" "+address);
		// System.out.println(" "+dist);
		// System.out.println(" "+state);
		// System.out.println(" "+country);
		// System.out.println(" "+pinCode);
		// System.out.println(" "+signFather);
		// System.out.println(" "+signMother);

		  return "redirect:/dashBoard.htm";
	}

	@GetMapping("/applyDeathCertificate.htm")
	public String showDeathApplicationForm(HttpServletRequest request, Model model
	/* @RequestParam(value="userId", required=false)Long userId */) {

		// User existingUser = userService.getUserRoleById(userId);
		// model.addAttribute("user", existingUser);

		return "site.showdeathapplicationform";
	}

	@PostMapping("/applyDeathCertificate.htm")
	public String applyDeathCeritificate(HttpServletRequest request, Model model,

			@RequestParam(value = "name") String name, @RequestParam(value = "fName") String fName,
			@RequestParam(value = "dOB") String dOB, @RequestParam(value = "gender") String gender,
			@RequestParam(value = "deathDate") String deathDate, @RequestParam(value = "deathCause") String deathCause,
			@RequestParam(value = "deathPlace") String deathPlace,
			@RequestParam(value = "deathProofFile") String deathProofFile,
			@RequestParam(value = "address") String address,
			@RequestParam(value = "policeStation") String policeStation, @RequestParam(value = "dist") String dist,
			@RequestParam(value = "state") String state, @RequestParam(value = "country") String country,
			@RequestParam(value = "pinCode") String pinCode, @RequestParam(value = "aName") String aName,
			@RequestParam(value = "idProofApplicant") String idProofApplicant,
			@RequestParam(value = "relation") String relation,
			@RequestParam(value = "mobileNumber") String mobileNumber,
			@RequestParam(value = "aAddress") String aAddress,
			@RequestParam(value = "aPoliceStation") String aPoliceStation, @RequestParam(value = "aDist") String aDist,
			@RequestParam(value = "aState") String aState, @RequestParam(value = "aCountry") String aCountry,
			@RequestParam(value = "aPinCode") String aPinCode,
			@RequestParam(value = "signApplicant") String signApplicant, RedirectAttributes message) {

		User user = SecurityHelper.getCurrentUser();
		// User existingUser =
		// userService.getUserByUserNameAndMobileNumber(userName,mobileNumber);
		userService.saveDeathCertificate(name, fName, dOB, gender, deathDate, deathCause, deathPlace, deathProofFile,
				address, policeStation, dist, state, country, pinCode, aName, idProofApplicant, relation, mobileNumber,
				aAddress, aPoliceStation, aDist, aState, aCountry, aPinCode, signApplicant, user);

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

		return "redirect:/dashBoard.htm";
	}

	/*
	 * @PostMapping("/testUpload.htm") public String
	 * UploadTestingr(HttpServletRequest request, Model
	 * model, @RequestParam("newFile") MultipartFile
	 * uploadFile, @RequestParam("userIdForDisableUser")Long userIdForDisableUser){
	 * 
	 * User user = adminService.getUserById(userIdForDisableUser);
	 * adminService.disableUser(user); try { adminService.saveImage(uploadFile); }
	 * catch (Exception e) {
	 * 
	 * e.printStackTrace(); } return null; }
	 */

	@GetMapping("/applyMarriageCertificate.htm")
	public String showMarriageApplicationForm(HttpServletRequest request, Model model
	/* @RequestParam(value="userId", required=false)Long userId */) {

		// User existingUser = userService.getUserRoleById(userId);
		// model.addAttribute("user", existingUser);

		return "site.showmarriageapplicationform";

	}

	@PostMapping("/applyMarriageCertificate.htm")
	public String applyMarriageCertificate(HttpServletRequest request, Model model,

			@RequestParam(value = "groomName") String groomName,

			@RequestParam(value = "groomIdProof") String groomIdProof,

			@RequestParam(value = "groomPhoto") String groomPhoto,

			@RequestParam(value = "groomFather") String groomFather,

			@RequestParam(value = "groomMother") String groomMother,

			@RequestParam(value = "gDOB") String gDOB,

			@RequestParam(value = "gReligion") String gReligion,

			@RequestParam(value = "gMobile") String gMobile,

			@RequestParam(value = "gEmail") String gEmail,

			@RequestParam(value = "gAddress") String gAddress,

			@RequestParam(value = "gDist") String gDist,

			@RequestParam(value = "gState") String gState,

			@RequestParam(value = "gCountry") String gCountry,

			@RequestParam(value = "gPin") String gPin,

			@RequestParam(value = "gWitness") String gWitness,

			@RequestParam(value = "gWitnessId") String gWitnessId,

			@RequestParam(value = "gWitnessMobile") String gWitnessMobile,

			@RequestParam(value = "gWitnessRelation") String gWitnessRelation,

			@RequestParam(value = "gWitnessAddress") String gWitnessAddress,

			@RequestParam(value = "brideName") String brideName,

			@RequestParam(value = "brideIdProof") String brideIdProof,

			@RequestParam(value = "bridePhoto") String bridePhoto,

			@RequestParam(value = "brideFather") String brideFather,

			@RequestParam(value = "brideMother") String brideMother,

			@RequestParam(value = "bDOB") String bDOB,

			@RequestParam(value = "bReligion") String bReligion,

			@RequestParam(value = "bMobile") String bMobile,

			@RequestParam(value = "bEmail") String bEmail,

			@RequestParam(value = "bAddress") String bAddress,

			@RequestParam(value = "bDist") String bDist,

			@RequestParam(value = "bState") String bState,

			@RequestParam(value = "bCountry") String bCountry,

			@RequestParam(value = "bPin") String bPin,

			@RequestParam(value = "bWitness") String bWitness,

			@RequestParam(value = "bWitnessId") String bWitnessId,

			@RequestParam(value = "bWitnessMobile") String bWitnessMobile,

			@RequestParam(value = "bWitnessRelation") String bWitnessRelation,

			@RequestParam(value = "bWitnessAddress") String bWitnessAddress,

			@RequestParam(value = "marriageDate") String marriageDate,

			@RequestParam(value = "marriageType") String marriageType,

			@RequestParam(value = "marriageProof") String marriageProof,

			@RequestParam(value = "groomSign") String groomSign,

			@RequestParam(value = "brideSign") String brideSign,

			@RequestParam(value = "gWitnessSign") String gWitnessSign,

			@RequestParam(value = "bWitnessSign") String bWitnessSign, RedirectAttributes message) {

		User user = SecurityHelper.getCurrentUser();

		// User existingUser = //
		// userService.getUserByUserNameAndMobileNumber(userName,mobileNumber);
		userService.saveMarriageCertificate(groomName, groomIdProof, groomPhoto, groomFather, groomMother, gDOB,
				gReligion, gMobile, gEmail, gAddress, gDist, gState, gCountry, gPin, gWitness, gWitnessId,
				gWitnessMobile, gWitnessRelation, gWitnessAddress, brideName, brideIdProof, bridePhoto, brideFather,
				brideMother, bDOB, bReligion, bMobile, bEmail, bAddress, bDist, bState, bCountry, bPin, bWitness,
				bWitnessId, bWitnessMobile, bWitnessRelation, bWitnessAddress, marriageDate, marriageType,
				marriageProof, groomSign, brideSign, gWitnessSign, bWitnessSign, user);

		// System.out.println("the value is "+name); System.out.println(" "+fName);
		// System.out.println(" "+dOB); System.out.println(" "+gender);
		// System.out.println(" "+deathDate); System.out.println(" "+deathCause);
		// System.out.println(" "+deathPlace); System.out.println(" "+deathProofFile);
//	  System.out.println(" "+address); System.out.println(" "+policeStation);
		// System.out.println(" "+dist); System.out.println(" "+state);
		// System.out.println(" "+country); System.out.println(" "+pinCode);
//	  System.out.println(" "+aName); System.out.println(" "+idProofApplicant);
		// System.out.println(" "+relation); System.out.println(" "+mobileNumber);
//	  System.out.println(" "+aAddress); System.out.println(" "+aPoliceStation);
//	  System.out.println(" "+aDist); System.out.println(" "+aState);
//	  System.out.println(" "+aCountry); System.out.println(" "+aPinCode);
//	  System.out.println(" "+signApplicant);

		return "redirect:/dashBoard.htm";

	}

	@GetMapping("/printBCertificate.htm")
	public String birthCertifiacte(HttpServletRequest request, Model model
	/* , @RequestParam("userIdForDisableUser")Long userIdForDisableUser */) {
		User user = SecurityHelper.getCurrentUser();
		// System.out.println(user.getUserId());
		model.addAttribute("birthCertificate", birthCertificateRepository.findByUserId(user.getUserId()));
		/*
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user);
		 */

		return "site.printBCertifate";
	}

	@GetMapping("/printDCertificate.htm")
	public String deathCertifiacte(HttpServletRequest request, Model model
	/* , @RequestParam("userIdForDisableUser")Long userIdForDisableUser */) {
		User user = SecurityHelper.getCurrentUser();
		// System.out.println(user.getUserId());
		model.addAttribute("deathCertificate", deathCertificateRepository.findByUserId(user.getUserId()));
		/*
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user);
		 */

		return "site.printDCertifate";
	}

	@GetMapping("/printMCertificate.htm")
	public String marriageCertifiacte(HttpServletRequest request, Model model
	/* , @RequestParam("userIdForDisableUser")Long userIdForDisableUser */) {
		User user = SecurityHelper.getCurrentUser();
		// System.out.println(user.getUserId());
		model.addAttribute("marriageCertificate", marriageCertificateRepository.findByUserId(user.getUserId()));
		/*
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user);
		 */

		return "site.printMCertifate";
	}
	@GetMapping("/feedBack.htm")
	public String giveFeedBack(HttpServletRequest request, Model model
	/* , @RequestParam("userIdForDisableUser")Long userIdForDisableUser */) {
		/*
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user);
		 */

		return "site.feedBack";
	}
	@GetMapping("/needHelp.htm")
	public String needAnyHelp(HttpServletRequest request, Model model
	/* , @RequestParam("userIdForDisableUser")Long userIdForDisableUser */) {
		/*
		 * User user = adminService.getUserById(userIdForDisableUser);
		 * adminService.disableUser(user);
		 */

		return "site.needHelp";
	}

}
