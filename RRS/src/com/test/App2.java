package com.test;

import java.util.ArrayList;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.frame.Biz;
import com.vo.MemberVO;

public class App2 {

	public static void main(String[] args) {
		System.out.println("App Start .......");
		AbstractApplicationContext factory = 
		new GenericXmlApplicationContext("myspring.xml");
		System.out.println("Spring Started .......");
		// IoC
		
		Biz<String,MemberVO> biz = (Biz)factory.getBean("ubiz");
		
		MemberVO u = new MemberVO("id73", "pwd73","ÀÓ¸»¼÷");
		ArrayList<MemberVO> list = null;
		try {
			list = biz.get();
			for(MemberVO us:list) {
				System.out.println(us);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		factory.close();
		System.out.println("Spring End .......");
		System.out.println("App End .......");

	}

}


