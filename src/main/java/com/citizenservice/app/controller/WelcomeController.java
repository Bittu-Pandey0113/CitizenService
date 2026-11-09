package com.citizenservice.app.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.citizenservice.app.model.User;
import com.citizenservice.app.model.UserRole;
import com.citizenservice.app.service.UserService;
import com.citizenservice.app.util.SecurityHelper;

@Controller 
public class WelcomeController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/")
	public String index(HttpServletRequest request) {	
		//String emailId = "mvnaresh31@gmail.com";
		//String mobileNumber = "6370625180"; 
		//MailServiceUtil.sendMail("Welcome To Medisoft", "Welcome Mail", emailId);
		//SendSmsUtil.sendTransactionalMessage(mobileNumber, "Welcome To Medisoft"); 
		return "site.index";  
	} 
	
	@GetMapping("/dashBoard.htm") 
	public String dashBoard(HttpServletRequest request, Model model) {	
		
		User user = SecurityHelper.getCurrentUser(); 
		UserRole userRole = userService.getUserRoleByUserId(user.getUserId());  
		model.addAttribute("userName", user.getName());  
		model.addAttribute("roleName", userRole.getRoleId().getRoleType());
		return "site.dashBoard";   
		
	} 
	
}
