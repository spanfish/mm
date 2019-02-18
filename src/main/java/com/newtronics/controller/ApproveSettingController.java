/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.tx.service.UserService;

/**
 *
 * @author xiangweiwang
 */
@Controller
@RequestMapping(value = "/approve")
public class ApproveSettingController {
	private Logger log = Logger.getLogger(ApproveSettingController.class);

	@Autowired
	private UserService userService;
	
	//@Autowired
	//private TaskRuntime taskRuntime;

	/**
	 * 顯示用戶列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "setting.html", method = RequestMethod.GET)
	public ModelAndView users() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bpm/setting");
		return mv;
	}
}
