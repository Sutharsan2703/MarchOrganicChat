package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import com.chainsys.chatspring.dao.ReportDao;
import com.chainsys.chatspring.mapper.ReportMapper;
import com.chainsys.chatspring.model.Report;
import com.chainsys.chatspring.util.ConnectionUtil;


public class ReportDaoImpl implements ReportDao {
	
	JdbcTemplate jdbcTemplate= ConnectionUtil.getJdbcTemplate();


	Logger logger = LoggerFactory.getLogger(ReportDaoImpl.class);

//Make report	

	public Integer reportUser(Report report) {

		String reportUser = "insert into report (reportId,reportDate,reportUserName,reportContent,userName,messageId,reportStatus) values (SEQ_ID4.nextval,localtimestamp,?,?,?,?,'Report Created')";
		Object[] params = { report.getReportUserName(), report.getReportContent(), report.getUserName(),
				report.getMessageId() };
		Integer rows = jdbcTemplate.update(reportUser, params);

		logger.info(" Row Inserted into Report");

		return rows;
	}

//Administrator to check report

	public List<Report> check(HttpSession session) {

		String display = "select reportId,reportDate,reportUserName,reportContent,userName,messageId,reportStatus from report order by reportDate desc ";
		List<Report> checkReport = jdbcTemplate.query(display, new ReportMapper());

		session.setAttribute("checkReport", checkReport);

		return checkReport;
	}

//Administrator updates on report	

	public Integer reportStatus(String messageId) {

		String statusUpdate = "update report set reportStatus='Warning, reply called upon ' where messageId=?";
		Object[] params = { messageId };
		Integer rows = jdbcTemplate.update(statusUpdate, params);

		logger.info(" Row updated as warning on report status by admin");
		return rows;
	}

//User to view status of the report

	public List<Report> reportStatusView(HttpSession session) {
		String userName = (String) session.getAttribute("userName");
		String display = "select reportId,reportDate,reportUserName,reportContent,userName,messageId,reportStatus from report where userName=? order by reportDate desc";
		List<Report> viewReport = jdbcTemplate.query(display, new ReportMapper(), userName);

		session.setAttribute("viewReport", viewReport);

		return viewReport;
	}

//Updating final decision on report	

	public Integer reportDecision(String messageId, String reportUserName, String reportStatus) {
		String statusUpdate = "update report set reportStatus=? where messageId=? and reportUserName=?";
		Object[] params = { reportStatus, messageId, reportUserName };
		Integer row = jdbcTemplate.update(statusUpdate, params);

		logger.info(" Row updated Decision Made by admin");
		return row;
	}

}
