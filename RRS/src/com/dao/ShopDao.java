package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.Find;
import com.frame.Setxy;
import com.vo.ShopVO;
import com.vo.Shop_commentVO;

@Repository("sdao")
public interface ShopDao extends Dao<Integer, ShopVO> , Setxy<Integer, ShopVO>{
	public void setcnt(Integer k) throws Exception;

}
