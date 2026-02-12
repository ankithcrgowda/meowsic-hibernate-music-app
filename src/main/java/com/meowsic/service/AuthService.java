package com.meowsic.service;

import com.meowsic.dao.UserDAO;
import com.meowsic.daoimpl.UserDAOImpl;
import com.meowsic.entity.User;

public class AuthService {
	
	private final UserDAO userDAO = new UserDAOImpl();
	
	public User authenticate(String username, String password) {
		
		if(username == null || password == null) {
			return null;
		}
		
		return userDAO.findByUserNameAndPassword(username, password);
	}
}
