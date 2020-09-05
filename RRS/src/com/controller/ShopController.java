package com.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.frame.Find;
import com.vo.ShopVO;
import com.vo.Shop_commentVO;
import com.vo.Shop_recommendVO;

@Controller
public class ShopController {

	@Resource(name="sbiz")
	Biz<Integer, ShopVO> sbiz;

	@Resource(name="cbiz")
	Biz<Integer, Shop_commentVO> cbiz;

	//댓글 find하기 위해 인터페이스 추가 설정
	@Resource(name="cbiz")
	Find<Integer, Shop_commentVO> fcomment;

	@Resource(name="rbiz")
	Biz<Integer, Shop_recommendVO> rbiz;

	//가게 등록 페이지로 이동
	@RequestMapping("/shop_regist.mc")
	public ModelAndView shopadd(ModelAndView mv) {

		//mv.addObject("dbuser", member); //아이디 자동 입력을 위해 멤버객체 등록 
		mv.addObject("centerpage", "shop/shop_regist");	//가게 등록jsp
		mv.setViewName("main");
		return mv;

	}

	//가게 등록 완료
	@RequestMapping("/shop_registimpl.mc")
	public ModelAndView shopaddimpl(ModelAndView mv, ShopVO shop) {
		//전체 가게 리스트
		ArrayList<ShopVO> list = null;

		//가게 이미지 등록
		String imgname = shop.getMf().getOriginalFilename();
		shop.setImg1(imgname);
		shop.setImg2(imgname);
		shop.setImg3(imgname);

		try {
			sbiz.register(shop);
			Util.saveFile(shop.getMf());
			list = sbiz.get();
		} catch (Exception e) {
			mv.addObject("centerpage", "shop/registerfail");
			e.printStackTrace();
		}

		mv.addObject("registershop", shop);
		mv.addObject("shoplist", list);
		mv.addObject("centerpage", "shop/shop_list");
		mv.setViewName("main");

		return mv;
	}

	//가게 리스트 화면
	@RequestMapping("/shop_list.mc")
	public ModelAndView shopselect(ModelAndView mv) {
		ArrayList<ShopVO> list = null;
		try {
			list = sbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("shoplist", list);
		mv.addObject("centerpage", "shop/shop_list");
		mv.setViewName("main");
		return mv;
	}

	//가게 상세 페이지
	@RequestMapping("/shop_detail.mc")
	public ModelAndView shopdetail(ModelAndView mv, Integer shopid) {

		//게시판 정보 & 댓글정보 & 추천 수
		ShopVO dbshop = null;
		Shop_recommendVO shoprecommend = null;
		ArrayList<Shop_commentVO> shop_comment = null;

		try {
			dbshop = sbiz.get(shopid);
			shop_comment = fcomment.comment(shopid);
			shoprecommend = rbiz.get(shopid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		//게시판 정보 & 댓글정보 넘겨주기
		mv.addObject("shopdetail", dbshop);
		mv.addObject("shop_comment", shop_comment);
		mv.addObject("shoprecommend", shoprecommend);
		mv.addObject("centerpage", "shop/shop_detail");
		mv.setViewName("main");
		return mv;
	}

	//가게 댓글 등록 완료
	@RequestMapping("/shop_commentimpl.mc")
	public String shop_commentimpl(Shop_commentVO shop_comment) {

		//가게 이미지 등록
		String imgname = shop_comment.getMf().getOriginalFilename();
		shop_comment.setCommentImg(imgname);

		try {
			cbiz.register(shop_comment);
			Util.saveCommentFile(shop_comment.getMf());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:shop_detail.mc?shopid="+shop_comment.getShopid();
	}

	//가게 추천 완료
	@RequestMapping("/shop_recommendimpl.mc")
	public String shop_recommendimpl(HttpServletRequest request) {

		//ajax통신으로 받아온 데이터 정리
		int shopid = Integer.parseInt(request.getParameter("shopid"));
		String userid = request.getParameter("userid");
		boolean up = Boolean.valueOf(request.getParameter("up")).booleanValue();
		boolean down = Boolean.valueOf(request.getParameter("down")).booleanValue();
		//정리한 데이터 객체이 삽입
		Shop_recommendVO recommend = new Shop_recommendVO(shopid, userid, up, down);

		try {
			rbiz.register(recommend);//DB에 저장
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "redirect:shop_detail.mc?shopid="+shopid;

	}

	//가게 위치 검색(지도 & 가게리스트 보여주기)
	@RequestMapping("/search.mc")
	public ModelAndView search(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {

		//검색내용 & 가게정보 받아오기
		String loc = request.getParameter("loc");
		ArrayList<ShopVO> list = null;
		
		try {
			list = sbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		if (!loc.equals("")) {
			mv.addObject("address", loc);
			mv.addObject("shoplist", list);
			mv.addObject("centerpage", "shop/shop_list");	//검색내용 shop_list.jsp에 보냄
		}else {
			System.out.println("검색실패"); //테스트용
		}
		mv.setViewName("main");
		
		return mv;
	}

	//가게 위치 위도경도(가게 정보) 받아오기
	@RequestMapping("/getshopdata.mc")
	@ResponseBody
	public void getshopdata(HttpServletResponse res) throws Exception {

		ArrayList<ShopVO> slist = new ArrayList<>();
		try {
			slist = sbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		JSONArray ja = new JSONArray();

		for(ShopVO s:slist) {
			JSONObject data = new JSONObject();
			data.put("shopname", s.getShopname());
			data.put("lat", (Math.round(s.getLat()*1000000)/1000000.0));
			data.put("lon", (Math.round(s.getLon()*1000000)/1000000.0));
			data.put("shopphonenumber", s.getShopphonenumber());
			ja.add(data);
		}

		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja.toJSONString());
		out.close();

	}

	//가게 추천 정보 받아오기
	@RequestMapping("/getshopdata2.mc")
	@ResponseBody
	public void getshopdata2(HttpServletResponse res) throws Exception {

		ArrayList<Shop_recommendVO> rlist = new ArrayList<>();
		
		try {
			rlist = rbiz.get();	//shopid만 받아오기
		} catch (Exception e) {
			e.printStackTrace();
		}		

		JSONArray ja2 = new JSONArray();

		for(Shop_recommendVO r:rlist) {
			Shop_recommendVO shoprecommend = null;
			JSONObject data = new JSONObject();
			data.put("shopid", r.getShopid());
			try {
				shoprecommend = rbiz.get(r.getShopid());
			} catch (Exception e) {
				e.printStackTrace();
			}	
			
			System.out.println("객체테스트 : " + shoprecommend);
			//추천값 총합, 비추천값 총합 json데이터에 넣기
			data.put("up", shoprecommend.getUpcount());
			data.put("down", shoprecommend.getDowncount());
			ja2.add(data);
		}

		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja2.toJSONString());
		out.close();

	}


}
