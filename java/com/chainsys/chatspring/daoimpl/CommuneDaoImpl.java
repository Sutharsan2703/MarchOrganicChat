package com.chainsys.chatspring.daoimpl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.chainsys.chatspring.dao.CommuneDao;
import com.chainsys.chatspring.exceptions.EntryInvalidException;
import com.chainsys.chatspring.mapper.CheckCommuneMapper;
import com.chainsys.chatspring.mapper.CommuneReceiveMapper;
import com.chainsys.chatspring.mapper.CommuneTextMapper;
import com.chainsys.chatspring.mapper.JoinCommuneMapper;
import com.chainsys.chatspring.mapper.ListCommuneMapper;
import com.chainsys.chatspring.mapper.MemberListCommuneMapper;
import com.chainsys.chatspring.model.Commune;

@Repository
public class CommuneDaoImpl implements CommuneDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	Logger logger = LoggerFactory.getLogger(CommuneDaoImpl.class);

//Commune creation
	public Integer createCommune(Commune commune, HttpSession session) {

		String create = "insert into commune (communeName,communeId,password,members,dateOfCreation)values(?,COMMUNESEQ.nextval,?,?,LOCALTIMESTAMP)";
		Object[] params = { commune.getCommuneName(), commune.getPassword(), commune.getMembers() };

		Integer rows = jdbcTemplate.update(create, params);

		logger.info(" Row Inserted Commune");

		String cId = "select communeId from commune where communeName=? ";
		String communeId = null;
		try {
			communeId = jdbcTemplate.queryForObject(cId, String.class, commune.getCommuneName());
		} catch (EmptyResultDataAccessException e) {
			return null;

		}
		session.setAttribute("communeId", communeId);
		String query = "insert into communeMembers (communeName,communeId,members,dateOfJoin)values(?,?,?,LOCALTIMESTAMP) ";

		Object[] param = { commune.getCommuneName(), communeId, commune.getMembers() };

		jdbcTemplate.update(query, param);

		logger.info(" Row Inserted to communeMembers");

		return rows;

	}

//Join into a Commune	

	public Boolean joinCommune(Commune commune) throws EntryInvalidException {
		String query = "select password,communeName from commune where communeId=? ";

		List<Commune> listOfCommune = jdbcTemplate.query(query, new JoinCommuneMapper(), commune.getCommuneId());
		for (Commune comm : listOfCommune) {
			Integer rPassword = commune.getPassword();
			Integer password = comm.getPassword();

			if (!rPassword.equals(password)) {

				throw new EntryInvalidException();
			} else {

				String join = "insert into communeMembers (communeName,communeId,members,dateOfJoin)values(?,?,?,LOCALTIMESTAMP)";
				Object[] params = { comm.getCommuneName(), commune.getCommuneId(), commune.getMembers() };

				jdbcTemplate.update(join, params);

				logger.info(" Row Inserted into Commune Members");

				return true;
			}

		}

		return false;

	}

//Share message and images to the Commune	

	public Integer createMessage(Commune commune) {

		String write = "insert into MESSAGE (COMMUNEID,SENDER,MESSAGE,docs,MESSAGETIME,views,VIEWEDBY) values (?,?,?,?,LOCALTIMESTAMP,'0','')";
		Object[] params = { commune.getCommuneId(), commune.getSender(), commune.getMessage(), commune.getDocs() };
		Integer rows = jdbcTemplate.update(write, params);

		logger.info(" Row Inserted into Message");
		return rows;

	}

//Share text message to the Commune	

	public Integer textMessage(Commune commune) {
		String text = "insert into textMESSAGE (COMMUNEID,SENDER,MESSAGE,MESSAGETIME,views) values (?,?,?,LOCALTIMESTAMP,'0')";
		Object[] param = { commune.getCommuneId(), commune.getSender(), commune.getMessage() };
		Integer rows = jdbcTemplate.update(text, param);

		logger.info(" Row Inserted into Message");
		return rows;

	}

//Check CommuneId exists - on both Commune and Commune Members database	

	public Boolean communeIdExisting(Integer communeId, String sender) throws EntryInvalidException {

		String query = "select communeId,members from communeMembers where communeId=? ";

		List<Commune> listOfCommune = jdbcTemplate.query(query, new CheckCommuneMapper(), communeId);
		for (Commune commune : listOfCommune) {

			Integer commId = commune.getCommuneId();
			if (commId.equals(communeId)) {

				String members = commune.getMembers();
				if (sender.equals(members)) {

					logger.info("Continue");
					return true;
				} else {
					throw new EntryInvalidException();
				}
			} else {
				throw new EntryInvalidException();

			}
		}
		return false;
	}

//List of Commune that the user is a member	

	public List<Commune> listCommune(HttpSession session) {
		String uName = (String) session.getAttribute("userName");
		String communeList = "select distinct communeName,communeId from communeMembers where members=? ";
		List<Commune> communeListResult = jdbcTemplate.query(communeList, new ListCommuneMapper(), uName);

		session.setAttribute("listCommune", communeListResult);

		return communeListResult;
	}

//Receive Messages from the Commune

	public List<Commune> receiveCommune(HttpSession session) {
		Integer communeId = (Integer) session.getAttribute("communeId");
		String receive = "select SENDER,MESSAGE,docs,to_char(messageTime,'dd-mm-yyyy hh24:mm:ss')MESSAGETIME,COMMUNEID,views,viewedby from MESSAGE where communeId=? order by views asc";
		List<Commune> receivedCommune = jdbcTemplate.query(receive, new CommuneReceiveMapper(), communeId);

		session.setAttribute("receivedCommune", receivedCommune);

		String change = "update message set views=views+1 where communeId=?";
		Object[] params1 = { communeId };
		jdbcTemplate.update(change, params1);

		logger.info("Message views.. Row Updated ");

		return receivedCommune;
	}

//Receive text messages from Commune 	

	public List<Commune> textReceiveCommune(HttpSession session, Integer communeId) {
		String text = "select SENDER,MESSAGE,to_char(messagetime,'dd-mm-yyyy hh24:mm:ss')MESSAGETIME,COMMUNEID,views from textMESSAGE where communeId=? order by views asc ";
		List<Commune> textCommune = jdbcTemplate.query(text, new CommuneTextMapper(), communeId);

		session.setAttribute("textCommune", textCommune);

		String change = "update textMessage set views=views+1 where communeId=?";
		Object[] params1 = { communeId };
		jdbcTemplate.update(change, params1);

		logger.info("Message views.. Row Updated ");

		return textCommune;

	}

//Commune members list	

	public List<Commune> membListCommune(HttpSession session, Integer communeId) {
		String communeList = "select distinct  members  from communeMembers where communeId=? ";
		List<Commune> membersList = jdbcTemplate.query(communeList, new MemberListCommuneMapper(), communeId);

		session.setAttribute("membersList", membersList);

		return membersList;
	}

}
