package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class PasswordValidException extends Exception {

	
	public PasswordValidException() {
		Logger logger= LoggerFactory.getLogger(PasswordValidException.class);
		logger.error("Invalid input For Password! \n Password Must contains minimum of six numbers and not to be any Characters or Special Characters  !");
	}
	
}
