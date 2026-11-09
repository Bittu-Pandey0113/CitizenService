package com.citizenservice.app;

import java.util.Map;

import org.springframework.boot.webmvc.autoconfigure.error.ErrorViewResolver;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;

@Component
public class MyErrorViewResolver implements ErrorViewResolver {

	@Override
	public ModelAndView resolveErrorView(HttpServletRequest request, HttpStatus status, Map<String, Object> model) {

		if (status == HttpStatus.NOT_FOUND) {
			return new ModelAndView("errors/404");
		} else if (status == HttpStatus.BAD_REQUEST) {
			return new ModelAndView("errors/400");
		} else if (status == HttpStatus.FORBIDDEN) {
			return new ModelAndView("errors/403");
		} else if (status == HttpStatus.METHOD_NOT_ALLOWED) {
			return new ModelAndView("errors/405");
		} else if (status == HttpStatus.INTERNAL_SERVER_ERROR) {
			return new ModelAndView("errors/500");
		} else if (status == HttpStatus.SERVICE_UNAVAILABLE) {
			return new ModelAndView("errors/503");
		}
		return null;
	}

}
