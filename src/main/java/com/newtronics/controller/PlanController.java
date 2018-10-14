/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.tx.model.Plan;
import com.newtronics.tx.service.PlanService;

/**
 *
 * @author xiangweiwang
 */

@Controller
@RequestMapping(value = "/plan")
public class PlanController {
	
	@Autowired
	private PlanService planService;
	
	@RequestMapping(value = "/list.htm", method = RequestMethod.GET)
	public ModelAndView defaultPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("listPlan");
		return mv;
	}
	
	@RequestMapping(value = "/input.htm", method = RequestMethod.GET)
	public ModelAndView inputPlan() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("inputPlan");
		mv.addObject("plan", new Plan());
		return mv;
	}
	
	@RequestMapping(value = "/create.htm", method = RequestMethod.POST)
	public ModelAndView createPlan(Principal principal, @Valid @ModelAttribute("plan") Plan plan, BindingResult result, ModelMap model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createPlan");
		
		planService.insertPlan(plan);
		
		return mv;
	}
}
