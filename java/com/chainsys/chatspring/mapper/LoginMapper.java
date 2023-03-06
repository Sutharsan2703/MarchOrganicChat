package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Login;

public class LoginMapper implements RowMapper<Login> {

	@Override
	public Login mapRow(ResultSet rs, int rowNum) throws SQLException {

		Login login = new Login();
		login.setLoginPassword(rs.getString("password"));

		login.setLoginName(rs.getString("name"));

		return login;

	}

}
