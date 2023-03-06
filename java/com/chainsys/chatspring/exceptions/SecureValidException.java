package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SecureValidException extends Exception {

	public SecureValidException() {
		Logger logger= LoggerFactory.getLogger(SecureValidException.class);
		logger.error("Answer The Security Question! that answer must contain atleast of six characters!!");
	}
	
}
