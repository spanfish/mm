package com.newtronics.tx.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.newtronics.common.PlanStatus;
import com.newtronics.tx.dao.PlanDao;
import com.newtronics.tx.model.Plan;
import com.newtronics.tx.service.PlanService;

@Service
public class PlanServiceImpl implements PlanService {
	@Autowired
	private PlanDao planDAO;

	@Override
	@Transactional
	public Plan insertPlan(Plan plan) {
		return planDAO.insertPlan(plan);
	}

	@Override
	public List<Plan> listPlan() {
		return planDAO.listPlan();
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan submitPlanForReview(Plan plan) {
		if(plan.getStatus() != PlanStatus.CREATING) {
			//exception
		}
		//设置为review状态
		plan.setStatus(PlanStatus.REVIEWING);
		Plan p = planDAO.updatePlan(plan);
		return p;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan reviewerApprove(Plan plan, boolean approve, String userName) {
		if(plan.getStatus() != PlanStatus.REVIEWING) {
			//exception
		}
		//设置为approving状态
		plan.setStatus(approve ? PlanStatus.APPROVING : PlanStatus.CREATING);
		plan.setReviewDate(new Date());
		//TODO:
		//plan.setReviewer(reviewer);
		Plan p = planDAO.updatePlan(plan);
		return p;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan approverApprove(Plan plan, boolean approve, String userName) {
		if(plan.getStatus() != PlanStatus.APPROVING) {
			//exception
		}
		//设置为approve状态
		plan.setStatus(approve ? PlanStatus.APPROVED : PlanStatus.CREATING);
		plan.setApproveDate(new Date());
		//TODO:
		//plan.setApprover(approver);
		Plan p = planDAO.updatePlan(plan);
		return p;
	}
}
