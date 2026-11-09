package com.citizenservice.app.service;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.citizenservice.app.model.LoggedInUser;
import com.citizenservice.app.model.User;
import com.citizenservice.app.model.UserRole;
import com.citizenservice.app.repository.UserRepository;
import com.citizenservice.app.repository.UserRoleRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private UserRoleRepository userRoleRepository;

	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {

		User user = userRepository.getUserByUserName(userId); 

		if (user == null) {
			throw new UsernameNotFoundException("User not found: " + userId);
		}


		Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
		UserRole userRole = userRoleRepository.getUserRoleByUserId(user.getUserId()); 
		String roleType = "user";
		if (userRole != null && userRole.getRoleId() != null && userRole.getRoleId().getRoleType() != null) {
			roleType = userRole.getRoleId().getRoleType(); 
		}
		grantedAuthorities.add(new SimpleGrantedAuthority(roleType)); 
		boolean mybool = (user.getDeleted() == null); 

		LoggedInUser liu = new LoggedInUser(user.getUserName(), user.getPassword(), mybool, mybool, mybool, mybool,
				grantedAuthorities, user);

		return liu;

	}

}
