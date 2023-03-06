package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class MailInvalidException extends Exception {

	public MailInvalidException() {
		Logger logger= LoggerFactory.getLogger(MailInvalidException.class);
		logger.error("Invalid Input been Passed for Mail!, \\n recommended as 'abcd@chainsys.com' \\n Note: Before @ name should follow more than three characters ");
	}
	
	
}
