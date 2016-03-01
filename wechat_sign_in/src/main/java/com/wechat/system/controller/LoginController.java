package com.wechat.system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class LoginController {
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping("toLogin")
	public String toLogin(){
		return "login/login";
	}
	
	@RequestMapping("login")
	public String login(){
		return "login/mainframe";
	}
	
	@RequestMapping("welcome")
	public String welcome(){
		return "login/welcome";
	}
	@RequestMapping("logout")
	public String logout(){
		return "login/logout";
	}
}
