package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.chatspring.dao.ReportDao;
import com.chainsys.chatspring.mapper.ReportMapper;
import com.chainsys.chatspring.model.Report;

@Repository
public class ReportDaoImpl implements ReportDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	Logger logger = LoggerFactory.getLogger(ReportDaoImpl.class);

	
	public Integer reportUser(Report report) {

		
		
		String repUser = "insert into report (reportId,reportDate,reportUserName,reportContent,userName,messageId,reportstatus) values (SEQ_ID4.nextval,localtimestamp,?,?,?,?,'Report Created')";
		Object[] params = { report.getReportUserName(), report.getReportContent(), report.getUserName(),
				report.getMessageId() };
		int rows = jdbcTemplate.update(repUser, params);

		logger.info( " Row Inserted into Report");

		return rows;
	}

	public List<Report> check(HttpSession session) {

		String display = "select reportId,reportDate,reportUserName,reportContent,userName,messageId,reportstatus from report order by reportDate desc ";
		List<Report> checkReport = jdbcTemplate.query(display, new ReportMapper());

		session.setAttribute("checkReport", checkReport);

		return checkReport;
	}

	public Integer reportStatus(String messageId) {

		String statusUpdate = "update report set reportstatus='Warning, reply called upon ' where messageId=?";
		Object[] params = { messageId };
		int rows = jdbcTemplate.update(statusUpdate, params);

		logger.info(" Row updated as warning on report status by admin");
		return rows;
	}

	
	public List<Report> reportStatusView(HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String display = "select reportId,reportDate,reportUserName,reportContent,userName,messageId,reportstatus from report where userName=? order by reportDate desc";
		List<Report> viewReport = jdbcTemplate.query(display, new ReportMapper(), userName);

		session.setAttribute("viewReport", viewReport);

		return viewReport;
	}

	public Integer reportDec(String messageId,String reportUserName,String reportStatus) {
		String statusUpdate = "update report set reportstatus=? where messageId=? and reportUserName=?";
		Object[] params = { reportStatus,messageId,reportUserName };
		int row = jdbcTemplate.update(statusUpdate, params);

		logger.info(" Row updated Decision Made by admin");
		return row;
	}

}
