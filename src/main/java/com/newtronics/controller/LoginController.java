/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.newtronics.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author xiangweiwang
 */
@Controller
@RequestMapping("/")
public class LoginController {

	@RequestMapping(value = "login.html", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
}
