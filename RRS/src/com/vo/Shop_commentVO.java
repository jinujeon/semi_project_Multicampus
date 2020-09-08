package com.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Shop_commentVO {
   private int commentid;
   private String userid;
   private int shopid;
   private String commentcontents;
   private Date commentdate;
   private String comment_img;
   MultipartFile mf;
   public Shop_commentVO() {
      super();
   }
   public Shop_commentVO(int commentid, String userid, int shopid, String commentcontents, Date commentdate,
         String comment_img) {
      super();
      this.commentid = commentid;
      this.userid = userid;
      this.shopid = shopid;
      this.commentcontents = commentcontents;
      this.commentdate = commentdate;
      this.comment_img = comment_img;
   }
   public Shop_commentVO(int commentid, String userid, int shopid, String commentcontents, Date commentdate,
         String commentImg, MultipartFile mf) {
      super();
      this.commentid = commentid;
      this.userid = userid;
      this.shopid = shopid;
      this.commentcontents = commentcontents;
      this.commentdate = commentdate;
      this.comment_img = commentImg;
      this.mf = mf;
   }
   public Shop_commentVO(int commentid, String userid, int shopid, String commentcontents, String commentImg, 
         MultipartFile mf) {
      super();
      this.commentid = commentid;
      this.userid = userid;
      this.shopid = shopid;
      this.commentcontents = commentcontents;
      this.comment_img = commentImg;
      this.mf = mf;
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
   public String getComment_img() {
      return comment_img;
   }
   public void setComment_img(String commentImg) {
      this.comment_img = commentImg;
   }
   public MultipartFile getMf() {
      return mf;
   }
   public void setMf(MultipartFile mf) {
      this.mf = mf;
   }
   @Override
   public String toString() {
      return "Shop_commentVO [commentid=" + commentid + ", userid=" + userid + ", shopid=" + shopid
            + ", commentcontents=" + commentcontents + ", commentdate=" + commentdate + "]";
   }
   
}