package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.MemberVO;

@Service("mbiz")
public class MemberBiz implements Biz<String, MemberVO> {

	@Resource(name="mdao")
	Dao<String, MemberVO> dao;

	@Override
	public void register(MemberVO v) throws Exception {
		dao.insert(v);
		
	}

	@Override
	public void remove(String k) throws Exception {
		int result = 0;
		result = dao.delete(k);
		if(result ==0) {
			throw new Exception();
		}
		
	}

	@Override
	public void modify(MemberVO v) throws Exception {
		int result = 0;
		result = dao.update(v);
		if(result ==0) {
			throw new Exception();
		}
		
	}

	@Override
	public MemberVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<MemberVO> get() throws Exception {
		return dao.selectall();
	}


	
}