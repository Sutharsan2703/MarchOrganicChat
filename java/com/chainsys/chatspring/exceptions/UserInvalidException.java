package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserInvalidException extends Exception {


	public UserInvalidException() {
		Logger logger= LoggerFactory.getLogger(UserInvalidException.class);
		logger.error("UserName Not Exists!");
	}
	
}
