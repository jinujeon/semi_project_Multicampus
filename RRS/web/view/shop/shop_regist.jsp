<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2>shop_regist 페이지입니다.</h2>
    <form enctype="multipart/form-data" name="bdto" method="post" action="shop_registimpl.mc">
    	<%-- <input type="hidden" name="userid" value="${member.userid  }"> --%>
    	<div>유저<input name="userid" id="userid" size="80" placeholder="유저 이름 입력"></div>
        <div>이름<input name="shopname" id="shopname" size="80" placeholder="가게 이름 입력"></div>
        <div>번호<input name="shopphonenumber" id="shopphonenumber" size="80" placeholder="가게 번호 입력"></div>
        <div>주소<input name="address" id="address" size="80" placeholder="가게 주쇼 입력"></div>
        <div>지역<select name="locate" id="locate">
        	<option value="gangnam">강남구</option>
        	<option value="songpa">송파구</option>
        	<option value="jung">중구</option>
        </select></div>
        <div>내용<textarea name="info" id="info" rows="8" cols="80" placeholder="글 내용 입력"></textarea></div>
        <div>사진<input type="file" name="mf"></div>
        <div style="width:650px; text-align:center;">
            <input type="submit" value="확인">
        </div>
    </form>
</body>
</html>

