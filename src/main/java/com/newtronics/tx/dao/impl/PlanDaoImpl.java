package com.newtronics.tx.dao.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.newtronics.tx.dao.PlanDao;
import com.newtronics.tx.model.Plan;

@Repository
public class PlanDaoImpl implements PlanDao {
	@PersistenceContext
	private EntityManager em;

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan insertPlan(Plan plan) {
		em.persist(plan);
		return plan;
	}

	@Override
	public Long getPageCount(Map<String, String> search) {
		String dateFrom = search.get("dateFrom");
		String dateTo = search.get("dateTo");
		String customer = search.get("customer");
		String notifyNo = search.get("notifyNo");

		String hqlQuery = "select count(p) from Plan p";
		if (!search.isEmpty()) {
			hqlQuery += " where ";
		}
		boolean w = false;

		if (!StringUtils.isEmpty(dateFrom)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.updateDate >= :dateFrom";
		}
		if (!StringUtils.isEmpty(dateTo)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.updateDate <= :dateTo";
		}
		if (!StringUtils.isEmpty(customer)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.customer = :customer";
		}
		if (!StringUtils.isEmpty(notifyNo)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.notifyNo = :notifyNo";
		}

		Query query = em.createQuery(hqlQuery);

		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd mm");
		if (!StringUtils.isEmpty(dateFrom)) {
			try {
				query.setParameter("dateFrom", sf.parse(dateFrom + " 00:00:00"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (!StringUtils.isEmpty(dateTo)) {
			try {
				query.setParameter("dateTo", sf.parse(dateTo + " 23:59:59"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (!StringUtils.isEmpty(customer)) {
			query.setParameter("customer", customer);
		}
		if (!StringUtils.isEmpty(notifyNo)) {
			query.setParameter("notifyNo", notifyNo);
		}
		Long count = (Long) query.getSingleResult();
		return count;
	}

	@Override
	public List<Plan> listPlan(int page, int pageSize, Map<String, String> search) {

		String dateFrom = search.get("dateFrom");
		String dateTo = search.get("dateTo");
		String customer = search.get("customer");
		String notifyNo = search.get("notifyNo");

		String hqlQuery = " from Plan p";
		if (!search.isEmpty()) {
			hqlQuery += " where ";
		}
		boolean w = false;
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if (!StringUtils.isEmpty(dateFrom)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.updateDate >= :dateFrom";
		}
		if (!StringUtils.isEmpty(dateTo)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.updateDate <= :dateTo";
		}
		if (!StringUtils.isEmpty(customer)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.customer = :customer";
		}
		if (!StringUtils.isEmpty(notifyNo)) {
			if (w) {
				hqlQuery += " and ";
			} else {
				w = true;
			}
			hqlQuery += " p.notifyNo = :notifyNo";
		}

		hqlQuery += " order by p.notifyNo desc";
		Query query = em.createQuery(hqlQuery);

		if (!StringUtils.isEmpty(dateFrom)) {
			try {
				query.setParameter("dateFrom", sf.parse(dateFrom + " 00:00:00"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (!StringUtils.isEmpty(dateTo)) {
			try {
				query.setParameter("dateTo", sf.parse(dateTo + " 23:59:59"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (!StringUtils.isEmpty(customer)) {
			query.setParameter("customer", customer);
		}
		if (!StringUtils.isEmpty(notifyNo)) {
			query.setParameter("notifyNo", notifyNo);
		}
		query.setFirstResult(page * pageSize);
		query.setMaxResults(pageSize);
		@SuppressWarnings("unchecked")
		List<Plan> result = query.getResultList();

		return result;
	}

	@Override
	public Plan findPlanById(String planId) {
		@SuppressWarnings("unchecked")
		List<Plan> result = em.createQuery("from Plan where planId=:planId").setParameter("planId", planId)
				.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public Plan updatePlan(Plan plan) {
		return em.merge(plan);
	}

	@Override
	public int getNextPlanId(String templateId, int year, int month, int date) {
		@SuppressWarnings("unchecked")
		List<Plan> plans = em.createQuery(
				"from Plan where templateId=:templateId and year(createDate)=:year and month(createDate)=:month and day(createDate)=:date")
				.setParameter("templateId", templateId).setParameter("year", year).setParameter("month", month + 1)
				.setParameter("date", date).getResultList();
		return plans.size() + 1;
	}
}
