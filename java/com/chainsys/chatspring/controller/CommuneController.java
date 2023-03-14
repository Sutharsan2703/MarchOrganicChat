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

import com.chainsys.chatspring.model.Commune;
import com.chainsys.chatspring.service.ChatService;

@Controller
public class CommuneController {

	ChatService chat = new ChatService();

	Commune commune = new Commune();

// message on commune

	@PostMapping("/sendCommune")

	public String sendCommune(@RequestParam("communeId") Integer communeId, @RequestParam("sender") String sender,
			@RequestParam("message") String message, @RequestParam("image") MultipartFile image, HttpSession session)
			throws IOException {

		commune.setCommuneId(communeId);
		commune.setSender(sender);
		commune.setMessage(message);

		// Not to be hard coded for security reasons - on q-gate

		String fileName = image.getOriginalFilename();
		try (FileInputStream input = new FileInputStream(
				"\\Users\\suth3338\\eclipse-workspace\\final-project\\organicChat\\src\\main\\webapp\\Images\\ShareImages\\"
						+ fileName);) {

			byte[] doc = input.readAllBytes();

			commune.setDocs(doc);

			chat.createMessage(commune);
			return "chatPage";

		}
	}

//	Only text on commune

	@PostMapping("/textCommune")

	public String textCommune(@RequestParam("communeId") Integer communeId, @RequestParam("sender") String sender,
			@RequestParam("message") String message, HttpSession session) {
		commune.setCommuneId(communeId);
		commune.setSender(sender);
		commune.setMessage(message);
		chat.textMessage(commune);
		return "commReceiveText";

	}

//List of commune

	@GetMapping("/communeList")
	public String communeList(HttpSession session) {
		chat.listCommune(session);
		return "communeList";
	}

//List of communeMembers

	@GetMapping("/membersList")
	public String communeMembersList(HttpSession session) {
		chat.memberListCommune(session);
		return "communeMembers";
	}

//Commune messages receiving  and updating the message status 

	@PostMapping("/receiveCommune")
	public String receiveCommune(@RequestParam("communeId") Integer communeId, HttpSession session) {
		session.setAttribute("communeId", communeId);

		chat.receiveCommune(session);
		return "communeReceive";
	}

//Commune messages receiving  and updating the  text message status 

	@PostMapping("/textReceiveCommune")
	public String textReceiveCommune(@RequestParam("communeId") Integer communeId, HttpSession session) {
		session.setAttribute("communeId", communeId);

		chat.textReceiveCommune(session);
		return "commReceiveText";

	}

	/* few Commune controllers on Register */

}
