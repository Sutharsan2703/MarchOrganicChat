package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.chainsys.chatspring.dao.LoginDao;
import com.chainsys.chatspring.exceptions.LoginInvalidException;
import com.chainsys.chatspring.mapper.LoginMapper;
import com.chainsys.chatspring.mapper.UserListMapper;
import com.chainsys.chatspring.mapper.UserMapper;
import com.chainsys.chatspring.mapper.UserMessagedMapper;
import com.chainsys.chatspring.model.Login;
import com.chainsys.chatspring.model.PersonalChat;
import com.chainsys.chatspring.model.Register;

@Repository
public class LoginDaoImpl implements LoginDao {
	@Autowired
	JdbcTemplate jdbcTemplate;

	Logger logger = LoggerFactory.getLogger(LoginDaoImpl.class);

	
	public Boolean login(String userName,String password,HttpSession session) throws LoginInvalidException {

		String query = "select name,password from register where userName=? ";
		
		List<Login> listToLog = jdbcTemplate.query(query, new LoginMapper(), userName);
		for (Login login : listToLog) {
		
			String rPassword = login.getLoginPassword();
			String name=login.getLoginName();
			
			if (!rPassword.equals(password)) {

				throw new LoginInvalidException();
			} else {
				
				logger.info("Continue");
	            session.setAttribute("userName", userName);
	            session.setAttribute("name",name );
	            
				String uList = "select userName,mailId from register order by mailId asc ";
				List<Register> listOfUsers = jdbcTemplate.query(uList, new UserListMapper());

				
					session.setAttribute("userList", listOfUsers);
				
					String messageFrom = "select distinct sender,reqStatus from personalChat where receiver =?   ";
					List<PersonalChat> listOfMessagedUsers = jdbcTemplate.query(messageFrom, new UserMessagedMapper(),userName);
					
					
					session.setAttribute("userMessaged", listOfMessagedUsers);
					
					
				
				
	            return true;

				
		}
		}
		logger.error("Login Failed"); 
		
		return false;

	}

}

