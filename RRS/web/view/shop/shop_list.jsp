<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	img{
		width:50px;
		height:50px;
	}
</style>

<div id="center">
<h1>가게게시글</h1>
<table id="shop_table" border="1">
        <tr>
            <th>번호</th>
            <th>사진</th>
            <th>가게이름</th>
            <th>글쓴이</th>
            <th>조회수</th>
        </tr>
        <!-- forEach 문을 활용하여 shop list 보여주기 -->
        <c:forEach var="s" items="${shoplist }">
        <tr>
            <!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
            <td>${s.shopid}</td>
            <td><img src="img/${s.img1 }"></td>
            <td><a href="shop_detail.mc?shopid=${s.shopid }">${s.shopname}</a></td>
            <td>${s.userid}</td>
            <td>${s.cnt}</td>
        </tr>
        </c:forEach>
</table>
