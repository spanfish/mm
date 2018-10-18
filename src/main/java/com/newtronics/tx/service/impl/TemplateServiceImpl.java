package com.newtronics.tx.service.impl;

import java.util.List;

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

}
