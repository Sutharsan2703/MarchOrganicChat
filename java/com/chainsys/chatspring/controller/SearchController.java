package com.chainsys.chatspring.controller;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.chatspring.service.ChatService;

@Controller
public class SearchController {

	
	ChatService chat = new ChatService();

	String receiveTheMessage= "receiveMessage";
	
	// Search by sender - text

	@PostMapping("/searchBySender")

	public String searchBySender(@RequestParam("sender") String sender, HttpSession session) {

		chat.searchBySender(sender, session);

		return receiveTheMessage;
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

		return receiveTheMessage;
	}
	
	// Search by message Image content
	
	@PostMapping("/searchByImageMessage")
	
	public String searchByImageMessage(@RequestParam("message") String message, HttpSession session) {
		
		chat.searchByImageMessage(message, session);
		
		return "receiveImage";
	}
	
	// Search by message -date
	
	@PostMapping("/searchByDate")
	
	public String searchBydate(@RequestParam("from") Date from,@RequestParam("to") Date to, HttpSession session){
		
		chat.searchByDate(from,to, session);
		
		return receiveTheMessage ;
	}

}
