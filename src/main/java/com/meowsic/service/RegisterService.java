package com.meowsic.service;

import com.meowsic.dao.UserDAO;
import com.meowsic.daoimpl.UserDAOImpl;
import com.meowsic.entity.Role;
import com.meowsic.entity.User;
import com.meowsic.util.PasswordUtil;

public class RegisterService {

	private final UserDAO userDAO = new UserDAOImpl();

	public int register(String username, String password, String email) {

		if (username != null && password != null) {
			User user = new User(0, username, PasswordUtil.hashPassword(password), Role.user, email);
			userDAO.save(user);
			return 1;
		}

		return 0;
	}
}
