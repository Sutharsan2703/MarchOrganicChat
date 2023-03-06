package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class InvalidInputException extends Exception {

	public InvalidInputException() {
		Logger logger= LoggerFactory.getLogger(InvalidInputException.class);
		logger.error("Must be within limits as displayed! Enter valid Input ...");
	}
	
}
