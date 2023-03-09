package com.chainsys.chatspring.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.chainsys.chatspring.model.PersonalChat;

public interface SearchDao {

	public List<PersonalChat> searchBySender(String sender, HttpSession session);

	public List<PersonalChat> searchImageBySender(String sender, HttpSession session);

	public List<PersonalChat> searchByMessage(String time, HttpSession session);

	public List<PersonalChat> searchByImageMessage(String message, HttpSession session);

}
