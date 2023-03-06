package com.chainsys.chatspring.model;

import java.sql.Blob;
import java.sql.Date;
import java.util.Arrays;

import org.springframework.stereotype.Repository;

@Repository

public class Commune {
	// Plain Old Java Object

	private String communeName;
	private Integer communeId;
	private Integer password;
	private String members;
	private Date dateOfCreation;
	// message process
	private String message;
	private String messageTime;
	private String sender;
	private Integer views;
	private String viewedBy;
	private byte[] docs;
	private String path;

	public Commune() {

	}


	public Commune(String communeName, Integer communeId, Integer password, String members, Date dateOfCreation) {
		this.communeName = communeName;
		this.communeId = communeId;
		this.password = password;
		this.members = members;
		this.dateOfCreation = dateOfCreation;
	}

	public Commune(String message, String messageTime, String sender, Integer views, String viewedBy, byte[] docs,
			String path) {
		this.message = message;
		this.messageTime = messageTime;
		this.sender = sender;
		this.views = views;
		this.viewedBy = viewedBy;
		this.docs = docs;
		this.path = path;
	}




	public Commune(String path) {
		super();
		this.path = path;
	}

	public String getCommuneName() {
		return communeName;
	}

	public void setCommuneName(String communeName) {
		this.communeName = communeName;
	}

	public Integer getCommuneId() {
		return communeId;
	}

	public void setCommuneId(Integer communeId) {
		this.communeId = communeId;
	}

	public Integer getPassword() {
		return password;
	}

	public void setPassword(Integer password) {
		this.password = password;
	}

	public String getMembers() {
		return members;
	}

	public void setMembers(String members) {
		this.members = members;
	}

	public Date getDateOfCreation() {
		return dateOfCreation;
	}

	public void setDateOfCreation(Date dateOfCreation) {
		this.dateOfCreation = dateOfCreation;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getMessageTime() {
		return messageTime;
	}

	public void setMessageTime(String messageTime) {
		this.messageTime = messageTime;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}

	public String getViewedBy() {
		return viewedBy;
	}

	public byte[] getDocs() {
		return docs;
	}

	public void setDocs(byte[] docs) {
		this.docs = docs;
	}

	public void setViewedBy(String viewedBy) {
		this.viewedBy = viewedBy;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Commune [communeName=" + communeName + ", communeId=" + communeId + ", password=" + password
				+ ", members=" + members + ", dateOfCreation=" + dateOfCreation + ", message=" + message
				+ ", messageTime=" + messageTime + ", sender=" + sender + ", views=" + views + ", viewedBy=" + viewedBy
				+ ", docs=" + Arrays.toString(docs) + ", path=" + path + "]";
	}

}
