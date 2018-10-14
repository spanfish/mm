package com.newtronics.tx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.newtronics.tx.dao.PlanDao;
import com.newtronics.tx.model.Plan;
import com.newtronics.tx.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {
	@Autowired
	private PlanDao planDAO;

	@Override
	@Transactional
	public void insertPlan(Plan plan) {
		planDAO.insertPlan(plan);
	}

}
