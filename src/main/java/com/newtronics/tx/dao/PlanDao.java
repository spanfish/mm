package com.newtronics.tx.dao;

import java.util.List;
import java.util.Map;

import com.newtronics.tx.model.Plan;

public interface PlanDao {
	Plan insertPlan(Plan plan);

	Plan updatePlan(Plan plan);

	Long getPageCount(Map<String, String> search);

	List<Plan> listPlan(int page, int pageSize, Map<String, String> search);

	Plan findPlanById(String planId);

	int getNextPlanId(String templateId, int year, int month, int date);
}
