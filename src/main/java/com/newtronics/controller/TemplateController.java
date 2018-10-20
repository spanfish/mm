/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.common.NameValueModel;
import com.newtronics.tx.model.Template;

/**
 *
 * @author xiangweiwang
 */
@Controller
@RequestMapping("/template")
public class TemplateController {

	/**
	 * 显示模板列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String init() {
		return "templateList";
	}

	@RequestMapping(value = "input.html", method = RequestMethod.GET)
	public ModelAndView addTemplateInit() {
		ModelAndView mv = new ModelAndView();
		
		NameValueModel enabledModel = new NameValueModel();
		enabledModel.setName("可用");
		enabledModel.setValue("1");
		
		NameValueModel disabledModel = new NameValueModel();
		disabledModel.setName("不可用");
		disabledModel.setValue("0");
		
		List<NameValueModel> list = new ArrayList<>();
		list.add(enabledModel);
		list.add(disabledModel);
		mv.addObject("enabledList", list);
		mv.addObject("template", new Template());
		mv.setViewName("inputTemplate");
		
		return mv;
	}

	@RequestMapping(value = "add.html", method = RequestMethod.POST)
	public ModelAndView addTemplate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("templateList");
		return mv;
	}
}
