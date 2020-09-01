<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	#center > h3 > img{
		width:50px;
	}
</style>

<div id="center">
<h1>Select All Page</h1>
<c:forEach var="s" items="${shoplist }">
<h3><img src="img/${s.img }"><a href="shopdetail.mc?id=${s.id }"> ${s.id }  ${s.name}  ${s.price }  ${s.regdate } </a></h3>
</c:forEach>

</div>
