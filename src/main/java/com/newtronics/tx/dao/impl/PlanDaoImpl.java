package com.newtronics.tx.dao.impl;

import java.util.List;

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
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan insertPlan(Plan plan) {
		@SuppressWarnings("unchecked")
		List<Plan> plans = em.createQuery("from Plan where planId=:planId").setParameter("planId", plan.getPlanId()).getResultList();
		if (!plans.isEmpty()) {
			return em.merge(plan);
		} else {
			em.persist(plan);
			return plan;
		}
	}

	@Override
	public List<Plan> listPlan() {
		@SuppressWarnings("unchecked")
		List<Plan> result = em.createQuery("from Plan").getResultList();

		return result;
	}

	@Override
	public Plan findPlanById(String planId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan updatePlan(Plan plan) {
		return em.merge(plan);
	}
}
