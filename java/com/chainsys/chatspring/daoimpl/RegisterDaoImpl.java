package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.chatspring.dao.RegisterDao;
import com.chainsys.chatspring.exceptions.MailExistsException;
import com.chainsys.chatspring.mapper.DisplayMapper;
import com.chainsys.chatspring.mapper.RegisterMapper;
import com.chainsys.chatspring.model.Register;

@Repository
public class RegisterDaoImpl implements RegisterDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	Logger logger = LoggerFactory.getLogger(RegisterDaoImpl.class);

	
	
	public Integer registerUser(Register register, HttpSession session) {

		String regUser = "insert into register (name,mailId,userId,userName,security,password,confirmPassword,logindate)values(?,?,seq_id.nextval,?,?,?,?,localtimestamp)";
		Object[] params = { register.getName(), register.getMailId(), register.getUserName(), register.getSecurity(),
				register.getPassword(), register.getConfirmPassword() };
		jdbcTemplate.update(regUser, params);

		logger.info(" Row Inserted into Register");

		String change = "update register set username=CONCAT(substr(mailid,1,4),userid) where mailId =?";
		Object[] params1 = { register.getMailId() };
		int rows = jdbcTemplate.update(change, params1);

		logger.info(" Row Updated in the UserName on Register");

		String display = "select userName from register where mailId=?";

		List<Register> un = jdbcTemplate.query(display, new DisplayMapper(), register.getMailId());
		for (Register disp : un) {

			session.setAttribute("userName", disp.getUserName());
		}

		return rows;
	}

	public void mailIdExisting(String mailId) throws MailExistsException {

		String query = "select mailId from register ";
		List<Register> listOfReg = jdbcTemplate.query(query, new RegisterMapper());
		for (Register register : listOfReg) {
			String regMailId = register.getMailId();
			if (regMailId.equals(mailId)) {
				throw new MailExistsException();

			} else {
				
				logger.info("Continue");
			}
		}
	}

	public Boolean findName(String mailId, HttpSession session) {
		String newun = "select username from register where mailId =?";
		String queryForObject = null;
		try {
			queryForObject = jdbcTemplate.queryForObject(newun, String.class, mailId);
			session.setAttribute("userName", queryForObject);

			return true;
		} catch (EmptyResultDataAccessException e) {
			return false;

		}


	}

	public Boolean forgotPassword(Register register, HttpSession session) {

		String forget = "select security from register where mailId =?";
		String queryForObject = null;
		try {
			queryForObject = jdbcTemplate.queryForObject(forget, String.class, register.getMailId());
				if ((register.getSecurity()).equals(queryForObject)) {
				session.setAttribute("mail", register.getMailId());

				return true;
			} else {

				return false;
		}
		} catch (EmptyResultDataAccessException e) {

			return false;
		}
	}

	public Boolean resetPassword(Register register) {

		String forget = "update register set password=? , confirmPassword=? where mailId =?";

		Object[] params1 = { register.getPassword(), register.getConfirmPassword(), register.getMailId() };
		 jdbcTemplate.update(forget, params1);

		logger.info( " Row Updated and Password changed ");
		return true;

	}

}
