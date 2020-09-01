package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.BoardVO;

@Repository("bdao")
public interface BoardDao extends Dao<Integer, BoardVO> {
	public void setcnt(Integer k) throws Exception;

}
