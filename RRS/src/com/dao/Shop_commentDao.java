package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.Shop_commentVO;

@Repository("cdao")
public interface Shop_commentDao extends Dao<Integer, Shop_commentVO> {
	public void setcnt(Integer k) throws Exception;

}
