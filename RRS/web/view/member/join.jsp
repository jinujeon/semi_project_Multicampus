<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="center">
<style>
input[type=text], input[type=password]{
	width: 20%;
	height:50px;
	padding: 10px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-weight:BOLD;
}
</style>
<h1>회원가입</h1>
<form action="joinimpl.mc" method="post">
&nbspID&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="text" name="userid"><br>
&nbspPWD&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input type="password" name="userpwd"><br>
&nbspNAME&nbsp&nbsp&nbsp&nbsp<input type="text" name="username"><br>
&nbspPHONENUMBER<input type="text" name="userphonenumber"><br>
&nbspNICKNAME&nbsp&nbsp<input type="text" name="nickname"><br>
<input type="hidden" name="admincheck" value=0><br>
<input type="submit" name="REGISTER" value="가입하기"><br>
</form>
</div>