package com.chainsys.chatspring.daoimpl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import com.chainsys.chatspring.dao.SearchDao;
import com.chainsys.chatspring.mapper.ReceiveImageMapper;
import com.chainsys.chatspring.mapper.ReceiveMapper;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.util.ConnectionUtil;



public class SearchDaoImpl implements SearchDao {
	
	JdbcTemplate jdbcTemplate= ConnectionUtil.getJdbcTemplate();


	Logger logger = LoggerFactory.getLogger(SearchDaoImpl.class);

	String receivedMessage="receivedMessage";
	
//Search by sender on personal chat

	public List<PersonalChat> searchBySender(String sender, HttpSession session) {
		String receiver = session.getAttribute("userName").toString();
		String searchBySender = "select sender,receiver,messageTime,messageId,message from personalChat where sender=? and receiver =?";

		List<PersonalChat> searchSender = jdbcTemplate.query(searchBySender, new ReceiveMapper(), sender, receiver);
		logger.info("Search by sender's name");

		session.setAttribute("receivedMessage", searchSender);

		return searchSender;
	}

//Search by sender -image	

	public List<PersonalChat> searchImageBySender(String sender, HttpSession session) {
		String receiver = session.getAttribute("userName").toString();
		String searchByImageSender = "select sender,messageTime,reqStatus,messageId,message,docs from personalFiles where sender=? and receiver =?";

		List<PersonalChat> searchImageSender = jdbcTemplate.query(searchByImageSender, new ReceiveImageMapper(), sender,
				receiver);
		logger.info("Search by sender's name");

		session.setAttribute("receivedImage", searchImageSender);

		return searchImageSender;
	}

//Search by Message - text	

	public List<PersonalChat> searchByMessage(String message, HttpSession session) {
		String receiver = session.getAttribute("userName1").toString();
		String searchByMessage = "select sender,messageTime,messageId,message from personalChat where receiver =? and message like ? ";

		List<PersonalChat> searchMessage = jdbcTemplate.query(searchByMessage, new ReceiveMapper(), receiver, "%"+message + "%");
		logger.info("Search by Message");

		session.setAttribute(receivedMessage, searchMessage);

		return searchMessage;
	}
	
	
//Search by Message - Image 
	
	public List<PersonalChat> searchByImageMessage(String message, HttpSession session) {
		String receiver = session.getAttribute("userName1").toString();

		String searchByImageMessage = "select sender,messageTime,reqStatus,messageId,message,docs from personalFiles where receiver =? and message like ? ";
		
		List<PersonalChat> searchImageMessage = jdbcTemplate.query(searchByImageMessage, new ReceiveImageMapper(), receiver, "%"+message + "%");
		logger.info("Search by Image Message");
		
		session.setAttribute("receivedImage", searchImageMessage);
		
		return searchImageMessage;
	}

	public List<PersonalChat> searchByDate(Date from, Date to,HttpSession session, String receiver) {

	
		String searchByDate = "select receiver,sender,messageTime,messageId,message from personalChat where receiver =? and messageTime  between ? and ? ";
		
		List<PersonalChat> searchDateMessage = jdbcTemplate.query(searchByDate, new ReceiveMapper(), receiver,from,to);
		logger.info("Search by Date Message");
		
		session.setAttribute(receivedMessage, searchDateMessage);
		
		return searchDateMessage;
		
			
	}


}
