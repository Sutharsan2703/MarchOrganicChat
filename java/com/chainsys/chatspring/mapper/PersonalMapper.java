package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Login;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.model.Register;

public class PersonalMapper implements RowMapper<PersonalChat> {

	@Override
	public PersonalChat mapRow(ResultSet rs, int rowNum) throws SQLException {

		PersonalChat pChat = new PersonalChat();
		pChat.setSender(rs.getString("sender"));
		pChat.setMessage(rs.getString("message"));
		pChat.setMessageTime(rs.getString("messageTime"));
		pChat.setMessageId(rs.getInt("messageId"));

		return pChat;
	}

}
