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

		PersonalChat personalChat  = new PersonalChat();
		personalChat.setSender(rs.getString("sender"));
		personalChat.setMessage(rs.getString("message"));
		personalChat.setMessageTime(rs.getString("messageTime"));
		personalChat.setMessageId(rs.getInt("messageId"));

		return personalChat;
	}

}
