package com.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ShopVO {
	private int shopid;
	private String userid;
	private String shopname;
	private String shopphonenumber;
	private String address;
	private String locate;
	private double lat;
	private double lon;
	private Date shopdate;
	private int cnt;
	private String info;
	private String img1;
	private String img2;
	private String img3;
	MultipartFile mf;
	public ShopVO() {
	}
	
	public ShopVO(int shopid, String userid, String shopname, String shopphonenumber, String address, String locate,
			double lat, double lon, Date shopdate, int cnt, String info, String img1, String img2, String img3,
			MultipartFile mf) {
		super();
		this.shopid = shopid;
		this.userid = userid;
		this.shopname = shopname;
		this.shopphonenumber = shopphonenumber;
		this.address = address;
		this.locate = locate;
		this.lat = lat;
		this.lon = lon;
		this.shopdate = shopdate;
		this.cnt = cnt;
		this.info = info;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.mf = mf;
	}

	public ShopVO(String userid, String shopname, String shopphonenumber, String address, String locate, String info,
			String img1, String img2, String img3, MultipartFile mf) {
		super();
		this.userid = userid;
		this.shopname = shopname;
		this.shopphonenumber = shopphonenumber;
		this.address = address;
		this.locate = locate;
		this.info = info;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.mf = mf;
	}

	public ShopVO(String shopname, String shopphonenumber, String address, String locate, String info, String img1,
			String img2, String img3, MultipartFile mf) {
		super();
		this.shopname = shopname;
		this.shopphonenumber = shopphonenumber;
		this.address = address;
		this.locate = locate;
		this.info = info;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.mf = mf;
	}

	public int getShopid() {
		return shopid;
	}

	public void setShopid(int shopid) {
		this.shopid = shopid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getShopname() {
		return shopname;
	}

	public void setShopname(String shopname) {
		this.shopname = shopname;
	}

	public String getShopphonenumber() {
		return shopphonenumber;
	}

	public void setShopphonenumber(String shopphonenumber) {
		this.shopphonenumber = shopphonenumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLocate() {
		return locate;
	}

	public void setLocate(String locate) {
		this.locate = locate;
	}

	public double getLat() {
		return lat;
	}

	public void setLat(double lat) {
		this.lat = lat;
	}

	public double getLon() {
		return lon;
	}

	public void setLon(double lon) {
		this.lon = lon;
	}

	public Date getShopdate() {
		return shopdate;
	}

	public void setShopdate(Date shopdate) {
		this.shopdate = shopdate;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getImg1() {
		return img1;
	}

	public void setImg1(String img1) {
		this.img1 = img1;
	}

	public String getImg2() {
		return img2;
	}

	public void setImg2(String img2) {
		this.img2 = img2;
	}

	public String getImg3() {
		return img3;
	}

	public void setImg3(String img3) {
		this.img3 = img3;
	}

	public MultipartFile getMf() {
		return mf;
	}

	public void setMf(MultipartFile mf) {
		this.mf = mf;
	}

	@Override
	public String toString() {
		return "ShopVO [shopid=" + shopid + ", userid=" + userid + ", shopname=" + shopname + ", shopphonenumber="
				+ shopphonenumber + ", address=" + address + ", locate=" + locate + ", lat=" + lat + ", lon=" + lon
				+ ", shopdate=" + shopdate + ", cnt=" + cnt + ", info=" + info + ", img1=" + img1 + ", img2=" + img2
				+ ", img3=" + img3 + ", mf=" + mf + "]";
	}


}

