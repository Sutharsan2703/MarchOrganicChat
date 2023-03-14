package com.chainsys.chatspring.model;


public class Register {

	// POJO - Plain old Java Object

	private String name;
	private String mailId;
	private Integer userId;
	private String userName;
	private String security;
	private String password;
	private String confirmPassword;
	private String loginDate;

	public Register() {
		super();
	}

	public Register(String name, String mailId, Integer userId, String userName) {
		super();
		this.name = name;
		this.mailId = mailId;
		this.userId = userId;
		this.userName = userName;
	}

	public Register(String security, String password, String confirmPassword, String loginDate) {
		super();
		this.security = security;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.loginDate = loginDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSecurity() {
		return security;
	}

	public void setSecurity(String security) {
		this.security = security;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}

	@Override
	public String toString() {
		return "Registration [name=" + name + ", mailId=" + mailId + ", userId=" + userId + ", userName=" + userName
				+ ", security=" + security + ", password=" + password + ", confirmPassword=" + confirmPassword
				+ ", loginDate=" + loginDate + "]";
	}

}
