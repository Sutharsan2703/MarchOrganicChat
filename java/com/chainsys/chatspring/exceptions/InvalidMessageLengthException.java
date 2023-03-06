package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class InvalidMessageLengthException extends Exception {
	public InvalidMessageLengthException() {
		Logger logger= LoggerFactory.getLogger(InvalidMessageLengthException.class);
		logger.error("The size of message be atleast two letters (ex: to, on, or ) ...");
	}
}
