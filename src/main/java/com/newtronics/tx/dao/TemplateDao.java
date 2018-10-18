package com.newtronics.tx.dao;

import java.util.List;

import com.newtronics.tx.model.Template;

public interface TemplateDao {

	List<Template> findAllTemplates();

	Template findTemplateById(String templateId);
}
