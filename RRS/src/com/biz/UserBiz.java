package com.biz;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.MemberVO;

@Service("ubiz")
public class UserBiz implements Biz<String, MemberVO> {
	@Autowired
	Dao<String, MemberVO> dao;

	@Override
	public void register(MemberVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		int result = dao.delete(k);
		if(result == 0) {	//쿼리문 작동 실패시 0
			throw new Exception();
		}
	}

	@Override
	public void modify(MemberVO v) throws Exception {
		int result = dao.update(v);
		if(result == 0) {	//쿼리문 작동 실패시 0
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

	@Override
	public ArrayList<MemberVO> search(Object obj) throws Exception {
		return null;
	}



}
