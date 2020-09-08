<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
h1 {
   text-align: center;
}
#center {
   background-color:#F3F0F0;
}
 
#center > #shopupdate{
   width:60%;
   hiegt:auto;
   background-color:white;
}

#center> #shopupdate > #updatepage {
   text-align:center;
   margin: 0 auto;
}

input[type=text] {
   width: 50%;
   padding: 10px 10px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
}

input[type=submit] {
   width: 12%;
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

<div id="center">
   <h1>Shop Update Page</h1>
<section id="shopupdate">
   <div id="updatepage">
      <form enctype="multipart/form-data" action="shopupdateimpl.mc"
         method="post">
         <br>
         <div>
            가게 이름 : <input type="text" name="shopname"
               value="${dbshop.shopname }"><br>
         </div>
         <div>
            가게 번호 : <input type="text" name="shopphonenumber"
               value="${dbshop.shopphonenumber }"><br>
         </div>
         <!-- 지역<select name="locate" id="locate">
           <option value="gangnam">강남구</option>
           <option value="songpa">송파구</option>
           <option value="jung">중구</option>
        </select><br>  -->
         <div>
            가게 내용 : <input type="text" name="info" value="${dbshop.info }"><br>
         </div>

         <div>
            IMG: ${dbshop.img1 }<br>
         </div>
         <div>
            NEWIMG: <input type="file" name="mf">
         </div>
         <input type="hidden" name="shopid" value="${dbshop.shopid }">
         <input type="hidden" name="userid" value="${dbshop.userid }">
         <input type="hidden" name="address" value="${dbshop.address }">
         <input type="hidden" name="img1" value="${dbshop.img1 }"> 
         <input type="hidden" name="img2" value="${dbshop.img2 }"> 
         <input type="hidden" name="img3" value="${dbshop.img3 }">
         <div>   
            <input type="submit" value="UPDATE">
         </div>
   </form>
</div>
</section>
</div>