package com.meowsic.dao;

import com.meowsic.entity.User;

public interface UserDAO {
	
	public void save(User user);
	
	public User findByUserNameAndPassword(String username, String password);
}
