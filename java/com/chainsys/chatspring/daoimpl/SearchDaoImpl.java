package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.chatspring.dao.SearchDao;
import com.chainsys.chatspring.mapper.ReceiveImageMapper;
import com.chainsys.chatspring.mapper.ReceiveMapper;
import com.chainsys.chatspring.model.PersonalChat;

@Repository

public class SearchDaoImpl implements SearchDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	Logger logger = LoggerFactory.getLogger(SearchDaoImpl.class);

//Search by sender on personal chat

	public List<PersonalChat> searchBySender(String sender, HttpSession session) {
		String receiver = session.getAttribute("userName").toString();
		String searchSend = "select sender,receiver,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where sender=? and receiver =?";

		List<PersonalChat> searchSender = jdbcTemplate.query(searchSend, new ReceiveMapper(), sender, receiver);
		logger.info("Search by sender's name");

		session.setAttribute("receivedMessage", searchSender);

		return searchSender;
	}

//Search by sender -image	

	public List<PersonalChat> searchImageBySender(String sender, HttpSession session) {
		String receiver = session.getAttribute("userName").toString();
		String searchImageSend = "select sender,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,reqStatus,messageId,message,docs from personalFiles where sender=? and receiver =?";

		List<PersonalChat> searchImageSender = jdbcTemplate.query(searchImageSend, new ReceiveImageMapper(), sender,
				receiver);
		logger.info("Search by sender's name");

		session.setAttribute("receivedImage", searchImageSender);

		return searchImageSender;
	}

//Search by Message - text	

	public List<PersonalChat> searchByMessage(String message, HttpSession session) {
		String receiver = session.getAttribute("userName1").toString();
		String searchByMessage = "select sender,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,messageId,message from personalChat where receiver =? and message like ? ";

		List<PersonalChat> searchMessage = jdbcTemplate.query(searchByMessage, new ReceiveMapper(), receiver, "%"+message + "%");
		logger.info("Search by Message");

		session.setAttribute("receivedMessage", searchMessage);

		return searchMessage;
	}
	
	
//Search by Message - Image 
	
	public List<PersonalChat> searchByImageMessage(String message, HttpSession session) {
		String receiver = session.getAttribute("userName1").toString();

		String searchByImageMessage = "select sender,to_char(messagetime, 'dd-mm-yyyy hh24:mi:ss')messageTime,reqStatus,messageId,message,docs from personalFiles where receiver =? and message like ? ";
		
		List<PersonalChat> searchImageMessage = jdbcTemplate.query(searchByImageMessage, new ReceiveImageMapper(), receiver, "%"+message + "%");
		logger.info("Search by Image Message");
		
		session.setAttribute("receivedImage", searchImageMessage);
		
		return searchImageMessage;
	}

}
