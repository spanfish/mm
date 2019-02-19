package com.newtronics.controller;

import java.util.List;

import org.activiti.engine.IdentityService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.tx.service.ProcessIdentityService;
import com.newtronics.tx.service.UserService;

@Controller
@RequestMapping(value = "/process")
public class ProcessController {
	private Logger log = Logger.getLogger(ProcessController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
//	private ProcessIdentityService processIdentityService;
	private IdentityService identityService;
	/**
	 * 顯示用戶列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "identify.html", method = RequestMethod.GET)
	public ModelAndView init() {
		ModelAndView mv = new ModelAndView();
		
//		List<Group> groups = processIdentityService.findAllGroups();
		List<Group> groups = identityService.createGroupQuery().list();
		mv.addObject("groups", groups);
		mv.setViewName("/process/identify");
		return mv;
	}
	
	@RequestMapping(value = "saveGroup.html", method = RequestMethod.POST)
	public ModelAndView saveGroup(@RequestParam("groupId") String groupId) {
//		processIdentityService.newGroup(groupId);
		Group group = identityService.newGroup(groupId);
		identityService.saveGroup(group);
		return init();
	}
	
	@RequestMapping(value = "showGroup.html", method = RequestMethod.POST)
	public ModelAndView showGroup(@RequestParam("groupId") String groupId) {
		List<User> users  = identityService.createUserQuery().memberOfGroup(groupId).list();
		ModelAndView mv = init();
		if(users != null && !users.isEmpty()) {
			mv.addObject("users", users);
		}
		if(!StringUtils.isEmpty(groupId)) {
			mv.addObject("groupId", groupId);
		}
		
		List<com.newtronics.tx.model.User> sysUsers = userService.getAllUsers();
		if(sysUsers != null && !sysUsers.isEmpty()) {
			mv.addObject("sysUsers", sysUsers);
		}
		return mv;
	}
	
	@RequestMapping(value = "addUser.html", method = RequestMethod.POST)
	public ModelAndView addUser(@RequestParam("groupId") String groupId,
			@RequestParam("userId") String userId) {
		
		List<User> users = this.identityService.createUserQuery().userId(userId).list();
		if(users.isEmpty()) {
			User u = this.identityService.newUser(userId);
			this.identityService.saveUser(u);
		}
		
		Group g = this.identityService.createGroupQuery().groupId(groupId).singleResult();
		User u = this.identityService.createUserQuery().userId(userId).singleResult();
		this.identityService.createMembership(u.getId(), g.getId());
		
		return this.showGroup(groupId);
	}
}
