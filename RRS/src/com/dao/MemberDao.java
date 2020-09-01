package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.MemberVO;

@Repository("mdao")
public interface MemberDao extends Dao<String, MemberVO> {
	public void setcnt(String k) throws Exception;

}
