/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
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
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.tx.model.Plan;
import com.newtronics.tx.model.PlanItem;
import com.newtronics.tx.model.Template;
import com.newtronics.tx.service.PlanService;
import com.newtronics.tx.service.TemplateService;

/**
 *
 * @author xiangweiwang
 */

@Controller
@RequestMapping(value = "/plan")
@SessionAttributes("plan")
public class PlanController {

	private Logger log = Logger.getLogger(PlanController.class);

	@Autowired
	private PlanService planService;

	@Autowired
	private TemplateService templateService;

	/**
	 * 显示所有的计划列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "list.html", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("listPlan");

		// TODO:
		List<Plan> plans = planService.listPlan();
		mv.addObject("plans", plans);

		//
		List<Template> templates = templateService.findAllTemplates();
		mv.addObject("templates", templates);
		return mv;
	}

	/**
	 * 从创建计划迁移而来，创建Plan对象并保持在Session中
	 * 
	 * @param templateId
	 * @return
	 */
	@RequestMapping(value = "input.html", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView inputPlan(@RequestParam(name = "templateId", required = false) String templateId,
			@RequestParam(name = "notifyNo", required = false) String notifyNo,
			@RequestParam(name = "planId", required = false) String planId) {
		ModelAndView mv = new ModelAndView();
		Plan plan = null;
		String tid = templateId;
		if (StringUtils.isEmpty(notifyNo)) {
			plan = new Plan();
		} else {
			plan = planService.findPlanById(planId);
			tid = plan.getTemplateId();
		}
		if (plan == null || StringUtils.isEmpty(tid)) {
			// TODO:
		}

		Template template = templateService.findTemplateById(tid);
		if(template == null) {
			//TODO
		}
		if (StringUtils.isEmpty(plan.getCustomer())) {
			plan.setCustomer(template.getName());
		}
		if (StringUtils.isEmpty(plan.getTemplateId())) {
			plan.setTemplateId(tid);
		}
		
		mv.setViewName(template.getViewName());
		mv.addObject("plan", plan);

		return mv;
	}

	@RequestMapping(value = "create.html", method = RequestMethod.POST)
	public String createPlan(Principal principal) {

		Plan plan = new Plan();
		PlanItem item = new PlanItem();
		item.setPlan(plan);
		item.setItemName("abc");
		plan.getPlanItems().put("abc", item);
		planService.insertPlan(plan);

		return "listPlan";
	}

	/**
	 * 保存Session中的Plan对象，如果Plan对象未持续化，则插入到DB，否则更新DB
	 * 
	 * @param principal
	 * @param modelMap
	 * @param name
	 * @param value
	 * @param pk
	 * @return
	 */
	@RequestMapping(value = "save.html", method = RequestMethod.POST)
	@ResponseBody
	public String saveItem(Principal principal, ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("value") String value, @RequestParam("pk") String pk) {

		Plan plan = (Plan) modelMap.get("plan");
		if (plan == null || principal == null || StringUtils.isEmpty(principal.getName())) {
			return "已过期，请重新登陆";
		}
		Map<String, PlanItem> items = plan.getPlanItems();
		PlanItem item = items.get(name);
		if (item == null) {
			item = new PlanItem();
			items.put(name, item);
		}
		item.setPlan(plan);
		item.setItemName(pk);
		item.setItemValue(value);

		if (StringUtils.isEmpty(plan.getNotifyNo())) {
			plan = planService.insertPlan(plan);
		} else {
			plan = planService.updatePlan(plan);
		}
		modelMap.put("plan", plan);
		return "OK";
	}

	/**
	 * 
	 * @param principal
	 * @param modelMap
	 * @param name
	 * @param value
	 * @param pk
	 * @return
	 */
	@RequestMapping(value = "saveHead.html", method = RequestMethod.POST)
	@ResponseBody
	public String savePlanHead(Principal principal, ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("value") String value, @RequestParam("pk") String pk) {
		log.info("savePlanHead");
		Plan plan = (Plan) modelMap.get("plan");
		if (plan == null || principal == null || StringUtils.isEmpty(principal.getName())) {
			return "已过期，请重新登陆";
		}

		String response = "成功";
		try {
			BeanUtils.setProperty(plan, name, value);
			if (StringUtils.isEmpty(plan.getNotifyNo())) {
				plan = planService.insertPlan(plan);
			} else {
				plan = planService.updatePlan(plan);
			}
			modelMap.put("plan", plan);
		} catch (Exception e) {
			log.error(e.getMessage());
			response = "发生错误";
		}

		return response;
	}

	/**
	 * 
	 */
	@RequestMapping(value = "saveList.html", method = RequestMethod.POST)
	@ResponseBody
	public String saveListItem(Principal principal, @RequestParam("name") String name,
			@RequestParam("value[]") String value, @RequestParam("pk") String pk) {

		return "OK";
	}

	@RequestMapping(value = "submitReview.html", method = RequestMethod.POST)
	public ModelAndView submitReview(Principal principal, @ModelAttribute("plan") Plan plan) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("listPlan");
		List<Plan> plans = planService.listPlan();
		mv.addObject("plans", plans);
		return mv;
	}
}
