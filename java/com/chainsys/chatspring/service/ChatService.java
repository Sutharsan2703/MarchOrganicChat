package com.chainsys.chatspring.service;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chainsys.chatspring.dao.SearchDao;
import com.chainsys.chatspring.daoimpl.CommuneDaoImpl;
import com.chainsys.chatspring.daoimpl.LoginDaoImpl;
import com.chainsys.chatspring.daoimpl.PersonalDaoImpl;
import com.chainsys.chatspring.daoimpl.RegisterDaoImpl;
import com.chainsys.chatspring.daoimpl.ReportDaoImpl;
import com.chainsys.chatspring.daoimpl.SearchDaoImpl;
import com.chainsys.chatspring.exceptions.EntryInvalidException;
import com.chainsys.chatspring.exceptions.LoginInvalidException;
import com.chainsys.chatspring.exceptions.MailExistsException;
import com.chainsys.chatspring.exceptions.PasswordValidException;
import com.chainsys.chatspring.exceptions.UserInvalidException;
import com.chainsys.chatspring.model.Commune;
import com.chainsys.chatspring.model.Login;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.model.Register;
import com.chainsys.chatspring.model.Report;

@Service
public class ChatService {

	RegisterDaoImpl registerDaoImpl = new RegisterDaoImpl();

	Register register = new Register();

	Login login = new Login();

	LoginDaoImpl loginDaoImpl = new LoginDaoImpl();

	PersonalChat personalChat = new PersonalChat();

	PersonalDaoImpl personalDaoImpl = new PersonalDaoImpl();

	Report report = new Report();

	ReportDaoImpl reportDaoImpl = new ReportDaoImpl();

	Commune commune = new Commune();

	CommuneDaoImpl communeDaoImpl = new CommuneDaoImpl();

	SearchDaoImpl searchDaoImpl = new SearchDaoImpl();

	// Registration

	public void mailIdExisting(String mail) throws MailExistsException {

		registerDaoImpl.mailIdExisting(mail);
	}

	public void registerUser(Register register, HttpSession session) {

		registerDaoImpl.registerUser(register, session);

	}

	// Get User Name after registration

	public Boolean findName(String mail, HttpSession session) {

		return registerDaoImpl.findName(mail, session);
	}

	public Boolean forgotPassword(Register register, HttpSession session) throws PasswordValidException {

		if (registerDaoImpl.forgotPassword(register, session).equals(true)) {
			return true;
		} else if (registerDaoImpl.forgotPassword(register, session).equals(false)) {
			return false;
		} else
			throw new PasswordValidException();

	}

	// reset Password

	public void resetPassword(Register register) {
		registerDaoImpl.resetPassword(register);
	}

	// Login

	public Boolean login(String userName, String password, HttpSession session) throws LoginInvalidException {

		if (loginDaoImpl.login(userName, password, session).equals(true)) {
			return true;
		} else
			throw new LoginInvalidException();
	}

	// User report creation

	public void reportUser(Report report) {

		reportDaoImpl.reportUser(report);

	}

	// Report status checking by user regarding their report

	public void reportStatusView(HttpSession session) {

		reportDaoImpl.reportStatusView(session);

	}

	// Administrator Report view/check

	public void check(HttpSession session) {

		reportDaoImpl.check(session);

	}

	// Administrator view for all messages to make action regarding report

	public void allMessages(PersonalChat personalChat, HttpSession session) {

		personalDaoImpl.allMessages(personalChat, session);
	}

	// Administrator making Decision on report and update status

	public void reportDecision(String messageId, String reportUserName, String reportStatus) {
		reportDaoImpl.reportDecision(messageId, reportUserName, reportStatus);
	}

	// Check user Existing While messaging (One to One) communication

	public void userExisting(String receiver) throws UserInvalidException {

		personalDaoImpl.userExisting(receiver);

	}

	// Sending Message to individual

	public void sendMessage(PersonalChat personalChat) {
		personalDaoImpl.sendMessage(personalChat);
	}

	// Send image files with the individuals

	public void sendImage(PersonalChat personalChat) {

		personalDaoImpl.sendImage(personalChat);
	}

	// Receive message (One to One)

	public void receive(HttpSession session) {

		personalDaoImpl.receive(session);
	}

	// Receive Image (One to One)

	public void receiveImage(HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		personalDaoImpl.receiveImage(session, userName);
	}

	// message by user sent by them

	public void sentMessage(HttpSession session) {
		String userName1 = (String) session.getAttribute("userName");

		personalDaoImpl.sentMessage(session, userName1);
	}

	// image by user sent by them

	public void sentImage(HttpSession session) {

		personalDaoImpl.sentImage(session);
	}

	// Commune Creation

	public void createCommune(Commune commune, HttpSession session) {

		communeDaoImpl.createCommune(commune, session);

	}

	// Join Commune

	public void joinCommune(Commune commune) throws EntryInvalidException {
		communeDaoImpl.joinCommune(commune);
	}

	// Message to Commune

	public void createMessage(Commune commune) {

		communeDaoImpl.createMessage(commune);
	}

	// Text message to Commune

	public void textMessage(Commune commune) {

		communeDaoImpl.textMessage(commune);
	}

	// List a commune to user they are a part

	public void listCommune(HttpSession session) {

		communeDaoImpl.listCommune(session);

	}

	// Member list on that particular Commune

	public void memberListCommune(HttpSession session) {
		Integer communeId = (Integer) session.getAttribute("communeId");

		communeDaoImpl.memberListCommune(session, communeId);
	}

	// Receive image included with texts

	public void receiveCommune(HttpSession session) {

		communeDaoImpl.receiveCommune(session);
	}

	// Receive text Messages from commune

	public void textReceiveCommune(HttpSession session) {
		Integer communeId = (Integer) session.getAttribute("communeId");

		communeDaoImpl.textReceiveCommune(session, communeId);
	}

	// Searching messages by sender as attribute

	public void searchBySender(String sender, HttpSession session) {
		searchDaoImpl.searchBySender(sender, session);

	}
	// Searching Images messages by sender as attribute

	public void searchImageBySender(String sender, HttpSession session) {
		searchDaoImpl.searchImageBySender(sender, session);

	}

	// Search messages by content

	public void searchByMessage(String message, HttpSession session) {
		searchDaoImpl.searchByMessage(message, session);
	}

	// Search messages by image content

	public void searchByImageMessage(String message, HttpSession session) {
		searchDaoImpl.searchByImageMessage(message, session);
	}

	public void searchByDate(Date from, Date to, HttpSession session) {
		String receiver = session.getAttribute("userName1").toString();

		searchDaoImpl.searchByDate(from, to, session, receiver);

	}

}
