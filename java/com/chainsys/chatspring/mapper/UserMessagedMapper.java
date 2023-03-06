package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.PersonalChat;

public class UserMessagedMapper implements RowMapper<PersonalChat> {

	@Override
	public PersonalChat mapRow(ResultSet rs, int rowNum) throws SQLException {
		PersonalChat personal = new PersonalChat();
		
		personal.setSender(rs.getString("sender"));
		personal.setReqStatus(rs.getString("reqStatus"));
		return personal;
	}

}
