<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="center">
	<h1>User Detail Page</h1>
	<h2>${userdetail.id }</h2>
	<h2>${userdetail.pwd }</h2>
	<h2>${userdetail.name }</h2>
	<h3><a href="userdelete.mc?id=${userdetail.id }">DELETE</a></h3>
	<h3><a href="userupdate.mc?id=${userdetail.id }">UPDATE</a></h3>
</div>