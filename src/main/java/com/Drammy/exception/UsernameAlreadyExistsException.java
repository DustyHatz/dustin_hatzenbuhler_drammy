package com.Drammy.exception;

import org.springframework.web.servlet.ModelAndView;

public class UsernameAlreadyExistsException extends Exception {

	public UsernameAlreadyExistsException() {
		super();
	}

	public UsernameAlreadyExistsException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public UsernameAlreadyExistsException(String message, Throwable cause) {
		super(message, cause);
	}

	public UsernameAlreadyExistsException(String message) {
		super(message);
	}

	public UsernameAlreadyExistsException(Throwable cause) {
		super(cause);
	}
	
	public UsernameAlreadyExistsException(ModelAndView mav) {
		
	}
	

}
