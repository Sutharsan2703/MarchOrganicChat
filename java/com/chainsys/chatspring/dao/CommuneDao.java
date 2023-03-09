package com.chainsys.chatspring.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.chainsys.chatspring.exceptions.EntryInvalidException;
import com.chainsys.chatspring.model.Commune;

public interface CommuneDao {

	public Integer createCommune(Commune commune, HttpSession session);

	public Boolean joinCommune(Commune commune) throws EntryInvalidException;

	public Integer createMessage(Commune commune);

	public Boolean communeIdExisting(Integer communeId, String sender) throws EntryInvalidException;

	public List<Commune> listCommune(HttpSession session);

	public List<Commune> receiveCommune(HttpSession session);

	public List<Commune> textReceiveCommune(HttpSession session, Integer communeId);

	public Integer textMessage(Commune commune);

	public List<Commune> membListCommune(HttpSession session, Integer communeId);

}
