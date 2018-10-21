package com.newtronics.tx.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.newtronics.tx.dao.TemplateDao;
import com.newtronics.tx.model.Template;
import com.newtronics.tx.service.TemplateService;

@Service
public class TemplateServiceImpl implements TemplateService {
	@Autowired
	private TemplateDao templateDao;

	@Override
	public List<Template> findAllTemplates() {
		//
		return templateDao.findAllTemplates();
	}

	@Override
	public Template findTemplateById(String templateId) {
		return templateDao.findTemplateById(templateId);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class })
	public void insertTemplate(Template template) throws Exception {
		Template t = templateDao.findTemplateById(template.getId());
		if (t != null) {
			throw new Exception("Tempate exists");
		}
		
		templateDao.insertTemplate(template);
	}

	@Override
	@Transactional(rollbackOn = { Exception.class })
	public Template updateTemplate(Template template) throws Exception {
		Template t = templateDao.findTemplateById(template.getId());
		if (t == null) {
			throw new Exception("Tempate not exists");
		}
		
		t = templateDao.updateTemplate(template);
		return t;
	}

}
