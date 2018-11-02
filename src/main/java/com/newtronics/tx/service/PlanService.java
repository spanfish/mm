package com.newtronics.tx.service;

import java.util.List;
import java.util.Map;

import com.newtronics.tx.model.Plan;

public interface PlanService {

	Plan insertPlan(Plan plan);

	Plan updatePlan(Plan plan);

	Plan findPlanById(String planId);

	Long getPageCount(Map<String, String> search);

	List<Plan> listPlan(int page, int pageSize, Map<String, String> search);

	Plan submitPlanForReview(Plan plan);
}
