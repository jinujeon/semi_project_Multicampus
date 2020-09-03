package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BoardDao;
import com.frame.Biz;
import com.vo.BoardVO;
import com.vo.ShopVO;

@Service("bbiz")
public class BoardBiz implements Biz<Integer, BoardVO> {
	
	@Resource(name="bdao")
	BoardDao dao;

	@Override
	public void register(BoardVO v) throws Exception {
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
	public void modify(BoardVO v) throws Exception {
		int result = dao.update(v);
		if(result == 0) {	//쿼리문 작동 실패시 0
			throw new Exception();
		}
	}

	@Override
	public BoardVO get(Integer k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<BoardVO> get() throws Exception {
		return dao.selectall();
	}


}
