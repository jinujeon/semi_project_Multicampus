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
*{
	margin:0;
	padding:0;
}
header{
	width:700px;
	height:150px;
	background:red;
	margin:0 auto;
}
header>h1{
	margin:0 auto;
	width:200px;
}

header>ul{
	margin:0 auto;
	width:400px;
}

header>ul>li{
	float:left;
	margin:0 10px;
}

section{
	width:700px;
	height:600px;
	background:gray;
	margin:0 auto;
}

section>#center{
	width:500px;
	background:white;
	margin:0 auto;
	text-align:center;
}

footer{
	width:700px;
	height:70px;
	background:black;
	margin:0 auto;
}

#cp{
	overflow: auto;
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
			$('span:eq(0)').text('현재기온 : ' + val+'℃');
		}
		if ($(d).find('category').text() == 'REH') {
			var val = $(d).find('obsrValue').text();
			$('span:eq(1)').text('현재습도 : ' + val+'%');
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
	<header>
		<h1>Main Page</h1>
		<c:choose>
			<c:when test="${loginuser == null}">
				<ul>
					<li><a href="main.mc">MAIN</a></li>
					<li><a href="login.mc">LOGIN</a></li>
					<li><a href="shop_regist.mc">게시글등록</a></li>
					<li><a href="shop_list.mc">게시글보기</a></li>
					<li><a href="join.mc">회원가입</a></li>
					<li><form action="search.mc" method="post">
							<input type="text" name="loc"> 
							<input type="submit" name="search" value="검색">
						</form>
					<li><span></span></li>
					<li><span></span></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul>
					<li>${loginuser.userid }님</li>
					<li><a href="main.mc">MAIN</a></li>
					<li><a href="logout.mc">LOGOUT</a></li>
					<li><form action="search.mc" method="post">
							<input type="text" name="loc"> 
							<input type="submit" name="search" value="검색">
						</form>
					<li><span></span></li>
					<li><span></span></li>
					<li><a href="shop_list.mc">게시글보기</a></li>
					<li><a href="shop_regist.mc">게시글등록</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</header>
	
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
	<footer></footer>

</body>
</html>