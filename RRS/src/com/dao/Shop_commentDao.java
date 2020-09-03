package com.dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.frame.Find;
import com.vo.Shop_commentVO;

@Repository("cdao")
public interface Shop_commentDao extends Dao<Integer, Shop_commentVO>, Find<Integer, Shop_commentVO> {
	//public ArrayList<Shop_commentVO> comment(Integer k) throws Exception;
}
