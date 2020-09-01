package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.Shop_commentDao;
import com.frame.Biz;
import com.vo.Shop_commentVO;

@Service("cbiz")
public class Shop_commentBiz implements Biz<Integer, Shop_commentVO> {
	@Resource(name="cdao")
	Shop_commentDao dao;

	@Override
	public void register(Shop_commentVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(Integer k) throws Exception {
		int result = dao.delete(k);
		if(result == 0) {	//쿼리문 작동 실패시 0
			throw new Exception();
		}
	}

	@Override
	public void modify(Shop_commentVO v) throws Exception {
		int result = dao.update(v);
		if(result == 0) {	//쿼리문 작동 실패시 0
			throw new Exception();
		}
	}

	@Override
	public Shop_commentVO get(Integer k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<Shop_commentVO> get() throws Exception {
		return dao.selectall();
	}

	@Override
	public ArrayList<Shop_commentVO> search(Object obj) throws Exception {
		return null;
	}

}
