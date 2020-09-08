package com.controller;

import java.io.IOException;
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
import com.frame.Setxy;
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
	
	//setxy하기 위해 인터페이스 추가 설정
	@Resource(name="sbiz")
	Setxy<Integer, ShopVO> setxybiz;
	
	//rankshop하기 위해 인터페이스 추가 설정
	@Resource(name="sbiz")
	Setxy<Integer, ShopVO> rankbiz;


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
	public ModelAndView shopaddimpl(ModelAndView mv, HttpServletResponse response, ShopVO shop) throws IOException {

		ShopVO list = shop;

		//가게 이미지 등록
		String imgname = shop.getMf().getOriginalFilename();
		shop.setImg1(imgname);
		shop.setImg2(imgname);
		shop.setImg3(imgname);

		try {
			System.out.println(shop);
			Util.saveFile(shop.getMf());
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록되었습니다'); </script>");
			out.flush();
			
			mv.addObject("registshop", shop);
			mv.addObject("centerpage", "first");
			
		} catch (Exception e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('등록에 실패했습니다'); </script>");
			out.flush();
			mv.addObject("centerpage", "shop/registerfail");
			e.printStackTrace();
		}

		mv.setViewName("main");

		return mv;
	}
	
	
	//가게 위도 경도 설정
	@RequestMapping("/shopxyupdate.mc")
	public void shopxyupdate(HttpServletRequest request, HttpServletResponse response) throws IOException{
		
		//ajax통신으로 받아온 데이터 정리
		double lat = Double.parseDouble(request.getParameter("x"));
		double lon = Double.parseDouble(request.getParameter("y"));
		
		//정리한 데이터 객체이 삽입
		ShopVO shop = new ShopVO(lat, lon);
		
		try {
			setxybiz.setxy(shop);
			System.out.println("OK");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("errorxy");
		}

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
		shop_comment.setComment_img(imgname);

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
	public void shop_recommendimpl(HttpServletRequest request, HttpServletResponse response) throws IOException{

		//ajax통신으로 받아온 데이터 정리
		int shopid = Integer.parseInt(request.getParameter("shopid"));
		String userid = request.getParameter("userid");
		boolean up = Boolean.valueOf(request.getParameter("up")).booleanValue();
		boolean down = Boolean.valueOf(request.getParameter("down")).booleanValue();
		//정리한 데이터 객체이 삽입
		Shop_recommendVO recommend = new Shop_recommendVO(shopid, userid, up, down);

		//ajax에 데이터 보내기 위한 설정
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			rbiz.register(recommend);//DB에 저장 후 alert에 띄울 string값 보내기(ajax)
			if(up) out.println("추천하셨습니다.");
			else out.println("비추천하셨습니다.");
			out.flush();
		} catch (Exception e) {
			//저장 실패 시 alert에 띄울 string값 보내기(ajax)
			if(up) out.println("추천에 실패하셨습니다.");
			else out.println("비추천에 실패하셨습니다.");
			out.flush();
		}

		out.close();

	}

	//가게 위치 검색(지도 & 가게리스트 보여주기)
	@RequestMapping("/search.mc")
	public ModelAndView search(ModelAndView mv, HttpServletRequest request, HttpServletResponse response, String sel) {

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

	
	@RequestMapping("/shopdelete.mc")
	   public String shopdelete(Integer shopid) {
	      
	      try {
	         sbiz.remove(shopid);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return "redirect:main.mc";
	   }
	   
	   @RequestMapping("/shopupdate.mc")
	   public ModelAndView shopupdate(ModelAndView mv, Integer shopid) {
	      
	      ShopVO dbshop = null;
	      
	      try {
	         dbshop = sbiz.get(shopid);
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
	      
	      System.out.println(newimgname);
	      
	      if(! newimgname.equals("")) {
	         shop.setImg1(newimgname);
	         Util.saveFile(shop.getMf());
	      }
	      
	      try {
	         sbiz.modify(shop);
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      return "redirect:main.mc?shopid="+shop.getShopid();
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
			data.put("shopid", s.getShopid());
			data.put("shopname", s.getShopname());
			data.put("lat", (Math.round(s.getLat()*1000000)/1000000.0));
			data.put("lon", (Math.round(s.getLon()*1000000)/1000000.0));
			data.put("shopphonenumber", s.getShopphonenumber());
			data.put("userid", s.getUserid());
			data.put("cnt", s.getCnt());
			data.put("img1", s.getImg1());
			data.put("img2", s.getImg2());
			data.put("img3", s.getImg3());
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
			rlist = rbiz.get();	//
		} catch (Exception e) {
			e.printStackTrace();
		}		

		JSONArray ja2 = new JSONArray();

		for(Shop_recommendVO r:rlist) {
			JSONObject data = new JSONObject();
			data.put("shopid", r.getShopid());
			data.put("up", r.getUpcount());
			data.put("down", r.getDowncount());
			ja2.add(data);
		}

		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja2.toJSONString());
		out.close();

	}
	
	//가게 순위 보내기
	@RequestMapping("/getshoprank.mc")
	@ResponseBody
	public void getshoprank(HttpServletResponse res) throws IOException{
		
		ArrayList<ShopVO> list = new ArrayList<>();

		try {
			list = rankbiz.rankshop();			
		} catch (Exception e) {
			e.printStackTrace();
		}

		JSONArray ja = new JSONArray();

		for(ShopVO s:list) {
			JSONObject data = new JSONObject();
			data.put("shopid", s.getShopid());
			data.put("shopname", s.getShopname());
			data.put("img1", s.getImg1());
			data.put("sumup", s.getSumup());
			ja.add(data);
		}
		
		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		PrintWriter out = res.getWriter();

		out.print(ja.toJSONString());
		out.close();
	}





}
