package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Commune;

public class CommuneReceiveMapper implements RowMapper<Commune> {

	@Override
	public Commune mapRow(ResultSet rs, int rowNum) throws SQLException {
		Commune commune=new Commune();
		commune.setSender(rs.getString("sender"));
		commune.setMessage(rs.getString("message"));

		byte[] image=rs.getBytes("docs");
		String base64Image=Base64.getEncoder().encodeToString(image);
		commune.setDocs(image);
		commune.setPath(base64Image);

		
		
		
		commune.setMessageTime(rs.getString("messageTime"));
		commune.setCommuneId(rs.getInt("communeId"));
		commune.setViews(rs.getInt("views"));
		commune.setViewedBy(rs.getString("viewedBy"));
		
		
		return commune;
	}

}
