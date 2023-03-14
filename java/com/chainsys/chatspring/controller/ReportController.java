package com.chainsys.chatspring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.model.Report;
import com.chainsys.chatspring.service.ChatService;

@Controller

public class ReportController {

	
	ChatService chat = new ChatService();

	
	PersonalChat personalChat =new PersonalChat();

	
	Report report = new Report();

	// User Create Report

	@PostMapping("/createReport")

	public String createReport(@RequestParam("reportUserName") String reportUserName,
			@RequestParam("reportContent") String reportContent, @RequestParam("userName") String userName,
			@RequestParam("messageId") Integer messageId, HttpSession session) {

		report.setReportUserName(reportUserName);
		report.setReportContent(reportContent);
		report.setUserName(userName);
		report.setMessageId(messageId);

		chat.reportUser(report);

		return "chatPage";

	}

	// View Report Status

	@GetMapping("/viewReportStatus")

	public String viewReportStatus(HttpSession session) {

		chat.reportStatusView(session);
		return "viewReportStatus";
	}

	// Administrator View report

	@GetMapping("/checkReport")

	public String check(HttpSession session) {

		chat.check(session);
		return "checkReport";
	}

	// Administrator Analyze report

	@PostMapping("/analyzeReport")

	public String analyzeReport(PersonalChat personalChat, HttpSession session) {

		chat.allMessages(personalChat, session);

		return "adminAnalyze";
	}

	// Warning or Suggestion to user

	@PostMapping("/warnUser")

	public String warnUser(@RequestParam("messageId") String messageId, HttpSession session) {

		session.setAttribute("messageId", messageId);
		return "warnUser";
	}

	// Updating Decision to Report

	@PostMapping("/reportDecision")

	public String reportDecision(@RequestParam("messageId") String messageId,
			@RequestParam("reportUserName") String reportUserName, @RequestParam("reportStatus") String reportStatus,
			HttpSession session) {

		chat.reportDecision(messageId, reportUserName, reportStatus);
		return "admin";
	}

}
