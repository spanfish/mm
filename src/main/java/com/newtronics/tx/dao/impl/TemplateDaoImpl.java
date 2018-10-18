package com.newtronics.tx.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.newtronics.tx.dao.TemplateDao;
import com.newtronics.tx.model.Template;

@Repository
public class TemplateDaoImpl implements TemplateDao {
	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<Template> findAllTemplates() {
		return em.createQuery("from Template t where t.enabled = 1 order by t.name").getResultList();
	}

	@Override
	public Template findTemplateById(String templateId) {
		@SuppressWarnings("unchecked")
		List<Template> result = em.createQuery("from Template t where t.enabled = 1 and t.id = :id").setParameter("id", templateId).getResultList();
		if(result.isEmpty()) {
			return null;
		} else {
			return result.get(0);
		}
	}
}
