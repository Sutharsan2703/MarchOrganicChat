package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginInvalidException extends Exception {

	public LoginInvalidException() {
		Logger logger= LoggerFactory.getLogger(LoginInvalidException.class);
		logger.error("Entered Login Credentials was Incorrect ! Enter valid input and continue  ...");
	}
	
}
