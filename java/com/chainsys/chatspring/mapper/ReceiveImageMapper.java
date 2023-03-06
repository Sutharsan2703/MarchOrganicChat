package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.PersonalChat;

public class ReceiveImageMapper implements RowMapper<PersonalChat> {

	@Override
	public PersonalChat mapRow(ResultSet rs, int rowNum) throws SQLException {
		PersonalChat personalChat=new PersonalChat();
		personalChat.setSender(rs.getString("sender"));
		personalChat.setMessageTime(rs.getString("messageTime"));
		personalChat.setReqStatus(rs.getString("reqStatus"));
		personalChat.setMessage(rs.getString("message"));
		byte[] image=rs.getBytes("docs");
		String base64Image=Base64.getEncoder().encodeToString(image);
		personalChat.setDocs(image);
		personalChat.setPath(base64Image);

		personalChat.setMessageId(rs.getInt("messageId"));
		return personalChat;
	}

}
