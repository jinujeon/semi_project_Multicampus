package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.MemberVO;

@Repository("udao")
public interface UserDao extends Dao<String, MemberVO> {
	public void setcnt(Integer k) throws Exception;

}
