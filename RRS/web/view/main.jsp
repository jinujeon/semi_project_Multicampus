<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
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

input[type=text] {
   width: 80%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight: BOLD;
   font-size: 20px;
}

input[type=submit] {
   width: 9%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight: BOLD;
}

/*header css*/
header {
   width: 100%;
   height: 75px;
   line-height: 75px;
   color: #2A0066;
}

.mainname {
   font-size:1.5em;  
   color: green;
}

/*nav css start*/
nav {
   width: 100%;
   height: 50px;
   border-bottom: 3px solid #cbcbcb;
}

nav.leftMenu {
   float: left;
   height: 80%;
   font-size: 100%;
   font-weight: BOLD;
   left: 0px;
}

nav .leftMenu>li.joinbutton{
   float:right;
}

nav .leftMenu>li.loginbutton{
   float:right;
}

nav.leftMenu>li {
   width: 900px;
   padding: 0 20px;
   height: 100px;
   line-height: 100px;
   text-align: center;
   cursor: pointer;
   position: relative;
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
</style>


<script>
/* ----------------------------------------------------------------------------------------- */
/*                                        날씨   시스템                                                                               */
/* ----------------------------------------------------------------------------------------- */
//날씨데이터 받아오기
function getdataW() {
	var urlstr = 'getweather.mc';
	$.ajax({
		url : urlstr,
		dataType : 'xml',
		success : function(data) {
			displayW(data);
		},
		error : function() {
			alert('error5');
		}
	});
};
//날씨정보 표시
function displayW(data) {
	var items = $(data).find('item');
	$(items).each(function(index, d) {
		if ($(d).find('category').text() == 'T1H') {
			var val = $(d).find('obsrValue').text();
			$('span>#tem').text('현재기온 : ' + val+'℃');
		}
		if ($(d).find('category').text() == 'REH') {
			var val = $(d).find('obsrValue').text();
			$('span>#moi').text('현재습도 : ' + val+'%');
		}
	});
};
//------------------------------------------
$(document).ready(function() {
	getdataW();
});
</script>

</head>
<body>
   <!-- header -->
   <header>
      <div class="container">
         
         <form action="search.mc" method="post">
            <span class="mainname">지역 맛집 게시판</span>
            <input type="text" name="loc" id="text-keyword"
               style="width: 60%; height: 50px;" type="text"
               placeholder="가게명으로 주변 맛집을 찾아보세요"> <input type="submit"
               sytle="display:none" value="검색">
         </form>
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
                  <li><span class="dropmenu"> <span><a href="#">자유
                              게시판</a></span> <span><a href="#">문의 게시판</a></span>
                  </span></li>
                  <li><a href="#">공지사항</a></li>
                  <li class="joinbutton"><a href="join.mc">회원가입</a></li>
                  <li class="loginbutton"><a href="login.mc">로그인</a></li>
               </ul>

            </c:when>
            <c:otherwise>
               <ul class="leftMenu">
                  <li class="active"><a href="main.mc">HOME</a></li>
                  <li><a href="https://naver.com">소개</a></li>
                  <li><a href="https://google.com">이용안내</a></li>
                  <li><a href="shop_regist.mc">맛집등록게시판</a></li>
                  <li class="dropbox"><a href="shop_list.mc">게시판</a> <span
                     class="dropmenu"> <span><a href="#">자유 게시판</a></span> <span><a
                           href="#">문의 게시판</a></span>
                  </span></li>
                  <li><a href="#">공지사항</a></li>
                  <li class="joinbutton">${loginuser.nickname}님</li>
                  <li class="loginbutton"><a href="logout.mc">로그아웃</a></li>
               </ul>
            </c:otherwise>
         </c:choose>

      </div>
   </nav>

   <section id="cp">
      <c:choose>
         <c:when test="${centerpage==null }">
            <jsp:include page="first.jsp"></jsp:include>
         </c:when>
         <c:otherwise>
            <jsp:include page="${centerpage }.jsp"></jsp:include>
         </c:otherwise>
      </c:choose>

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

</body>

</html>