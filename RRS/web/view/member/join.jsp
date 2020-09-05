<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="center">
<h1>Register Page</h1>
<form action="joinimpl.mc" method="post">
ID<input type="text" name="userid"><br>
PWD<input type="password" name="userpwd"><br>
NAME<input type="text" name="username"><br>
PHONENUMBER<input type="text" name="userphonenumber"><br>
NICKNAME<input type="text" name="nickname"><br>
<input type="hidden" name="admincheck" value=0><br>
<input type="submit" name="REGISTER"><br>
</form>
</div>