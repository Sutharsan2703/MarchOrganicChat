package com.chainsys.chatspring.model;

import java.util.Arrays;



//Plain Old Java Object - pojo
public class PersonalChat {
	private Integer messageId;
	private String reqStatus;
	private String sender;
	private String receiver;

	private String message;
	private String messageTime;

	private String image;
	
	private byte[] docs;
	private String path;

	public PersonalChat() {
		super();
	}

	public PersonalChat(Integer messageId, String reqStatus, String sender, String receiver, String message,
			String messageTime, String image) {
		super();
		this.messageId = messageId;
		this.reqStatus = reqStatus;
		this.sender = sender;
		this.receiver = receiver;
		this.message = message;
		this.messageTime = messageTime;
		this.image = image;
	}
	

	public PersonalChat(byte[] docs, String path) {
		super();
		this.docs = docs;
		this.path = path;
	}

	public Integer getMessageId() {
		return messageId;
	}

	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}

	public String getReqStatus() {
		return reqStatus;
	}

	public void setReqStatus(String reqStatus) {
		this.reqStatus = reqStatus;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;

	}

	
	
	public byte[] getDocs() {
		return docs;
	}

	public void setDocs(byte[] docs) {
		this.docs = docs;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "PersonalChat [messageId=" + messageId + ", reqStatus=" + reqStatus + ", sender=" + sender
				+ ", receiver=" + receiver + ", message=" + message + ", messageTime=" + messageTime + ", image="
				+ image + ", docs=" + Arrays.toString(docs) + ", path=" + path + "]";
	}

}
