package com.frame;

import java.util.ArrayList;

import com.vo.ShopVO;

public interface Setxy<K, V> {
	public void setxy(ShopVO v) throws Exception;
	public ArrayList<V> rankshop() throws Exception;
}
