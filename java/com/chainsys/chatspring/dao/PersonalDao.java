package com.chainsys.chatspring.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.chainsys.chatspring.exceptions.InvalidMessageLengthException;
import com.chainsys.chatspring.exceptions.UserInvalidException;
import com.chainsys.chatspring.model.PersonalChat;

public interface PersonalDao {

	public Integer sendMessage(PersonalChat personal);

	public Integer sendImage(PersonalChat personal);

	public List<PersonalChat> receive(HttpSession session);

	public List<PersonalChat> sentMessage(HttpSession session, String userName);

	public List<PersonalChat> sentImage(HttpSession session);

	public Boolean userExisting(String receiver) throws UserInvalidException;

	public Boolean messageCheck(PersonalChat pc) throws InvalidMessageLengthException;

	public List<PersonalChat> receiveImage(HttpSession session, String userName);

}
