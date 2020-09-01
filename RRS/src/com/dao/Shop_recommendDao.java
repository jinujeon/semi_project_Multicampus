package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.Shop_recommendVO;

@Repository("rdao")
public interface Shop_recommendDao extends Dao<Integer, Shop_recommendVO> {
	public void setcnt(Integer k) throws Exception;

}
