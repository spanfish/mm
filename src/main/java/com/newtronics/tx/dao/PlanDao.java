package com.newtronics.tx.dao;

import java.util.List;

import com.newtronics.tx.model.Plan;

public interface PlanDao {
	Plan insertPlan(Plan plan);

	List<Plan> listPlan();
}
