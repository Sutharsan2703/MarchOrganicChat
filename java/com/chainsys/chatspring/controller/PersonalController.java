package com.chainsys.chatspring.controller;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.chainsys.chatspring.exceptions.UserInvalidException;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.service.ChatService;

@Controller
public class PersonalController {

	@Autowired
	ChatService chat;

	@Autowired
	PersonalChat personalChat;

	// Sending Message (One To One communication)

	@PostMapping("/send")
	public String sendPersonal(@RequestParam("sender") String sender, @RequestParam("receiver") String receiver,
			@RequestParam("message") String message, HttpSession session) throws UserInvalidException {

		personalChat.setSender(sender);

		chat.userExisting(receiver);
		personalChat.setReceiver(receiver);

		personalChat.setMessage(message);

		chat.sendMessage(personalChat);

		session.setAttribute("userName", sender);

		if (sender.equals("admi2101")) {
			return "admin";
		} else
			return "chatPage";
	}

	// Sending Image (One To One communication)

	@PostMapping("/sendImage")

	public String sendImage(@RequestParam("sender") String sender, @RequestParam("receiver") String receiver,
			@RequestParam("message") String message, @RequestParam("image") MultipartFile image, HttpSession session)
			throws UserInvalidException, IOException {

		personalChat.setSender(sender);

		chat.userExisting(receiver);
		personalChat.setReceiver(receiver);

		personalChat.setMessage(message);

		String fileName = image.getOriginalFilename();
		try (FileInputStream input = new FileInputStream(
				"\\Users\\suth3338\\eclipse-workspace\\final-project\\organicChat\\src\\main\\webapp\\Images\\ShareImages\\"
						+ fileName);) {

			byte[] doc = input.readAllBytes();

			personalChat.setDocs(doc);

			chat.sendImage(personalChat);
			session.setAttribute("userName", sender);

			if (sender.equals("admi2101")) {
				return "admin";
			} else {
				return "chatPage";
			}
		}

	}

	// receiving the messages and updating the message status

	@GetMapping("/receive")
	public String receive(HttpSession session) {

		chat.receive(session);
		return "receiveMessage";
	}

	// receiving the messages and updating the message status on Image (One to One)

	@GetMapping("/receiveImage")
	public String receiveImage(HttpSession session) {

		chat.receiveImage(session);
		return "receiveImage";
	}

	// view the message sent by user Logged

	@GetMapping("/sent")
	public String sent(HttpSession session) {

		chat.sentMessage(session);

		return "sentMessage";
	}

	// view the Image sent by user Logged

	@GetMapping("/sentImage")
	public String sentImage(HttpSession session) {

		chat.sentImage(session);

		return "sentImageMessage";
	}

	// Reply UserName Suggestion

	@PostMapping("/replyController")

	public String response(@RequestParam("senderId") String senderId, HttpSession session) {
		session.setAttribute("senderId", senderId);
		return "replyOnReceived";
	}

	// Reply Image Suggestion

	@PostMapping("/replyImageController")

	public String responseImage(@RequestParam("senderId") String senderId, HttpSession session) {
		session.setAttribute("senderId", senderId);
		return "replyOnImage";
	}

}
