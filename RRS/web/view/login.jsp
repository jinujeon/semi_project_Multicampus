<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
/*general css*/
* {
   padding: 0;
   margin: 0 auto;
   box-sizing: border-box;
   list-style: none;
}

section { /* 화면전체 배경설정 */
   background: #F3F0F0;
}

.gap1 {      /*div사이사이 gap css*/
   height: 15px;
   clear: both;
   overflow: hidden;
   display: block;
}
/*header css*/
header {
   height: 75px;
   line-height: 75px;
   color: #2A0066;
}

header #headerdiv {
   width: 100%;
   margin: 0 auto;
   text-align: center;
}

.mainname {
   font-size: 2em;
   font-weight: 900;
   color: #00FFFF;
   text-shadow: 3px 3px 2px rgba(0, 0, 0, 0.44);
}

/*nav css start*/
nav {
   width: 100%;
   height: 55px;
   background-color: #d8d8d8;
}

.container {
   width: 1080px;
   height: 100%;
   padding: 0 20px;
}

.leftMenu {
   display: flex;
   flex-direction: row;
   margin: 0;
   padding: 0;
   background-color: #d8d8d8;
}

nav .leftMenu>li {
   float: left;
   padding: 15px;
   cursor: pointer;
   font-size: 100%;
   font-weight: BOLD;
}

nav .leftMenu>li>a {
   text-align: center;
   color: inherit;
   text-decoration: none;
   display: inline-block;
}

nav .leftMenu>li.loginbutton {
   float: right;
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
/*nav css end*/

/*footer css start*/
footer {
   width: 100%;
   height: 90px;
   border-top: 1px solid #cbcbcb;
   font-size: 15px;
   background-color: white;
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

/* loginpage div CSS START */
#logindiv {
   width: 70%;
   height: 300px;
   overflow: auto;
   background: white;
}

#logindivin {
   width: 95%;
   hight: auto;
   background: white;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin: 0 auto;
   text-align: center;
}

h1 {
   text-align: center;
}

.logid, .logpwd {
   width: 50%;
   height: 50px;
   text-align: center;
   font-weight: BOLD;
   font-size: 20px;
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

input[type=button] {
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
/* loginpage div CSS END */
</style>
<title>RRS 로그인</title>
<div id="center">
   <header>
      <div id="headerdiv">
         <span class="mainname" onclick="location.href='main.mc'">지역 맛집
            게시판</span>
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
                  <li><a href="#">공지사항</a></li>
                  <li class="joinbutton"><a href="join.mc">회원가입</a></li>
               </ul>
            </c:when>
         </c:choose>

      </div>
   </nav>
   
   <section>
      <!-- 로그인 화면 div -->
      <p class="gap1"></p>
      <div id="logindiv">
         <br>
         <div id="logindivin">
            <h1>Login page</h1>
            <form action="loginimpl.mc" method="post">
               <table>
                  <tr>
                     <td class="logid">아이디</td>
                     <td><input type="text" name="id" maxlength="50"></td>
                  </tr>
                  <tr>
                     <td class="logpwd">비밀번호</td>
                     <td><input type="password" name="pwd" maxlength="50"></td>
                  </tr>
                  <tr>
                     <td style="text-align: center"><input type="button"
                        value="회원가입" onclick="location.href='join.mc'" /></td>
                     <td style="text-align: center"><input type="submit"
                        value="로그인" /></td>
                  </tr>
               </table>
               <br>

            </form>
         </div>
      </div>
      <p class="gap1"></p>
   </section>

   <footer>
      <div class="top">
         <div class="container">
            <span>지역 맛집 시스템</span> <span>개인정보처리방침</span> <span>이용약관</span> <span>위치기반서비스
               이용약관</span>
         </div>
      </div>
      <div class="container">
         <strong> HOME : ADMIN : NEW POST </strong>
      </div>
   </footer>


</div>