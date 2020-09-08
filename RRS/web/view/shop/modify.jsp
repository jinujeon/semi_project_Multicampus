<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
section { /* 화면전체 배경설정 */
	background: #F3F0F0;
}

/*shop_regist css*/
#modifydiv {
	width: 70%;
	height: 500px;
	overflow: auto;
	background: white;
}

#modifydivin {
	width: 95%;
	hight: auto;
	background: white;
	border: 1px solid #ccc;
	box-sizing: border-box;
	margin: 0 auto;
	text-align: center;
}

#modifytext { /* 당신의 맛집을 등록하세요 꾸미기 */
	width: 100%;
	height: 50px;
	border-bottom: 3px solid #cbcbcb;
	left: 0px;
	text-align: center;
	font-size: 1.5em;
	font-weight: 900;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.44);
}

/*input type css*/
input[type=submit] {
	width: 15%;
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
/*shop_regist table css*/
</style>
<head>
<meta charset="UTF-8">

</head>
<body>

	<section id="shopupdate">
		<!-- 맛집 등록 화면 -->
		<p class="gap1"></p>
		<div id="modifydiv">
			<br>
			<div id="modifydivin">
				<h1 id="modifytext">맛집 정보 수정</h1>
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
					<input type="hidden" name="img1" value="${dbshop.img1 }"> <input
						type="hidden" name="img2" value="${dbshop.img2 }"> <input
						type="hidden" name="img3" value="${dbshop.img3 }">
					<div>
						<input type="submit" value="UPDATE">
					</div>
				</form>
			</div>
		</div>
		<p class="gap1"></p>
	</section>
</body>
</html>