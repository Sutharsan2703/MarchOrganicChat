package com.chainsys.chatspring.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.chainsys.chatspring.exceptions.EntryInvalidException;
import com.chainsys.chatspring.exceptions.LoginInvalidException;
import com.chainsys.chatspring.exceptions.MailExistsException;
import com.chainsys.chatspring.exceptions.MailInvalidException;
import com.chainsys.chatspring.exceptions.NameInvalidException;
import com.chainsys.chatspring.exceptions.PasswordValidException;
import com.chainsys.chatspring.exceptions.SecureValidException;
import com.chainsys.chatspring.model.Commune;
import com.chainsys.chatspring.model.Login;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.model.Register;
import com.chainsys.chatspring.model.Report;
import com.chainsys.chatspring.service.ChatService;
import com.chainsys.chatspring.validate.Validation;

@Controller
public class RegisterController {

	
	ChatService chat = new ChatService();

	
	Register register = new Register();

	
	Login login = new Login();

	
	PersonalChat personalChat = new PersonalChat();

	
	Report report = new Report();

	
	Commune commune = new Commune();

//Home page	

	@RequestMapping("/")
	public String home() {
		return "home";

	}

//Registration Controller	

	@PostMapping("/register")
	public String register(@RequestParam("name") String name, @RequestParam("mailId") String mailId,
			@RequestParam("userName") String userName, @RequestParam("security") String security,
			@RequestParam("password") String password, @RequestParam("confirm") String confirm, HttpSession session) {

		Validation valid = new Validation();
		try {
			valid.nameValid(name);
			register.setName(name);

			String mail = mailId.toLowerCase();
			valid.mailValid(mail);
			chat.mailIdExisting(mail);

			register.setMailId(mail);

			register.setUserName(userName);

			valid.securityQuestion(security);
			register.setSecurity(security);

			valid.passwordValid(password);
			register.setPassword(password);

			register.setConfirmPassword(confirm);

			chat.registerUser(register, session);

			return "registerLogin";

		} catch (NameInvalidException | MailInvalidException | SecureValidException | PasswordValidException
				| MailExistsException e) {

			return "register";
		}
	}

// Get userName from Database	

	@PostMapping("/getUserName")
	public String checkName(@RequestParam("mailId") String mailId, HttpSession session) {

		String mail = mailId.toLowerCase();
		register.setMailId(mail);
		if (chat.findName(mail, session).equals(true)) {
			return "registerLogin";
		} else {
			return "home";
		}
	}

// Get security from Database on forgot password	

	@PostMapping("/forgotPassword")
	public String forgotPassword(@RequestParam("mailId") String mailId, @RequestParam("security") String security,
			HttpSession session) throws PasswordValidException {

		String mail = mailId.toLowerCase();
		register.setMailId(mail);

		register.setSecurity(security);
		if (chat.forgotPassword(register, session).equals(true)) {
			return "resetPassword";
		} else if (chat.forgotPassword(register, session).equals(false)) {

			return "uName";
		}
		return "uName";
	}

//reset password	

	@PostMapping("/resetPassword")
	public String resetPassword(@RequestParam("password") String password,
			@RequestParam("confirm") String confirmPassword, @RequestParam("mailId") String mailId,
			HttpSession session) {
		String mail = mailId.toLowerCase();
		register.setPassword(password);
		register.setConfirmPassword(confirmPassword);
		register.setMailId(mail);

		chat.resetPassword(register);
		return "login";
	}

// Login controller	

	@PostMapping("/login")
	public String login(@RequestParam("userName") String userName, @RequestParam("password") String password,
			HttpSession session) {

		login.setLoginName(userName);
		login.setLoginPassword(password);

		try {
			if (chat.login(userName, password, session).equals(true)) {
				if (userName.equals("admi2101")) {

					return "admin";
				} else {

					return "chatPage";
				}
			} else {
				return "loginFailed";

			}
		} catch (LoginInvalidException e) {

			Logger logger = LoggerFactory.getLogger(LoginInvalidException.class);
			logger.error("Invalid Login", e);
		}

		return "loginFailed";
	}

//Logout the session and return home	

	@RequestMapping("/logout")
	public String logout(HttpSession session) {

		session.invalidate();

		return "home";
	}

	/* From Commune */

// 	Create a commune(group)

	@PostMapping("/createCommune")
	public String createCommune(@RequestParam("communeName") String communeName,
			@RequestParam("password") Integer password, @RequestParam("members") String members, HttpSession session) {

		commune.setCommuneName(communeName);
		commune.setPassword(password);
		commune.setMembers(members);

		chat.createCommune(commune, session);

		return "communeList";
	}

// Connect/ Join  Commune

	@PostMapping("/joinCommune")
	public String joinCommune(@RequestParam("communeId") Integer communeId, @RequestParam("password") Integer password,
			@RequestParam("members") String members, HttpSession session) throws EntryInvalidException {

		commune.setCommuneId(communeId);
		commune.setPassword(password);
		commune.setMembers(members);

		chat.joinCommune(commune);

		return "communeList";
	}

//Reply on Commune 
	@PostMapping("/replyCommuneController")
	public String responseCommune(@RequestParam("communeId") String communeId, HttpSession session) {
		session.setAttribute("communeId", communeId);
		return "communeReply";
	}

//Reply on Commune Text
	@PostMapping("/commTextController")
	public String textResponseCommune(@RequestParam("communeId") String communeId, HttpSession session) {
		session.setAttribute("communeId", communeId);
		return "commTextReply";
	}

}
