/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.newtronics.tx.model.Role;
import com.newtronics.tx.model.User;
import com.newtronics.tx.service.UserService;

/**
 *
 * @author xiangweiwang
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * 顯示用戶列表
	 * 
	 * @return
	 */
	@RequestMapping(value = "users.html", method = RequestMethod.GET)
	public ModelAndView users() {
		List<User> users = userService.getAllUsers();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("users");
		mv.addObject("users", users);
		return mv;
	}

	/**
	 * 顯示編輯用戶頁面
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "edit/{username}.html", method = RequestMethod.GET)
	public ModelAndView editUser(@PathVariable("username") String username) {
		User user = userService.getUserByName(username);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editUser");
		mv.addObject("user", user);
		return mv;
	}

	/**
	 * 更新用戶信息
	 * 
	 * @param user
	 * @param result
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "update/update.html", method = RequestMethod.POST)
	public String update(@Valid @ModelAttribute("user") User user, BindingResult result, ModelMap model) {
		if (result.hasErrors()) {
			return "user";
		}
		// model.addAttribute("name", employee.getName());
		// model.addAttribute("contactNumber", employee.getContactNumber());
		// model.addAttribute("id", employee.getId());
		return "users";
	}

	/**
	 * 顯示創建用戶頁面
	 * 
	 * @return
	 */
	@RequestMapping(value = "create/", method = RequestMethod.GET)
	public ModelAndView createInit() {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser");
		mv.addObject("user", new User());
		return mv;
	}

	/**
	 * 創建用戶
	 * 
	 * @param user
	 * @param result
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "create/create.html", method = RequestMethod.POST)
	public ModelAndView create(Principal principal, @ModelAttribute("user") User user, BindingResult result,
			ModelMap model) {

		ModelAndView mv = new ModelAndView();
		mv.setViewName("createUser");
		mv.addObject("user", user);
		List<Role> roles = userService.getAllRoles();
		mv.addObject("roles", roles);

		if (user == null || principal == null) {
			mv.addObject("error", "已过期，请重新登陆");
			mv.setViewName("error");
			return mv;
		}
		if (StringUtils.isEmpty(user.getUsername())) {
			mv.addObject("error", "用户ID未输入");
			return mv;
		}
		if (StringUtils.isEmpty(user.getUserDispName())) {
			mv.addObject("error", "用户显示名未输入");
			return mv;
		}
		if (StringUtils.isEmpty(user.getPassword())) {
			mv.addObject("error", "用户密码未输入");
			return mv;
		}
		if (StringUtils.isEmpty(user.getPassword2())) {
			mv.addObject("error", "用户确认密码未输入");
			return mv;
		}
		if (!user.getPassword().equals(user.getPassword2())) {
			mv.addObject("error", "用户密码和用户确认密码不一致");
			return mv;
		}

		User u = userService.getUserByName(user.getUsername());
		if(u != null) {
			mv.addObject("error", "用户ID已存在");
			return mv;
		}
		
		user.setEnabled("1");
		
		if(user.getRoles() == null) {
			user.setRoles(new ArrayList<String>());
		}
		user.getRoles().add(user.getUserRole());
//		for (Role role : roles) {
//			if(role.getRole().equals(user.getUserRole())) {
//				user.getRoles().put(role.getUserRole(), role);
//			}
//		}
		userService.insertUser(user);
		
		return users();
	}

}
