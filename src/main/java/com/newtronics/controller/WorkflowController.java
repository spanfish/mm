/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author xiangweiwang
 */
@Controller
@RequestMapping(value = "/workflow")
public class WorkflowController {
	private Logger log = Logger.getLogger(WorkflowController.class);

	@Autowired
	private RepositoryService repositoryService;

	@Autowired
	private RuntimeService runtimeService;

	@Autowired
	private TaskService taskService;

	@RequestMapping(value = "workflow.html", method = RequestMethod.GET)
	public ModelAndView init() {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("/process/workflow");
		return mv;
	}

	@RequestMapping(value = "workflow.html", method = RequestMethod.POST)
	public ModelAndView deploy(@RequestParam("processDef") MultipartFile processDef) {
		ModelAndView mv = new ModelAndView();

		try {
			repositoryService.createDeployment()
					.addInputStream(processDef.getOriginalFilename(), processDef.getInputStream()).deploy();
		} catch (IOException e) {
			e.printStackTrace();
		}
		mv.setViewName("/process/workflow");
		return mv;
	}

	@RequestMapping(value = "start.html", method = RequestMethod.POST)
	public ModelAndView start(@RequestParam("processDefinitionKey") String processDefinitionKey) {
		ModelAndView mv = new ModelAndView();

		try {
			ProcessInstance instance = runtimeService.startProcessInstanceByKey(processDefinitionKey);
			Long count = runtimeService.createProcessInstanceQuery().count();
			if (count == 1) {

			}

			List<Task> tasks = taskService.createTaskQuery().processInstanceId(instance.getId()).list();
			if(!tasks.isEmpty()) {
				Task task = tasks.get(0);
				taskService.setAssignee(task.getId(), "admin");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/process/workflow");
		return mv;
	}
	
	@RequestMapping(value = "search.html", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam("assignee") String assignee) {
		ModelAndView mv = new ModelAndView();

		try {
			List<Task> tasks = taskService.createTaskQuery().taskAssignee("assignee").list();
			mv.addObject("tasks", tasks);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/process/workflow");
		return mv;
	}
	
	@RequestMapping(value = "take.html", method = RequestMethod.POST)
	public ModelAndView take(@RequestParam("output") String output, @RequestParam("taskId") String taskId) {
		ModelAndView mv = new ModelAndView();

		try {
			Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
			Map<String, String> variables = new HashMap<String, String>();
			variables.put("output", output);
			taskService.complete(taskId, variables);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName("/process/workflow");
		return mv;
	}
}
