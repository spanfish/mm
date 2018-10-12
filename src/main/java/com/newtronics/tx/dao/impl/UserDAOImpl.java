package com.newtronics.tx.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import org.springframework.stereotype.Repository;

import com.newtronics.tx.dao.UserDAO;
import com.newtronics.tx.model.User;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	@Transactional
	public void insertUser(User user) {
		em.persist(user);
	}

	@Override
	@Transactional
	public User getUser(String username) {
		return (User) em.createQuery("from User where username=:username").setParameter("username", username)
				.getSingleResult();
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<User> getUsers() {
		return em.createQuery("from User").getResultList();
	}

}
