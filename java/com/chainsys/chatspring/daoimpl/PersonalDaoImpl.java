package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
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
import com.chainsys.chatspring.util.ConnectionUtil;



public class PersonalDaoImpl implements PersonalDao {
	
	JdbcTemplate jdbcTemplate= ConnectionUtil.getJdbcTemplate();

	
	Logger logger = LoggerFactory.getLogger(PersonalDaoImpl.class);

//One to one text messages

	public Integer sendMessage(PersonalChat personal) {
		String write = "insert into personalChat (sender,receiver,messageTime,reqStatus,message,messageId)values(?,?,localtimestamp,'Sending message',?,seq_id10.nextval)";
		Object[] params = { personal.getSender(), personal.getReceiver(), personal.getMessage() };

		Integer rows = jdbcTemplate.update(write, params);

		logger.info(" Row Inserted in personalChat message sent");

		return rows;

	}

//One to one image sharing

	public Integer sendImage(PersonalChat personal) {
		String writeImage = "insert into personalFiles (sender,receiver,messageTime,reqStatus,message,messageId,docs)values(?,?,localtimestamp,'Sending message',?,seq_id10.nextval,?)";
		Object[] params = { personal.getSender(), personal.getReceiver(), personal.getMessage(), personal.getDocs() };
		Integer rows = jdbcTemplate.update(writeImage, params);

		logger.info(" Row Inserted in personalFiles message sent");
		return rows;

	}

//Receive text messages 	

	public List<PersonalChat> receive(/* PersonalChat personal, */HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String receive = "select sender,receiver,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where receiver =? order by messageId desc ";
		List<PersonalChat> receivedMessage = jdbcTemplate.query(receive, new ReceiveMapper(), userName);

		String change = "update personalChat set reqStatus='Message delivered!' where receiver =?";
		Object[] params1 = { userName };
		jdbcTemplate.update(change, params1);

		logger.info("Message Request.. Row Updated as delivered");

		session.setAttribute("receivedMessage", receivedMessage);

		return receivedMessage;
	}

//View sent messages	

	public List<PersonalChat> sentMessage(/* PersonalChat personal, */HttpSession session, String userName) {

		String viewSent = "select receiver,reqStatus,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where sender =? order by messageId desc ";
		List<PersonalChat> sentMessage = jdbcTemplate.query(viewSent, new SentMapper(), userName);

		session.setAttribute("sentMessage", sentMessage);

		return sentMessage;
	}

//View sent images

	public List<PersonalChat> sentImage(HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String receive = "select receiver,reqStatus,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message,docs from personalFiles where sender =? order by messageId desc ";
		List<PersonalChat> sentImage= jdbcTemplate.query(receive, new SentImageMapper(), userName);

		session.setAttribute("sentImageMessage", sentImage);

		return sentImage;
	}

//Validate whether the user exists	

	public Boolean userExisting(String receiver) throws UserInvalidException {

		String query = "select userName from register where userName=? ";
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

// Check the length of the messages	

	public Boolean messageCheck(PersonalChat pc) throws InvalidMessageLengthException {

		String message = pc.getMessage();
		if (message == null) {

			throw new InvalidMessageLengthException();
		} else {
			return true;
		}

	}

//Administrator to view all messages of a particular user if any Report is raised  	

	public List<PersonalChat> allMessages(PersonalChat personalChat, HttpSession session) {
		
		String statusUpdate = "update report set reportStatus='Processing request....' where reportUserName=?";
		Object[] params = { personalChat.getSender() };
		jdbcTemplate.update(statusUpdate, params);

		logger.info(" Rows Updated as report status by admin");

		String analyze = "select sender,receiver,messageTime,reqStatus,message,messageId from personalChat where sender=? order by messageId desc";
		List<PersonalChat> allMessage = jdbcTemplate.query(analyze, new AnalyzeMapper(), personalChat.getSender());

		session.setAttribute("allMessage", allMessage);

		return allMessage;
	}

//One to one receiving images	

	public List<PersonalChat> receiveImage(HttpSession session, String userName) {

		String receive = "select sender,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,reqStatus,messageId,message,docs from personalFiles where receiver =? order by messageId desc ";
		List<PersonalChat> receivedImage = jdbcTemplate.query(receive, new ReceiveImageMapper(), userName);

		String change = "update personalFiles set reqStatus='Message delivered!' where receiver =?";
		Object[] params1 = { userName };
		jdbcTemplate.update(change, params1);

		logger.info("Message Personalfiles Request.. Row Updated as delivered");

		session.setAttribute("receivedImage", receivedImage);

		return receivedImage;
	}

}
