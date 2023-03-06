package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.PersonalChat;

public class SentImageMapper implements RowMapper<PersonalChat> {

	@Override
	public PersonalChat mapRow(ResultSet rs, int rowNum) throws SQLException {

PersonalChat personalChat= new PersonalChat();

		
		personalChat.setReceiver(rs.getString("receiver"));
		personalChat.setReqStatus(rs.getString("reqStatus"));
		personalChat.setMessageTime(rs.getString("messageTime"));
		personalChat.setMessageId(rs.getInt("messageId"));
		personalChat.setMessage(rs.getString("message"));
		byte[] image=rs.getBytes("docs");
		String base64Image=Base64.getEncoder().encodeToString(image);
		personalChat.setDocs(image);
		personalChat.setPath(base64Image);
		return personalChat;
		
		
	}

}
