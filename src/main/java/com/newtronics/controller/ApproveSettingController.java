/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.io.IOException;

import org.activiti.engine.RepositoryService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	
	@Autowired
	private RepositoryService repositoryService;
	/**
	 * 顯示用戶列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "setting.html", method = RequestMethod.GET)
	public ModelAndView init() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bpm_setting");
		return mv;
	}

	@RequestMapping(value = "deploy.html", method = RequestMethod.POST)
	public ModelAndView deploy(@RequestParam("processDef") MultipartFile processDef) {
		ModelAndView mv = new ModelAndView();
		
		try {
			repositoryService.createDeployment().addInputStream(processDef.getOriginalFilename(), processDef.getInputStream()).deploy();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("bpm_setting");
		return mv;
	}
}
