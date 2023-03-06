package com.chainsys.chatspring.exceptions;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NameInvalidException extends Exception{
	
	public NameInvalidException() {
		Logger logger= LoggerFactory.getLogger(NameInvalidException.class);
		logger.error("Invalid Input been Passed!, Name should follows as More than three Characters! \\n If Name contains only three Characters use initial before or after Name as 'a.Name' or 'Name.a' \\n No space or Numbers  or Special characters allowed! ");
	}

}
