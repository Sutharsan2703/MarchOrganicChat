package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Commune;

public class CheckCommuneMapper implements RowMapper<Commune> {

	@Override
	public Commune mapRow(ResultSet rs, int rowNum) throws SQLException {

		Commune commune=new Commune();
		commune.setCommuneId(rs.getInt("communeId"));
		commune.setMembers(rs.getString("members"));
		commune.setCommuneName("communeName");
		return commune;
	}

}
