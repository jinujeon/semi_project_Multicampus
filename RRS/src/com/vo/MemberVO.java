package com.vo;

public class MemberVO {
   private String userid;
   private String userpwd;
   private String username;
   private String userphonenumber;
   private String nickname;
   private boolean admincheck;

   public MemberVO() {
      super();
   }
   public MemberVO(String userid, String userpwd, String username, String userphonenumber, String nickname) {
      super();
      this.userid = userid;
      this.userpwd = userpwd;
      this.username = username;
      this.userphonenumber = userphonenumber;
      this.nickname = nickname;
   }

   public MemberVO(String userid, String userpwd, String username, String userphonenumber, String nickname,
         boolean admincheck) {
      super();
      this.userid = userid;
      this.userpwd = userpwd;
      this.username = username;
      this.userphonenumber = userphonenumber;
      this.nickname = nickname;
      this.admincheck = admincheck;
   }
   public String getUserid() {
      return userid;
   }

   public void setUserid(String userid) {
      this.userid = userid;
   }

   public String getUserpwd() {
      return userpwd;
   }

   public void setUserpwd(String userpwd) {
      this.userpwd = userpwd;
   }

   public String getUsername() {
      return username;
   }

   public void setUsername(String username) {
      this.username = username;
   }

   public String getUserphonenumber() {
      return userphonenumber;
   }

   public void setUserphonenumber(String userphonenumber) {
      this.userphonenumber = userphonenumber;
   }

   public String getNickname() {
      return nickname;
   }

   public void setNickname(String nickname) {
      this.nickname = nickname;
   }

   public boolean isAdmincheck() {
      return admincheck;
   }

   public void setAdmincheck(boolean admincheck) {
      this.admincheck = admincheck;
   }

   @Override
   public String toString() {
      return "UserVO [userid=" + userid + ", userpwd=" + userpwd + ", username=" + username + ", userphonenumber="
            + userphonenumber + ", nickname=" + nickname + ", admincheck=" + admincheck + "]";
   }
   
   
}