package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.MemberVO;
import com.vo.ShopVO;
import com.vo.Shop_commentVO;


@Controller
public class MainController {

	@Resource(name="mbiz")
	Biz<String, MemberVO> mbiz;

	@Resource(name="cbiz")
	Biz<Integer, Shop_commentVO> cbiz;

	@RequestMapping("/main.mc")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();

		//댓글 정보
		ArrayList<Shop_commentVO> shop_comment = null;

		try {
			shop_comment = cbiz.get();
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("shop_comment", shop_comment);
		mv.setViewName("main");
		return mv;
	}

	//로그인 페이지로 이동
	@RequestMapping("/login.mc")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
//		mv.addObject("centerpage", "login");
		mv.setViewName("login");
		return mv;
	}

	//로그인 실행
	@RequestMapping("/loginimpl.mc")                 //alert 사용을 위해 HttpServletResponse response 추가
	public ModelAndView loginimpl(HttpServletRequest request, HttpServletResponse response) throws IOException {

		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberVO dbuser = null;

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			dbuser = mbiz.get(id);
			if(dbuser.getUserpwd().equals(pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("loginuser", dbuser);
				mv.addObject("centerpage", "first");
			}else { //password 오류 시
				mv.addObject("centerpage", "login");
				//spring에서 alert를 하는 구문----------------------------------

				out.println("<script>alert('로그인에 실패하였습니다'); </script>");
				out.flush();
				//---------------------------------------------------------
			}
		} catch (Exception e) {
			mv.addObject("centerpage", "login");
			out.println("<script>alert('로그인 오류입니다'); </script>");
			out.flush();
			e.printStackTrace();
		}
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping("/logout.mc")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		mv.setViewName("main");
		return mv;
	}


	@RequestMapping("/join.mc")
	public ModelAndView useradd(ModelAndView mv) {
	//	mv.addObject("centerpage", "member/join");
		mv.setViewName("member/join");
		return mv;
	}

	//회원가입 실행
	@RequestMapping("/joinimpl.mc")
	public ModelAndView useraddimpl(ModelAndView mv, MemberVO member,HttpServletResponse response) throws IOException {

		try {
			mbiz.register(member);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 되었습니다'); </script>");
			out.flush();
			mv.addObject("centerpage", "first");
		} catch (Exception e) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입 오류입니다'); </script>");
			out.flush();
			mv.addObject("centerpage", "member/join");
			e.printStackTrace();
		}
		mv.setViewName("main");
		return mv;
	}


	//========================날씨=============================

	public String getRequest(String url, String parameter) {

		try {
			String param = "{\"param\":\"" + parameter + "\"} ";

			// url를 인스턴스를 만든다.
			URL uri = new URL(url);
			// HttpURLConnection 인스턴스를 가져온다.
			HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
			// Web Method는 Post 타입
			connection.setRequestMethod("GET");

			// 요청한다. 200이면 정상이다.
			int code = connection.getResponseCode();
			if (code == 200) {

				// 응답 온 body 내용의 stream을 받는다.
				try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
					String line;
					StringBuffer buffer = new StringBuffer();
					while ((line = input.readLine()) != null) {
						buffer.append(line);
					}

					return buffer.toString();
				}
			}

			return code + "";
		} catch (Throwable e) {
			throw new RuntimeException(e);
		}
	}


	@RequestMapping("/getweather.mc")
	public void getweather(HttpServletRequest request, HttpServletResponse response) throws IOException {

		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyyMMdd");
		SimpleDateFormat format2 = new SimpleDateFormat ( "HH00" );

		Date time = new Date();

		String timeDate = format1.format(time);
		String timeHour = format2.format(time);
		//현재시간으로 설정 시 값을 못받아오기 때문에 현재시간에서 1시간 전 시간으로 설정
		int a = Integer.parseInt(timeHour);
		if(a==100) {
			timeHour="0000";
		}else if( a==0) {
			timeHour="2300";
		}else if(a<1000) {
			a = a-100;
			timeHour = "0"+Integer.toString(a);
		}else {
			a = a-100;
			timeHour = Integer.toString(a);
		}

		String urlstr = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?serviceKey=GCKdLak3diVhCnTIjF1tEy7Jg4%2B%2BCZjtNKfXmQqAbkAYipPxWX%2Fv1mvxvUsDA6%2By9lyZDj%2FP0h%2FiCs36Mi46eg%3D%3D&pageNo=1&numOfRows=10&dataType=XML&base_date="+timeDate+"&base_time="+timeHour+"&nx=60&ny=127&";
		String xmlstr = getRequest(urlstr,"");
		response.setContentType("text/xml;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(xmlstr);

	}




}




