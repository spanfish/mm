/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.tx.model.Plan;
import com.newtronics.tx.model.PlanItem;
import com.newtronics.tx.service.PlanService;

/**
 *
 * @author xiangweiwang
 */

@Controller
@RequestMapping(value = "/plan")
@SessionAttributes("plan")
public class PlanController {

	@Autowired
	private PlanService planService;

	@RequestMapping(value = "list.html", method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("listPlan");

		List<Plan> plans = planService.listPlan();
		mv.addObject("plans", plans);
		return mv;
	}

	@RequestMapping(value = "input.html", method = RequestMethod.GET)
	public ModelAndView inputPlan(HttpServletRequest request, HttpServletResponse response) {
		Plan plan = new Plan();

		ModelAndView mv = new ModelAndView();
		mv.setViewName("inputPlan");
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

	@RequestMapping(value = "save.html", method = RequestMethod.POST)
	@ResponseBody
	public String saveItem(Principal principal, ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("value") String value, @RequestParam("pk") String pk) {

		Plan plan = (Plan) modelMap.get("plan");
		if (plan == null) {
			return "Timeout";
		}
		Map<String, PlanItem> items = plan.getPlanItems();
		PlanItem item = items.get(name);
		if (item == null) {
			item = new PlanItem();
			items.put(name, item);
		}
		item.setPlan(plan);
		item.setItemName(name);
		item.setItemValue(value);

		plan = planService.insertPlan(plan);
		modelMap.put("plan", plan);
		return "OK";
	}

	@RequestMapping(value = "saveHead.html", method = RequestMethod.POST)
	@ResponseBody
	public String savePlanHead(Principal principal, ModelMap modelMap, @RequestParam("name") String name,
			@RequestParam("value") String value, @RequestParam("pk") String pk) {
		Plan plan = (Plan) modelMap.get("plan");
		if (plan == null) {
			return "Timeout";
		}

		if ("customerName".equals(name)) {
			plan.setCustomer(value);
		}
		plan = planService.insertPlan(plan);
		modelMap.put("plan", plan);
		return "OK";
	}

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
