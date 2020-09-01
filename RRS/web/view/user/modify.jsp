<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="center">
<h1>User Update Page</h1>
<form action="userupdateimpl.mc" method="post">
ID: ${dbuser.id }<br>
PWD: <input type="text" name="pwd" value="${dbuser.pwd }"><br>
NAME: <input type="text" name="name" value="${dbuser.name }"><br>
<input type="hidden" name="id" value="${dbuser.id }">
<input type="submit" value="UPDATE">
</form>

</div>