package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.PersonalChat;

public class AnalyzeMapper implements RowMapper<PersonalChat> {

	@Override
	public PersonalChat mapRow(ResultSet rs, int rowNum) throws SQLException {

		PersonalChat personalChat = new PersonalChat();

		
		personalChat.setSender(rs.getString("sender"));
		personalChat.setReceiver(rs.getString("receiver"));
		personalChat.setReqStatus(rs.getString("reqStatus"));
		personalChat.setMessageTime(rs.getString("messageTime"));
		personalChat.setMessageId(rs.getInt("messageId"));
		personalChat.setMessage(rs.getString("message"));
		return personalChat;

	}

}
