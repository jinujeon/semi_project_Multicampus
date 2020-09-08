<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<style>
input[type=text], input[type=password]{
	width: 20%;
	padding: 10px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-weight:BOLD;
}


</style>
<div id="center">
<h1>Login page</h1>
<form action="loginimpl.mc" method="post">
&nbsp&nbspID&nbsp&nbsp<input type="text" name="id" ><br>
PWD&nbsp<input type="password" name="pwd" ><br>
<input type="submit" value="LOGIN">
</form>
</div>