package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MailExistsException extends Exception {

	public MailExistsException() {
		Logger logger= LoggerFactory.getLogger(MailExistsException.class);
		logger.error("MailId already Exists!! recommended as 'abcd@chainsys.com' Note: Before @ name should follow more than three characters of your name");
	}

}
