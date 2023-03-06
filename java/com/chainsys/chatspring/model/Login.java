package com.chainsys.chatspring.model;

import org.springframework.stereotype.Repository;

@Repository
public class Login {

	// POJO- Plain Old Java Object

	private String loginName;
	private String loginUserName;
	private String loginSecurity;
	private String loginPassword;
	private String loginConfirmPassword;

	public Login() {
		super();
	}

	public Login(String loginName, String loginUserName, String loginSecurity, String loginPassword,
			String loginConfirmPassword) {
		
		this.loginName = loginName;
		this.loginUserName = loginUserName;
		this.loginSecurity = loginSecurity;
		this.loginPassword = loginPassword;
		this.loginConfirmPassword = loginConfirmPassword;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getLoginUserName() {
		return loginUserName;
	}

	public void setLoginUserName(String loginUserName) {
		this.loginUserName = loginUserName;
	}

	public String getLoginSecurity() {
		return loginSecurity;
	}

	public void setLoginSecurity(String loginSecurity) {
		this.loginSecurity = loginSecurity;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getLoginConfirmPassword() {
		return loginConfirmPassword;
	}

	public void setLoginConfirmPassword(String loginConfirmPassword) {
		this.loginConfirmPassword = loginConfirmPassword;
	}

	@Override
	public String toString() {
		return "Login [loginName=" + loginName + ", loginUserName=" + loginUserName + ", loginSecurity=" + loginSecurity
				+ ", loginPassword=" + loginPassword + ", loginConfirmPassword=" + loginConfirmPassword + "]";
	}

	
}
