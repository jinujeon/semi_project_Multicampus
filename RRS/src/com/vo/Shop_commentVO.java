package com.vo;

import java.util.Date;

public class Shop_commentVO {
	private int commentid;
	private String userid;
	private int shopid;
	private String commentcontents;
	private Date commentdate;
	public Shop_commentVO() {
		super();
	}
	public Shop_commentVO(int commentid, String userid, int shopid, String commentcontents, Date commentdate) {
		super();
		this.commentid = commentid;
		this.userid = userid;
		this.shopid = shopid;
		this.commentcontents = commentcontents;
		this.commentdate = commentdate;
	}
	public Shop_commentVO(int commentid, String userid, int shopid, String commentcontents) {
		super();
		this.commentid = commentid;
		this.userid = userid;
		this.shopid = shopid;
		this.commentcontents = commentcontents;
	}
	
	public Shop_commentVO(String commentcontents) {
		super();
		this.commentcontents = commentcontents;
	}
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getCommentcontents() {
		return commentcontents;
	}
	public void setCommentcontents(String commentcontents) {
		this.commentcontents = commentcontents;
	}
	public Date getCommentdate() {
		return commentdate;
	}
	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}
	@Override
	public String toString() {
		return "Shop_commentVO [commentid=" + commentid + ", userid=" + userid + ", shopid=" + shopid
				+ ", commentcontents=" + commentcontents + ", commentdate=" + commentdate + "]";
	}
	
}
