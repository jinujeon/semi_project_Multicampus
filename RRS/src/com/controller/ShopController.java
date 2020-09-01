package com.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.ShopVO;

@Controller
public class ShopController {

	@Resource(name="sbiz")
	Biz<Integer, ShopVO> biz;
	
	@RequestMapping("/shopadd.mc")
	public ModelAndView shopadd(ModelAndView mv) {
		
		mv.addObject("centerpage", "shop/register");
		mv.setViewName("main");
		return mv;
		
	}
	
	@RequestMapping("/shopaddimpl.mc")
	public ModelAndView shopaddimpl(ModelAndView mv, ShopVO shop) {
		
		String imgname = shop.getMf().getOriginalFilename();
		shop.setImg(imgname);
		
		try {
			biz.register(shop);
			Util.saveFile(shop.getMf());
		} catch (Exception e) {
			mv.addObject("centerpage", "shop/registerfail");
			e.printStackTrace();
		}
		
		mv.addObject("registershop", shop);
		mv.addObject("centerpage", "shop/registerok");
		mv.setViewName("main");
		
		return mv;
	}
	
	@RequestMapping("/shopselect.mc")
	public ModelAndView shopselect(ModelAndView mv) {
		
		ArrayList<ShopVO> list = null;
		
		try {
			list = biz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("shoplist", list);
		mv.addObject("centerpage", "shop/get");
		mv.setViewName("main");
		
		return mv;
	}
	
	@RequestMapping("/shopdetail.mc")
	public ModelAndView shopdetail(ModelAndView mv, Integer id) {
		
		ShopVO dbshop = null;
		
		try {
			dbshop = biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("shopdetail", dbshop);
		mv.addObject("centerpage", "shop/detail");
		mv.setViewName("main");
		
		return mv;
	}
	
	@RequestMapping("/shopdelete.mc")
	public String shopdelete(Integer id) {
		
		try {
			biz.remove(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:shopselect.mc";
	}
	
	@RequestMapping("/shopupdate.mc")
	public ModelAndView shopupdate(ModelAndView mv, Integer id) {
		
		ShopVO dbshop = null;
		
		try {
			dbshop = biz.get(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("dbshop", dbshop);
		mv.addObject("centerpage", "shop/modify");
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/shopupdateimpl.mc")
	public String shopupdateimpl(ShopVO shop) {
		String newimgname = shop.getMf().getOriginalFilename();
		
		if(! newimgname.equals("")) {
			shop.setImg(newimgname);
			Util.saveFile(shop.getMf());
		}
		
		try {
			biz.modify(shop);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:shopdetail.mc?id="+shop.getId();
	}
	
}
