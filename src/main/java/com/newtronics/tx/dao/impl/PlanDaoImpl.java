package com.newtronics.tx.dao.impl;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.newtronics.tx.dao.PlanDao;
import com.newtronics.tx.model.Plan;

@Repository
public class PlanDaoImpl implements PlanDao {
	@PersistenceContext
	private EntityManager em;

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void insertPlan(Plan plan) {
		em.persist(plan);
	}

}
