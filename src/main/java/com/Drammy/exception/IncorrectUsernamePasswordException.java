package com.Drammy.exception;

public class IncorrectUsernamePasswordException extends Exception {

	public IncorrectUsernamePasswordException() {
		super();
	}

	public IncorrectUsernamePasswordException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public IncorrectUsernamePasswordException(String message, Throwable cause) {
		super(message, cause);
	}

	public IncorrectUsernamePasswordException(String message) {
		super(message);
	}

	public IncorrectUsernamePasswordException(Throwable cause) {
		super(cause);
	}
	
	

}
