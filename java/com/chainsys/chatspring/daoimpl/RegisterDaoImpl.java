package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import com.chainsys.chatspring.dao.RegisterDao;
import com.chainsys.chatspring.exceptions.MailExistsException;
import com.chainsys.chatspring.mapper.DisplayMapper;
import com.chainsys.chatspring.mapper.RegisterMapper;
import com.chainsys.chatspring.model.Register;
import com.chainsys.chatspring.util.ConnectionUtil;


public class RegisterDaoImpl implements RegisterDao {
	
	JdbcTemplate jdbcTemplate= ConnectionUtil.getJdbcTemplate();


	Logger logger = LoggerFactory.getLogger(RegisterDaoImpl.class);

//Registration 

	public Integer registerUser(Register register, HttpSession session) {

		String registerUser = "insert into register (name,mailId,userId,userName,security,password,confirmPassword,loginDate)values(?,?,seq_id.nextval,?,?,?,?,localtimestamp)";
		Object[] params = { register.getName(), register.getMailId(), register.getUserName(), register.getSecurity(),
				register.getPassword(), register.getConfirmPassword() };
		jdbcTemplate.update(registerUser, params);

		logger.info(" Row Inserted into Register");

		String change = "update register set userName=CONCAT(substr(mailId,1,4),userId) where mailId =?";
		Object[] params1 = { register.getMailId() };
		Integer rows = jdbcTemplate.update(change, params1);

		logger.info(" Row Updated in the UserName on Register");

		String display = "select userName from register where mailId=?";

		List<Register> un = jdbcTemplate.query(display, new DisplayMapper(), register.getMailId());
		for (Register disp : un) {

			session.setAttribute("userName", disp.getUserName());
		}

		return rows;
	}

//Validating whether the mail id already exists, for registration 	

	public void mailIdExisting(String mailId) throws MailExistsException {

		String query = "select mailId from register ";
		List<Register> listOfRegister = jdbcTemplate.query(query, new RegisterMapper());
		for (Register register : listOfRegister) {
			String regMailId = register.getMailId();
			if (regMailId.equals(mailId)) {
				throw new MailExistsException();

			} else {

				logger.info("Continue");
			}
		}
	}

//Finding User Name, if user forgot	

	public Boolean findName(String mailId, HttpSession session) {
		String findName = "select userName from register where mailId =?";
		String queryForObject = null;
		try {
			queryForObject = jdbcTemplate.queryForObject(findName, String.class, mailId);
			session.setAttribute("userName", queryForObject);

			return true;
		} catch (EmptyResultDataAccessException e) {
			return false;

		}

	}

//Forgot password 	

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

//Reset password	

	public Boolean resetPassword(Register register) {

		String reset = "update register set password=? , confirmPassword=? where mailId =?";

		Object[] params1 = { register.getPassword(), register.getConfirmPassword(), register.getMailId() };
		jdbcTemplate.update(reset, params1);

		logger.info(" Row Updated and Password changed ");
		return true;

	}

}
