package com.chainsys.chatspring.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.chainsys.chatspring.model.Report;

public interface ReportDao {

	public Integer reportUser(Report report);

	public List<Report> check(HttpSession session);

	public Integer reportStatus(String messageId);

	public List<Report> reportStatusView(HttpSession session);

	public Integer reportDecision(String messageId, String reportUserName, String reportStatus);

}
