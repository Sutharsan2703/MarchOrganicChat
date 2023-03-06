package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EntryInvalidException extends Exception {
	public EntryInvalidException() {
		Logger logger= LoggerFactory.getLogger(EntryInvalidException.class);
		logger.error("Wrong Credentials ! Enter the correct one  ...");
	}
}
