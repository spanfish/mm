package com.newtronics.tx.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.newtronics.tx.dao.TemplateDao;
import com.newtronics.tx.model.Template;
import com.newtronics.tx.model.User;

@Repository
public class TemplateDaoImpl implements TemplateDao {
	@PersistenceContext
	private EntityManager em;

	@SuppressWarnings("unchecked")
	@Override
	public List<Template> findAllTemplates() {
		return em.createQuery("from Template t order by t.name").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Template> findAllTemplatesByCreator(String username) {
		List<Template> result = em.createQuery(
				"select t from Template t inner join t.creators c where t.enabled = 1 and c.username=:username order by t.name")
				.setParameter("username", username).getResultList();
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Template> findAllVisibleTemplate(String username) {
		Query query = em.createQuery(
				"select t from Template t where :c MEMBER OF t.creators or :r MEMBER OF t.reviewers or :a MEMBER OF t.approvers order by t.name");
		query.setParameter("c", new User(username));
		query.setParameter("r", new User(username));
		query.setParameter("a", new User(username));
		return query.getResultList();
	}

	@Override
	public Template findTemplateById(String templateId) {
		return this.findTemplateById(templateId, false);
	}

	@Override
	public Template findTemplateById(String templateId, boolean includeDisabled) {

		String sql = "from Template t where t.id = :id";
		if (!includeDisabled) {
			sql += " and t.enabled = 1";
		}

		@SuppressWarnings("unchecked")
		List<Template> result = em.createQuery(sql).setParameter("id", templateId).getResultList();
		if (result.isEmpty()) {
			return null;
		} else {
			return result.get(0);
		}
	}

	@Override
	@Transactional
	public void insertTemplate(Template template) {
		em.persist(template);
	}

	@Override
	@Transactional
	public Template updateTemplate(Template template) {
		Template t = em.merge(template);
		return t;
	}

}
