package com.chainsys.chatspring.model;

import java.sql.Date;

import org.springframework.stereotype.Repository;

@Repository
public class Report {

	private Integer reportId;
	private Date reportDate;
	private String reportUserName;
	private String reportContent;
	private Integer communeId;
	private String userName;
	private Integer messageId;
	private String reportStatus;

	public Report() {
		super();

	}

	public Report(Integer reportId, Date reportDate, String reportUserName, String reportContent) {
		super();
		this.reportId = reportId;
		this.reportDate = reportDate;
		this.reportUserName = reportUserName;
		this.reportContent = reportContent;
	}

	public Report(Integer communeId, String userName, Integer messageId, String reportStatus) {
		super();
		this.communeId = communeId;
		this.userName = userName;
		this.messageId = messageId;
		this.reportStatus = reportStatus;
	}

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportUserName() {
		return reportUserName;
	}

	public void setReportUserName(String reportUserName) {
		this.reportUserName = reportUserName;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public Integer getCommuneId() {
		return communeId;
	}

	public void setCommuneId(Integer communeId) {
		this.communeId = communeId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public String getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}

	@Override
	public String toString() {
		return "Report [reportId=" + reportId + ", reportDate=" + reportDate + ", reportUserName=" + reportUserName
				+ ", reportContent=" + reportContent + ", communeId=" + communeId + ", userName=" + userName
				+ ", messageId=" + messageId + ", reportStatus=" + reportStatus + "]";
	}

}
