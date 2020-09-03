<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
	#center > img{
		width:300px;
		height:300px;
	}
</style>
    
<div>
<div id="center">
	<h1>${shopdetail.shopname }</h1>
	<img src="img/${shopdetail.img1 }">
	<h2>${shopdetail.address }</h2>
	<h2>${shopdetail.shopphonenumber }</h2>
	<h2>${shopdetail.shopdate }</h2>
	<h2>조회수 : ${shopdetail.cnt }</h2>
	
	<h3><a href="shopdelete.mc?id=${shopdetail.shopid }">DELETE</a></h3>
	<h3><a href="shopupdate.mc?id=${shopdetail.shopid }">UPDATE</a></h3>
</div>

<div>
<table id="comment_table" border="1">
        <tr>COMMENTID, USERID, COMMENTCONTENTS, COMMENTDATE 
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
			<td><img src="img/${c.comment_img }"></td>
			<td><fmt:formatDate value="${c.commentdate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
		</tr>
	</c:forEach>
</table>
</div>

<%-- <div style="width:650px; text-align: center;">
        <br>
        <!-- **로그인 한 회원에게만 댓글 작성폼이 보이게 처리 -->
        <c:if test="${sessionScope.userId != null}">    
        <textarea rows="5" cols="80" id="replytext" placeholder="댓글을 작성해주세요"></textarea>
        <br>
        <button type="button" id="btnReply">댓글 작성</button>
        </c:if>
</div> --%>
</div>