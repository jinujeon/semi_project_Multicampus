<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="center">
<h1>Shop Update Page</h1>
<form enctype="multipart/form-data" action="shopupdateimpl.mc" method="post">
<br>
가게 이름 : <input type="text" name="shopname" value="${dbshop.shopname }"><br>
가게 번호 : <input name="shopphonenumber" value="${dbshop.shopphonenumber }"><br>
가게 주소 : <input name="address" value="${dbshop.address }"><br>
<!-- 지역<select name="locate" id="locate">
           <option value="gangnam">강남구</option>
           <option value="songpa">송파구</option>
           <option value="jung">중구</option>
        </select><br>  --> 
가게 내용 : <input name="info" value="${dbshop.info }"><br>

IMG: ${dbshop.img1 }<br>
NEWIMG: <input type="file" name="mf">
<input type="hidden" name="shopid" value="${dbshop.shopid }">
<input type="hidden" name="userid" value="${dbshop.userid }">
<input type="hidden" name="img1" value="${dbshop.img1 }">
<input type="hidden" name="img2" value="${dbshop.img2 }">
<input type="hidden" name="img3" value="${dbshop.img3 }">
<input type="submit" value="UPDATE">
</form>

</div>