<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>
	#center > img{
		width:300px;
		height:300px;
	}
</style>
    
<div id="center">
	<h1>Shop Detail Page</h1>
	<img src="img/${shopdetail.img }">
	<h2>${shopdetail.id }</h2>
	<h2>${shopdetail.name }</h2>
	<h2>${shopdetail.price }</h2>
	<h2>${shopdetail.regdate }</h2>
	
	<h3><a href="shopdelete.mc?id=${shopdetail.id }">DELETE</a></h3>
	<h3><a href="shopupdate.mc?id=${shopdetail.id }">UPDATE</a></h3>
</div>