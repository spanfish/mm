/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.common.NameValueModel;
import com.newtronics.tx.model.Template;
import com.newtronics.tx.model.User;
import com.newtronics.tx.service.TemplateService;
import com.newtronics.tx.service.UserService;

/**
 *
 * @author xiangweiwang
 */
@Controller
@RequestMapping("/template")
@SessionAttributes({"template" })
public class TemplateController {
	private Logger log = Logger.getLogger(TemplateController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private TemplateService templateService;
	
	@ModelAttribute("template")
	public Template template() {
		Template t = new Template();
		return t;
	}

	@ModelAttribute("users")
	public List<User> users() {
		List<User> users = userService.getAllUsers();
		return users;
	}

	@ModelAttribute("enabledList")
	public List<NameValueModel> enabledList() {
		NameValueModel enabledModel = new NameValueModel();
		enabledModel.setName("可用");
		enabledModel.setValue("1");

		NameValueModel disabledModel = new NameValueModel();
		disabledModel.setName("不可用");
		disabledModel.setValue("0");

		List<NameValueModel> list = new ArrayList<>();
		list.add(enabledModel);
		list.add(disabledModel);
		return list;
	}

	/**
	 * 显示模板列表页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView templateListInit() {
		List<Template> templates = templateService.findAllTemplates();
		ModelAndView mv = new ModelAndView();
		mv.addObject("templates", templates);
		mv.setViewName("templateList");
		
		return mv;
	}

	@RequestMapping(value = "input.html", method = RequestMethod.GET)
	public ModelAndView addTemplateInit() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("inputTemplate");

		return mv;
	}

	@RequestMapping(value = "addUser.html", method = RequestMethod.POST)
	@ResponseBody
	public String addUser(Principal principal, @ModelAttribute("template") Template template, @RequestParam("name") String name,
			@RequestParam("pk") String pk, @RequestParam(name = "value[]", required = false) String value) {

		if (template == null || principal == null || StringUtils.isEmpty(principal.getName())) {
			return "已过期，请重新登陆";
		}
		String response = "成功";
		try {
			// PlanItem表存在此项目，则更新PlanItem表
			if (PropertyUtils.isReadable(template, name) && PropertyUtils.isWriteable(template, name)) {
				BeanUtils.setProperty(template, name, value);
			} else {
				log.error("parameter not exists:" + name);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			response = "发生错误";
		}
		return response;
	}

	@RequestMapping(value = "add.html", method = RequestMethod.POST)
	public ModelAndView addTemplate(Principal principal, @ModelAttribute("template") Template template, SessionStatus status) {
		ModelAndView mv = new ModelAndView();

		if (template == null || principal == null || StringUtils.isEmpty(principal.getName())) {
			mv.addObject("error", "已过期，请重新登陆");
			mv.addObject("returnPage", "/do/login.html");
			mv.setViewName("error");
			return mv;
		}

		if (StringUtils.isEmpty(template.getName())) {
			mv.addObject("error", "请输入模板名");
			mv.setViewName("inputTemplate");
			return mv;
		} else if (StringUtils.isEmpty(template.getViewName())) {
			mv.addObject("error", "请输入模板设计文件");
			mv.setViewName("inputTemplate");
			return mv;
		} else if (StringUtils.isEmpty(template.getNotifiyNoFormat())) {
			mv.addObject("error", "请输入通知书号码格式");
			mv.setViewName("inputTemplate");
			return mv;
		} else if (StringUtils.isEmpty(template.getCreators())) {
			mv.addObject("error", "请输入谁可以利用该模板创建计划");
			mv.setViewName("inputTemplate");
			return mv;
		} else if (StringUtils.isEmpty(template.getReviewers())) {
			mv.addObject("error", "请输入审核者");
			mv.setViewName("inputTemplate");
			return mv;
		} else if (StringUtils.isEmpty(template.getApprovers())) {
			mv.addObject("error", "请输入承认者");
			mv.setViewName("inputTemplate");
			return mv;
		}
		
		try {
			templateService.insertTemplate(template);
			mv.setViewName("templateList");
			status.setComplete();
		} catch (Exception e) {
			log.error(e.getMessage());
			mv.addObject("error", "保持出错");
			mv.setViewName("inputTemplate");
		}
		
		return mv;
	}
}
