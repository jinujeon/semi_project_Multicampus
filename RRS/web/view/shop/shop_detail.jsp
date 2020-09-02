<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<style>
	#center > img{
		width:300px;
		height:300px;
	}
</style>
    
<div id="center">
	<h1>${shopdetail.shopname }</h1>
	<img src="img/${shopdetail.img1 }">
	<h2>${shopdetail.address }</h2>
	<h2>${shopdetail.shopphonenumber }</h2>
	<h2>${shopdetail.shopdate }</h2>
	<h2>${shopdetail.cnt }</h2>
	
	<h3><a href="shopdelete.mc?id=${shopdetail.shopid }">DELETE</a></h3>
	<h3><a href="shopupdate.mc?id=${shopdetail.shopid }">UPDATE</a></h3>
</div>