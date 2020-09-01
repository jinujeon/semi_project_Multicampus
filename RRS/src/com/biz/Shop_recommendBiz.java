package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.ShopVO;

@Service("sbiz")
public class Shop_recommendBiz implements Biz<Integer, ShopVO> {
	@Resource(name="sdao")
	Dao<Integer, ShopVO> dao;

	@Override
	public void register(ShopVO v) throws Exception {
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
	public void modify(ShopVO v) throws Exception {
		int result = dao.update(v);
		if(result == 0) {	//쿼리문 작동 실패시 0
			throw new Exception();
		}
	}

	@Override
	public ShopVO get(Integer k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<ShopVO> get() throws Exception {
		return dao.selectall();
	}

	@Override
	public ArrayList<ShopVO> search(Object obj) throws Exception {
		return null;
	}

}
