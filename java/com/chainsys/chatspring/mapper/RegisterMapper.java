package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Register;

public class RegisterMapper implements RowMapper<Register>{

	@Override
	public Register mapRow(ResultSet rs, int rowNum) throws SQLException {
		Register register = new Register();
		register.setMailId(rs.getString("mailid"));
		
		return register;
	}

}
