package com.citizenservice.app.controller;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "site.index";  
	} 

	@GetMapping(value = {"/ping", "/health.htm"}, produces = "text/plain")
	@ResponseBody
	public String health() {
		return "UP";
	} 
	
	@GetMapping("/dashBoard.htm") 
	public String dashBoard(HttpServletRequest request, Model model) {	
		try {
			User user = SecurityHelper.getCurrentUser(); 
			UserRole userRole = (user != null && user.getUserId() != null) ? userService.getUserRoleByUserId(user.getUserId()) : null;  
			model.addAttribute("userName", (user != null && user.getName() != null) ? user.getName() : "Citizen User");  
			String roleName = (userRole != null && userRole.getRoleId() != null && userRole.getRoleId().getRoleType() != null)
					? userRole.getRoleId().getRoleType() : "user";
			model.addAttribute("roleName", roleName);
		} catch (Exception e) {
			model.addAttribute("userName", "Citizen User");
			model.addAttribute("roleName", "user");
		}
		return "site.dashBoard";   
	} 
	
}
