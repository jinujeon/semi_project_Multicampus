package com.controller;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.BoardVO;


@Controller
public class MainController {
	
		@Resource(name="bbiz")
		Biz<Integer, BoardVO> biz;
		
		@RequestMapping("/main.mc")
		public ModelAndView main() {
			ModelAndView mv = new ModelAndView();
			mv.setViewName("main");
			return mv;
		}

//		@RequestMapping("/main.mc")
//		public ModelAndView list(ModelAndView mv) {
//			ArrayList<BoardVO> list= null;
//			try {
//				list = biz.get();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			mv.addObject("boardlist", list);
//			mv.setViewName("main");
//			return mv;
//		}
//		
//	    @RequestMapping("/writer.mc")
//	    public String writerpage() {
//	        return "writer";
//	    }
//	    
//	    @RequestMapping("/insert.mc")
//	    public String insert(BoardVO board) {
//			try {
//				biz.register(board);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return "redirect:main.mc";
//
//	    }
//	    
//		@RequestMapping("/read.mc")
//		public ModelAndView read(ModelAndView mv, Integer bid) {
//			BoardVO board = null;
//			try {
//				board = biz.get(bid);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			mv.addObject("data",board);
//			mv.setViewName("read");
//			return mv;
//		}
//		
//		@RequestMapping("/update.mc")
//		public ModelAndView update(ModelAndView mv, Integer bid) {
//			BoardVO board = null;
//			try {
//				board = biz.get(bid);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			mv.addObject("datas",board);
//			mv.setViewName("update");
//			return mv;
//		}
//		
//		@RequestMapping("/updateimpl.mc")
//		public String updateimpl(BoardVO board) {
//			try {
//				biz.modify(board);
//				System.out.println(board);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return "redirect:main.mc";
//		}
//		
//		@RequestMapping("/delete.mc")
//	    public String delete(Integer bid) {
//			try {
//				biz.remove(bid);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return "redirect:main.mc";
//
//	    }
}


		

