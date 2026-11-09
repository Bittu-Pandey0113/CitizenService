package com.citizenservice.app.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import com.citizenservice.app.model.LoggedInUser;
import com.citizenservice.app.model.User;

public class SecurityHelper {

	public static User getCurrentUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		LoggedInUser currentUser = (LoggedInUser) auth.getPrincipal();
		return currentUser.getDbUser();
	}

}
