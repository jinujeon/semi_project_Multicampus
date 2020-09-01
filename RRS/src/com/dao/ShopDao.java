package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.ShopVO;

@Repository("sdao")


public interface ShopDao extends Dao<Integer, ShopVO> {
	public void setcnt(Integer k) throws Exception;

}
