package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.PersonalChat;

public class MessageViewMapper implements RowMapper<PersonalChat> {

	@Override
	public PersonalChat mapRow(ResultSet rs, int rowNum) throws SQLException {

		PersonalChat pChat = new PersonalChat();

		pChat.setSender(rs.getString("sender"));
		pChat.setReceiver(rs.getString("receiver"));
		pChat.setMessageTime(rs.getString("messageTime"));
		pChat.setReqStatus(rs.getString("reqStatus"));

		pChat.setMessage(rs.getString("message"));
		pChat.setMessageId(rs.getInt("messageId"));

		return pChat;
	}

}
