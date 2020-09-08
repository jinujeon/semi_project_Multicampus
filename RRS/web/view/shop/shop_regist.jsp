<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
nav {
   width:100%;
   height:50px;
   border-bottom: 3px solid #cbcbcb;
   left:0px;
   text-align:center;
}
#shopreg {
   text-align:center;
   margin: 0 auto;
}
input[type=text]{
   width: 70%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight:BOLD;
}

input[type=file]{
   width: 30%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight:BOLD;
}
input[type=submit] {
   width: 10%;
   padding: 5px 5px;
   margin: 5px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
   font-weight: BOLD;
   font-size: 18px;
   text-align: center;
}
</style>
</head>
<body>
<nav>
    <h2>당신의 맛집을 등록하세요!</h2>
 </nav>
 <div id="shopreg">
    <form enctype="multipart/form-data" name="bdto" method="post" action="shop_registimpl.mc">
       <%-- <input type="hidden" name="userid" value="${member.userid  }"> --%>
 <input type="hidden" name="userid" value="${loginuser.userid}">
        <div> 이름 <input name="shopname" id="shopname" size="80" placeholder="가게 이름 입력"></div>
        <div> 번호 <input name="shopphonenumber" id="shopphonenumber" size="80" placeholder="가게 번호 입력"></div>
        <div> 주소 <input name="address" id="address" size="80" placeholder="가게 주소 입력(정확한 주소를 입력하세요)"></div><br>
        <!-- <div>지역<select name="locate" id="locate">
           <option value="gangnam">강남구</option>
           <option value="songpa">송파구</option>
           <option value="jung">중구</option>
        </select></div> -->
        <div> 내용 <textarea name="info" id="info" rows="8" cols="80" placeholder="글 내용 입력"></textarea></div>
        <div> 사진 <input type="file" name="mf">
        <input type="submit" value="등록"></div>
        <div style="width:650px; text-align:center;">
        </div>
    </form>
    </div>
</body>
</html>