package com.chainsys.chatspring.dao;

import javax.servlet.http.HttpSession;

import com.chainsys.chatspring.exceptions.MailExistsException;
import com.chainsys.chatspring.model.Register;

public interface RegisterDao {

	public Integer registerUser(Register register, HttpSession session);

	public void mailIdExisting(String mailId) throws MailExistsException;

	public Boolean findName(String mailId, HttpSession session);

	public Boolean forgotPassword(Register register, HttpSession session);

	public Boolean resetPassword(Register register);

}
