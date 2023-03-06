package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Commune;

public class MemberListCommuneMapper implements RowMapper<Commune> {

	@Override
	public Commune mapRow(ResultSet rs, int rowNum) throws SQLException {
		Commune commune = new Commune();
		commune.setMembers(rs.getString("members"));
		return commune;
	}

	
}
