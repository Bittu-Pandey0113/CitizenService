package com.citizenservice.app.controller;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.citizenservice.app.model.BirthCertificate;
import com.citizenservice.app.model.DeathCertificate;
import com.citizenservice.app.model.MarriageCertificate;
import com.citizenservice.app.service.UserService;

@Controller
public class AuthorityController {
	@Autowired
	private UserService userService;
	private List<BirthCertificate> birthCertificateList;
	private List<DeathCertificate> deathCertificateList;
	private List<MarriageCertificate> marriageCertificateList;
	
	
	@RequestMapping(value = "/approveBirthCertificate.htm", method = RequestMethod.GET)
	public String getAllBirthCertificate(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
			String logout, RedirectAttributes message) {
		
		birthCertificateList = userService.findAllBirthCertificates();
		
		model.addAttribute("birthCertificateLIst", birthCertificateList);
		return "site.approveBrithCertificate";
	}
	@RequestMapping(value = "/approveUserBirthCertificate.htm", method = RequestMethod.GET)
	public String approveUserBirthCertificate(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
			String logout, RedirectAttributes message,@RequestParam(value = "applicationid") Long appId) {
		
		userService.findOneBirthCertificate(appId);
		
		return "redirect:/approveBirthCertificate.htm";
	}
	
	  @RequestMapping(value = "/approveDeathCertificate.htm", method =RequestMethod.GET)
	  public String getAllDeathCertificate(ModelMap model,HttpServletRequest request, HttpServletResponse response, String error,
	  String logout, RedirectAttributes message) {
	  
	  deathCertificateList = userService.findAllDeathCertificates();
	  
	  model.addAttribute("deathCertificateLIst", deathCertificateList);
	  return "site.approveDeathCertificate"; 
	  }
	  @RequestMapping(value = "/approveUserDeathCertificate.htm", method = RequestMethod.GET)
		public String approveUserDeathCertificate(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
				String logout, RedirectAttributes message,@RequestParam(value = "applicationid") Long appId) {
			
			userService.findOneDeathCertificate(appId);
			
			return "redirect:/approveDeathCertificate.htm";
		}
	 
	  @RequestMapping(value = "/approveMarriageCertificate.htm", method =RequestMethod.GET)
	  public String getAllMarriageCertificate(ModelMap model,HttpServletRequest request, HttpServletResponse response, String error,
	  String logout, RedirectAttributes message) {
	  
	  marriageCertificateList = userService.findAllMarriageCertificates();
	  
	  model.addAttribute("marriageCertificateLIst", marriageCertificateList);
	  return "site.approveMarriageCertificate"; 
	  }
	  @RequestMapping(value = "/approveUserMarriageCertificate.htm", method = RequestMethod.GET)
		public String approveUserMarriageCertificate(ModelMap model, HttpServletRequest request, HttpServletResponse response, String error,
				String logout, RedirectAttributes message,@RequestParam(value = "applicationid") Long appId) {
			
			userService.findOneMarriageCertificate(appId);
			
			return "redirect:/approveMarriageCertificate.htm";
		}
	 

}
