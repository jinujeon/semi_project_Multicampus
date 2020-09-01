package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.MemberDao;
import com.frame.Biz;
import com.vo.MemberVO;

@Service("mbiz")
public class MemberBiz implements Biz<String, MemberVO> {
	@Resource(name="mdao")
	MemberDao dao;

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
