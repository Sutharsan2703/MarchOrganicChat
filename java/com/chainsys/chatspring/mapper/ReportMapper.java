package com.chainsys.chatspring.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.chatspring.model.Report;

public class ReportMapper implements RowMapper<Report> {

	@Override
	public Report mapRow(ResultSet rs, int rowNum) throws SQLException {
		Report report = new Report();

		report.setReportId(rs.getInt("reportId"));
		report.setReportDate(rs.getDate("reportDate"));
		report.setReportUserName(rs.getString("reportUserName"));
		report.setReportContent(rs.getString("reportContent"));
		report.setUserName(rs.getString("userName"));
		report.setMessageId(rs.getInt("messageId"));
		report.setReportStatus(rs.getString("reportStatus"));

		return report;
	}

}
