package com.vo;

public class Shop_recommendVO {
   private int shopid;
   private String userid;
   private boolean up;
   private boolean down;
   public Shop_recommendVO() {
      super();
   }
   public Shop_recommendVO(int shopid, String userid, boolean up, boolean down) {
      super();
      this.shopid = shopid;
      this.userid = userid;
      this.up = up;
      this.down = down;
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
   public boolean isUp() {
      return up;
   }
   public void setUp(boolean up) {
      this.up = up;
   }
   public boolean isDown() {
      return down;
   }
   public void setDown(boolean down) {
      this.down = down;
   }
   @Override
   public String toString() {
      return "ShoprecommendVO [shopid=" + shopid + ", userid=" + userid + ", up=" + up + ", down=" + down + "]";
   }
   
}