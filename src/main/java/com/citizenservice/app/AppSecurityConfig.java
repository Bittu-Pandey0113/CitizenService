package com.citizenservice.app;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import jakarta.servlet.DispatcherType;

/**
 * Spring Security configuration for Citizen Service Portal.
 */
@Configuration
@EnableWebSecurity
public class AppSecurityConfig {

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
		return new HttpSessionEventPublisher();
	}

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

		http.authorizeHttpRequests(auth -> auth
				// JSP views are rendered through a server-side forward / include / error dispatch
				.dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE, DispatcherType.ERROR)
				.permitAll()
				// Publicly accessible pages and static resources
				.requestMatchers("/", "/ping", "/health.htm", "/login", "/signUp.htm", "/addSignUpUser.htm", "/forgotPassword.htm",
						"/submitOtp.htm", "/changePasswordForForgotCase.htm", "/static/**", "/resources/**", "/css/**", "/js/**", "/images/**")
				.permitAll()
				// Protected portal routes requiring authentication
				.requestMatchers("/dashBoard.htm", "/applyBirthCertificate.htm", "/applyDeathCertificate.htm",
						"/applyMarriageCertificate.htm", "/checkApplicationStatus.htm", "/printBCertificate.htm",
						"/printDCertificate.htm", "/printMCertificate.htm", "/editProfile.htm", "/changePassword.htm")
				.hasAnyAuthority("Admin", "user", "Authority")
				// Authority review endpoints
				.requestMatchers("/approveBirthCertificate.htm", "/approveDeathCertificate.htm",
						"/approveMarriageCertificate.htm", "/approveUserBirthCertificate.htm",
						"/approveUserDeathCertificate.htm", "/approveUserMarriageCertificate.htm")
				.hasAnyAuthority("Admin", "Authority")
				// Admin endpoints
				.requestMatchers("/createUser.htm", "/manageUser.htm", "/createRole.htm", "/manageRole.htm")
				.hasAuthority("Admin")
				.anyRequest().permitAll())
			.formLogin(form -> form
				.loginPage("/")
				.loginProcessingUrl("/login")
				.failureUrl("/?error")
				.defaultSuccessUrl("/dashBoard.htm", true)
				.usernameParameter("loginUserName")
				.passwordParameter("loginPassword")
				.permitAll())
			.logout(logout -> logout
				.logoutUrl("/logout")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.logoutSuccessUrl("/?logout"))
			.sessionManagement(session -> session.sessionFixation(fixation -> fixation.newSession()))
			.exceptionHandling(ex -> ex.accessDeniedPage("/403"));

		return http.build();
	}

}
