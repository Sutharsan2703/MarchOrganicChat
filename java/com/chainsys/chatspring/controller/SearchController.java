package com.chainsys.chatspring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.chatspring.service.ChatService;

@Controller
public class SearchController {

	@Autowired
	ChatService chat;

	// Search by sender - text

	@PostMapping("/searchBySender")

	public String searchBySender(@RequestParam("sender") String sender, HttpSession session) {

		chat.searchBySender(sender, session);

		return "receiveMessage";
	}

	// Search by sender - images

	@PostMapping("/searchImageBySender")

	public String searchImageBySender(@RequestParam("sender") String sender, HttpSession session) {

		chat.searchImageBySender(sender, session);

		return "receiveImage";
	}

	// Search by message content

	@PostMapping("/searchByMessage")

	public String searchByMessage(@RequestParam("message") String message, HttpSession session) {

		chat.searchByMessage(message, session);

		return "receiveMessage";
	}
	
	// Search by message Image content
	
	@PostMapping("/searchByImageMessage")
	
	public String searchByImageMessage(@RequestParam("message") String message, HttpSession session) {
		
		chat.searchByImageMessage(message, session);
		
		return "receiveImage";
	}

}
