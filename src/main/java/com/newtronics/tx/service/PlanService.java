package com.newtronics.tx.service;

import java.util.List;

import com.newtronics.tx.model.Plan;

public interface PlanService {

	Plan insertPlan(Plan plan);

	List<Plan> listPlan();
}
