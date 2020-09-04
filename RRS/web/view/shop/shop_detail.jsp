<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
	#center>img {
		width: 300px;
		height: 300px;
	}
	
	#comment_table>img {
		width: 100px;
		height: 100px;
	}
	
	#btnUp {
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		margin-right: -4px;
	}
	
	#btnDown {
		border-top-right-radius: 5px;
		border-bottom-right-radius: 5px;
		margin-left: -3px;
	}
	
	#btnrecommend button {
		border: 1px solid skyblue;
		background-color: rgba(0, 0, 0, 0);
		color: skyblue;
		padding: 5px;
	}
	
	#btnrecommend button:hover {
		color: white;
		background-color: skyblue;
	}
</style>

<script>
/* ----------------------------------------------------------------------------------------- */
/*                                      추천 시스템                                                                               */
/* ----------------------------------------------------------------------------------------- */
function recommendUp() {
	var updata = {"up":"true", "shopid":"${shopdetail.shopid}", "userid":"ID0001", "down":"false"}
	$.ajax({
		url: 'shop_recommendimpl.mc',
		type: "POST",
		data: updata,
		success : function() {
		},
		error : function() {
		}
	});
};

function recommendDown() {
	var downdata = {"up":"false", "shopid":"${shopdetail.shopid}", "userid":"ID0001", "down":"true"}
	$.ajax({
		url: 'shop_recommendimpl.mc',
		type: "POST",
		data: downdata,
		success : function() {
		},
		error : function() {
		}
	});
};


$(document).ready(function() {
	
	//추천 기능
	$('#btnrecommend > #btnUp').click(function() {
		recommendUp(); //추천 버튼 클릭 시 추천ajax
		alert("추천하셨습니다.")
	});
	$('#btnrecommend > #btnDown').click(function() {
		recommendDown(); //비추 버튼 클릭 시 비추천ajax
		alert("비추하셨습니다.")
	});
});

</script>

<!-- shop 화면 div -->
<div>
<div id="center">
	<h1>${shopdetail.shopname }</h1>
	<img src="img/${shopdetail.img1 }">
	<h2>${shopdetail.address }</h2>
	<h2>${shopdetail.shopphonenumber }</h2>
	<h2>${shopdetail.shopdate }</h2>
	<h2>조회수 : ${shopdetail.cnt }</h2>
	<div id="btnrecommend">
		<button id="btnUp">추천 : ${shoprecommend.upcount }</button>
		<button id="btnDown">비추 : ${shoprecommend.downcount }</button>
	</div>
</div>
<p class="gap20"></p>

<!-- 댓글리스트 div -->
<div>
<h2>댓글</h2>
<table id="comment_table" border="1">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>내용</th>
            <th>이미지</th>
            <th>날짜</th>
        </tr>
	<!-- forEach 문을 활용하여 comment list 보여주기 -->
	<c:forEach var="c" items="${shop_comment }">
		<tr>
			<!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
			<td>${c.commentid}</td>
			<td>${c.userid}</td>
			<td>${c.commentcontents}</td>
			<td><img src="img/comment/${c.commentImg }"></td>
			<td><fmt:formatDate value="${c.commentdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
	</c:forEach>
</table>
</div>

<!-- 댓글등록 div (로그인 한 회원에게만 댓글 작성폼이 보이게 처리)-->
<div style="width:650px; text-align: center;">
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:choose>
			<c:when test="${loginuser.userid == null}">
				<h3>댓글작성</h3>
				<form enctype="multipart/form-data" name="bdto" method="post" action="shop_commentimpl.mc">
					<input type="hidden" name="userid" value="ID1000"> 
					<input type="hidden" name="shopid" value="${shopdetail.shopid }">
					<div>내용	<textarea name="commentcontents" id="commentcontents" rows="4" cols="80" placeholder="댓글 입력"></textarea></div>
					<div>사진<input type="file" name="mf"></div>
					<input type="submit" value="확인">
				</form>
			</c:when>
			<c:otherwise>

			</c:otherwise>
		</c:choose>
</div> 

<!-- 게시글 수정 삭제 -->
<div>
	<!-- 게시글 수정 삭제 div (게시글 작성회원에게만 수정삭제폼이 보이게 처리)-->
	<h3><a href="shopdelete.mc?id=${shopdetail.shopid }">DELETE</a></h3>
	<h3><a href="shopupdate.mc?id=${shopdetail.shopid }">UPDATE</a></h3>
</div>

</div>