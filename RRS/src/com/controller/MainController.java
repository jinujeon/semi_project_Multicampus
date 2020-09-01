package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.MemberVO;

@Controller
public class MainController {
	
	@Resource(name="ubiz")
	Biz<String, MemberVO> biz;
	
	@RequestMapping("/main.mc")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main");
		return mv;
	}
	@RequestMapping("/login.mc")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("centerpage","login");
		mv.setViewName("main");
		return mv;
	}
	@RequestMapping("/loginimpl.mc")
	public ModelAndView loginimpl(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO dbuser = null;
		try {
			dbuser = biz.get(id);
			if(dbuser.getPwd().equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("loginuser", dbuser);
				mv.addObject("centerpage", "loginok");
			}else {
				mv.addObject("centerpage", "loginfail");
			}
		} catch (Exception e) {
			mv.addObject("centerpage", "loginfail");
			e.printStackTrace();
		}
		mv.setViewName("main");
		return mv;
	}
	@RequestMapping("/logout.mc")
	public ModelAndView loginout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		mv.setViewName("main");
		return mv;
	}
	
}
