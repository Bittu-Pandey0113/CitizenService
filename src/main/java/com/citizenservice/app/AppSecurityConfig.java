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
 * Spring Security 7 configuration (component based - WebSecurityConfigurerAdapter
 * no longer exists). The UserDetailsService ({@code UserDetailsServiceImpl}) and the
 * PasswordEncoder below are picked up automatically by Spring Security.
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
				.requestMatchers("/login").permitAll()
				// This URL can be accessed by the specified roles of a logged in user.
				.requestMatchers("/dashBoard.htm").hasAnyAuthority("Admin", "user", "Authority")
				// Same behaviour as the original application: all other URLs are not restricted here.
				.anyRequest().permitAll())
			.formLogin(form -> form
				.loginPage("/login")
				.failureUrl("/login?error")
				.defaultSuccessUrl("/dashBoard.htm")
				.usernameParameter("loginUserName")
				.passwordParameter("loginPassword")
				.permitAll())
			.logout(logout -> logout
				.logoutUrl("/logout")
				.invalidateHttpSession(true)
				.deleteCookies("JSESSIONID")
				.logoutSuccessUrl("/login?logout"))
			.httpBasic(Customizer.withDefaults())
			.sessionManagement(session -> session.sessionFixation(fixation -> fixation.newSession()))
			.exceptionHandling(ex -> ex.accessDeniedPage("/403"));

		return http.build();
	}

}
