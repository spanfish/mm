package com.newtronics.tx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newtronics.tx.dao.UserDAO;
import com.newtronics.tx.model.User;
import com.newtronics.tx.service.UserService;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Override
        @Transactional
	public void insertUser(User user) {
		userDAO.insertUser(user);
	}


	@Override
	public User getUser(String username) {
		return userDAO.getUser(username);
	}

	@Override
	public List<User> getUsers() {
		return userDAO.getUsers();
	}

}
