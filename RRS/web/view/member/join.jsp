<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="center">
<style>
input[type=text], input[type=password]{
   width: 20%;
   height:50px;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight:BOLD;
}

/*general css*/
* {
   padding: 0;
   margin: 0 auto;
   box-sizing: border-box;
   list-style: none;
}

.container {
   width: 1080px;
   height: 100%;
   padding: 0 20px;
}

li {
   float: left;
}

a {
   width: 100%;
   height: 100%;
   color: inherit;
   text-decoration: none;
   display: inline-block;
}

body {
   min-height: 100vh;
   position: relative;
}

.clear {
   clear: both;
}

input[type=text], input[type=password] {
   width: 80%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight: BOLD;
   font-size: 20px;
   text-align: center;
}

input[type=submit] {
   width: 50%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight: BOLD;
   font-size: 20px;
   text-align: center;
}


/*header css*/
header {
   width: 100%;
   height: 75px;
   line-height: 75px;
   color: #2A0066;
}

.mainname {
   font-size:2em;  
   font-weight:600;
   color: #00FFFF;
}

/*nav css start*/
nav {
   width: 100%;
   height: 50px;
   background-color:#d8d8d8;
}
.leftMenu {
   display: flex;
   flex-direction: row;
   width:100%;
   margin:0;
   padding:0;
   background-color:#d8d8d8;
}
nav .leftMenu>li {
   padding:15px;
   cursor:pointer;
   font-size: 100%;
   font-weight: BOLD;

}
nav .leftMenu > li > a{
   text-align:center;
}
nav .leftMenu>li.joinbutton{
   float:right;
}
nav .leftMenu>li.loginbutton{
   float:right;
}

nav .leftMenu>li:hover>.dropmenu {
   visibility: visible;
}
nav .leftMenu>li>.dropmenu {
   display: inline-block;
   width: 200px;
   clear: both;
   position: absolute;
   top: 60px;
   left: 0;
   text-align: center;
   box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.4);
   visibility: hidden;
}
nav .leftMenu>li>.dropmenu>span {
   width: 200px;
   display: inline-block;
   padding-right: 20px;
   background: #9DCFFF;
   color: #000000;
   font-weight: 400;
}
nav .leftMenu>li>.dropmenu>span:hover {
   font-weight: 700;
}
nav .leftMenu>li:hover {
   color: #000000;
   font-weight: 700;
   border-bottom: 3px solid #2478FF;
}
nav .leftMenu>li.active {
   color: #2478FF;
   font-weight: 700;
   border-bottom: 3px solid #2478FF;
}
nav.rightMenu {
   height: 80%;
   font-size: 100%;
   font-weight: BOLD;
   float: right;
   /* right: 0px; */
}
nav.rightMenu>li {
   width: 100px;
   height: 36px;
   line-height: 32px;
   margin-top: 12px;
   margin-left: 10px;
   padding: 0 10px;
   text-align: center;
   color: orange;
   font-weight: 700px;
   border: 2px solid green;
   cursor: pointer;
   border-radius: 50px;
}
nav .rightMenu>li:hover, nav .rightMenu>li.active {
   color: orange;
   background: white;
   border-bottom: 3px solid #2478FF;
}
/*nav css end*/

/*footer css start*/
footer {
   width: 100%;
   height: 90px;
   border-top: 1px solid #cbcbcb;
   font-size: 15px;
}

footer>.container {
   height: auto;
}

footer>.top {
   width: 100%;
   height: 40px;
   border-bottom: 1px solid #cbcbcb;
   margin-bottom: 15px;
}

footer>.top span {
   height: 100%;
   line-height: 40px;
   padding-right: 15px;
   cursor: pointer;
}

footer .top span hover {
   font-weight: 700;
}

footer .copyright {
   margin-top: 5px;
}
/*footer css end*/
#cp {
   overflow: auto;
}
/*div사이사이 gap css*/
.gap1 {
   height: 15px;
   clear: both;
   overflow: hidden;
   display: block;
}

h1 {
   text-align:center;
}

.joinid, .joinpwd, .joinname, .joinnum, .joinnick{
   width:30%;
   height:50px;
   text-align:center;
   font-weight:BOLD;
   font-size:20px;
}

</style>

<header>
      <div class="container">
         
 
            <span class="mainname">지역 맛집 게시판</span>

      </div>
</header>

   <!-- nav -->
   <nav>
      <div class="container">
         <c:choose>
            <c:when test="${loginuser == null}">
               <ul class="leftMenu">
                  <li class="active"><a href="main.mc">HOME</a></li>
                  <li><a href="https://naver.com">소개</a></li>
                  <li><a href="https://google.com">이용안내</a></li>
                  <!-- <li><span class="dropmenu"> <span><a href="#">자유
                              게시판</a></span> <span><a href="#">문의 게시판</a></span>
                  </span></li> -->
                  <li><a href="#">공지사항</a></li>
               </ul>
            </c:when>
         </c:choose>

      </div>
   </nav>
   
<h1>회원가입</h1>
<form action="joinimpl.mc" method="post">
<table>
 <tr>
        <td class="joinid" >ID</td>
        <td><input type="text" name="userid" maxlength="50"></td>
 </tr>
<tr>
        <td class="joinpwd">PWD</td>
        <td><input type="password" name="userpwd" maxlength="50"></td>
</tr>
<tr>
        <td class="joinname">NAME</td>
        <td><input type="text" name="username" maxlength="50"></td>
</tr>
<tr>
        <td class="joinnum">PHONENUMBER</td>
        <td><input type="text" name="userphonenumber" maxlength="50"></td>
</tr>
<tr>
        <td class="joinnick">NICKNAME</td>
        <td><input type="text" name="nickname" maxlength="50"></td>
</tr>
<tr>
        <td><input type="hidden" name="admincheck" value=0></td>
        <td><input type="submit" name="REGISTER" value="가입하기"></td>
</tr>
</table>

</form>

</div>