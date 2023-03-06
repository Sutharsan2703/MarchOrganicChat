package com.chainsys.chatspring.dao;

import javax.servlet.http.HttpSession;

import com.chainsys.chatspring.exceptions.LoginInvalidException;

public interface LoginDao {

	public Boolean login(String userName, String password, HttpSession session) throws LoginInvalidException;

}
