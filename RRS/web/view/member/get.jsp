<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="center">
<h1>Select All Page</h1>
<c:forEach var="u" items="${userlist}">
	<h3><a href="userdetail.mc?id=${u.id}">${u.id} ${u.pwd } ${u.name }</a></h3>
</c:forEach>
</div>