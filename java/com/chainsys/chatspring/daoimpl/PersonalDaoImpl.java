package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.chatspring.dao.PersonalDao;
import com.chainsys.chatspring.exceptions.InvalidMessageLengthException;
import com.chainsys.chatspring.exceptions.UserInvalidException;
import com.chainsys.chatspring.mapper.AnalyzeMapper;
import com.chainsys.chatspring.mapper.ReceiveImageMapper;
import com.chainsys.chatspring.mapper.ReceiveMapper;
import com.chainsys.chatspring.mapper.SentImageMapper;
import com.chainsys.chatspring.mapper.SentMapper;
import com.chainsys.chatspring.mapper.UserMapper;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.model.Register;

@Repository

public class PersonalDaoImpl implements PersonalDao{
	@Autowired
	JdbcTemplate jdbcTemplate;
	
	Logger logger = LoggerFactory.getLogger(PersonalDaoImpl.class);
	
	
	
	

//Only text 
	// ignoring it in controller for now
	public Integer sendMessage(PersonalChat personal) {
		String write = "insert into personalChat (sender,receiver,messageTime,reqStatus,message,messageId)values(?,?,localtimestamp,'Sending message',?,seq_id10.nextval)";
		Object[] params = { personal.getSender(), personal.getReceiver(), personal.getMessage() };

		int rows = jdbcTemplate.update(write, params);


		logger.info( " Row Inserted in personalChat message sent");

		return rows;

	}

	public Integer sendImage(PersonalChat personal) {
		String write = "insert into personalFiles (sender,receiver,messageTime,reqStatus,message,messageId,docs)values(?,?,localtimestamp,'Sending message',?,seq_id10.nextval,?)";
		Object[] params = { personal.getSender(), personal.getReceiver(), personal.getMessage(), personal.getDocs() };
		int rows = jdbcTemplate.update(write, params);


		logger.info(" Row Inserted in personalFiles message sent");
		return rows;

	}

	public List<PersonalChat> receive(/* PersonalChat personal, */HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String receive = "select sender,receiver,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where receiver =? order by messageId desc ";
		List<PersonalChat> receivedMessage = jdbcTemplate.query(receive, new ReceiveMapper(), userName);
		

			String change = "update personalChat set reqStatus='Message delivered!' where receiver =?";
			Object[] params1 = { userName };
			jdbcTemplate.update(change, params1);

			logger.info( "Message Request.. Row Updated as delivered");
			
			session.setAttribute("receivedMessage", receivedMessage);


		return receivedMessage;
	}

	public List<PersonalChat> sentMessage(/* PersonalChat personal, */HttpSession session,String userName) {

		String receive = "select receiver,reqStatus,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where sender =? order by messageId desc ";
		List<PersonalChat> sentMessage = jdbcTemplate.query(receive, new SentMapper(), userName);

			session.setAttribute("sentMessage", sentMessage);


		return sentMessage;
	}
	public List<PersonalChat> sentImage(HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String receive = "select receiver,reqStatus,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message,docs from personalFiles where sender =? order by messageId desc ";
		List<PersonalChat> sentImageMessage = jdbcTemplate.query(receive, new SentImageMapper(), userName);
		
		session.setAttribute("sentImageMessage", sentImageMessage);
		
		
		return sentImageMessage;
	}

	public boolean userExisting(String receiver) throws UserInvalidException {

		String query = "select userName from register where username=? ";
		List<Register> listOfUsers = jdbcTemplate.query(query, new UserMapper(), receiver);

		for (Register register : listOfUsers) {
			String userCheck = register.getUserName();
			
			if (!userCheck.equals(receiver)) {

				throw new UserInvalidException();
			} else {
				
				logger.info("Continue");
				return true;
			}
		}
		return false;

	}

	public Boolean messageCheck(PersonalChat pc) throws InvalidMessageLengthException {

		String message = pc.getMessage();
		if(message == null) {

			throw new InvalidMessageLengthException();
		} else {
			return true;
		}

	}

	public List<PersonalChat> allMessages(PersonalChat personalChat, HttpSession session) {
		String statusUpdate = "update report set reportstatus='Processing request....' where reportUserName=?";
		Object[] params = { personalChat.getSender() };
	    jdbcTemplate.update(statusUpdate, params);

		logger.info( " Rows Updated as report status by admin");

		String analyze = "select sender,receiver,messageTime,reqStatus,message,messageId from personalChat where sender=? order by messageId desc";
		List<PersonalChat> allMessage = jdbcTemplate.query(analyze, new AnalyzeMapper(), personalChat.getSender());


			session.setAttribute("allMessage", allMessage);

			return allMessage;
	}

	public List<PersonalChat> receiveImage(HttpSession session,String userName) {
		   
		String receive = "select sender,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,reqStatus,messageId,message,docs from personalFiles where receiver =? order by messageId desc ";
		List<PersonalChat> receivedImage = jdbcTemplate.query(receive, new ReceiveImageMapper(), userName);
		

			String change = "update personalFiles set reqStatus='Message delivered!' where receiver =?";
			Object[] params1 = { userName };
			jdbcTemplate.update(change, params1);

			logger.info( "Message Personalfiles Request.. Row Updated as delivered");
			
			session.setAttribute("receivedImage", receivedImage);


		return receivedImage;
	}
	
	
	

}
