package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.Shop_recommendDao;
import com.frame.Biz;
import com.vo.Shop_recommendVO;

@Service("rbiz")
public class Shop_recommendBiz implements Biz<Integer, Shop_recommendVO> {
	@Resource(name="rdao")
	Shop_recommendDao dao;

	@Override
	public void register(Shop_recommendVO v) throws Exception {
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
	public void modify(Shop_recommendVO v) throws Exception {
		int result = dao.update(v);
		if(result == 0) {	//쿼리문 작동 실패시 0
			throw new Exception();
		}
	}

	@Override
	public Shop_recommendVO get(Integer k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<Shop_recommendVO> get() throws Exception {
		return dao.selectall();
	}

}
