<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>

section { /* 화면전체 배경설정 */
   background: #F3F0F0;
}

/*shop_regist css*/
#registdiv {
   width: 70%;
   height: 500px;
   overflow: auto;
   background: white;
}

#registdivin {
   width: 95%;
   hight: auto;
   background: white;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin: 0 auto;
   text-align: center;
}

#registtext {	/* 당신의 맛집을 등록하세요 꾸미기 */
	width: 100%;
	height: 50px;
	border-bottom: 3px solid #cbcbcb;
	left: 0px;
	text-align: center;
	font-size:1.5em;  
	font-weight:900;
	text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.44);
}

/*input type css*/
input[type=text] {
	width: 80%;
	padding: 10px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-weight: BOLD;
	font-size: 17px;
	text-align: center;
}

input[type=file] {
	width: 80%;
	padding: 10px 10px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-weight: BOLD;
	font-size: 14px;
	text-align: center;
}

input[type=submit] {
	width: 10%;
	padding: 5px 5px;
	margin: 5px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	font-weight: BOLD;
	font-size: 13px;
	text-align: center;
}

/*shop_regist table css*/
.srname, .srnum, .sradd, .srcon, .srpt {
	width: 30%;
	height: 50px;
	text-align: center;
	font-size: 18px;
	font-weight: BOLD;
	background: #F3F0F0;
	border-bottom: 1px solid #cbcbcb;
}
</style>

<html>
<head>
<meta charset="UTF-8">

</head>
<body>

	<section id="shopreg">
		<!-- 맛집 등록 화면 -->
		<p class="gap1"></p>
		<div id="registdiv">
			<br>
			<div id="registdivin">
				<h1 id="registtext">당신의 맛집을 등록하세요!</h1>
				<form enctype="multipart/form-data" name="bdto" method="post"
					action="shop_registimpl.mc">
					<table id="srtable">
						<tr>
							<td class="srname">이름</td>
							<td><input type="text" name="shopname" id="shopname"
								maxlength="50" placeholder="가게 이름 입력"></td>
						</tr>
						<tr>
							<td class="srnum">번호</td>
							<td><input type="text" name="shopphonenumber"
								id="shopphonenumber" maxlength="50" placeholder="가게 번호 입력"></td>
						</tr>
						<tr>
							<td class="sradd">주소</td>
							<td><input type="text" name="address" id="address"
								maxlength="50" placeholder="가게 주소 입력"></td>
						</tr>
						<tr>
							<td class="srcon">내용</td>
							<td><textarea name="info" id="info" rows="8" cols="80" style="width:80%;"
									placeholder="글 내용 입력"></textarea></td>
						</tr>
						<tr>
							<td class="srpt">사진</td>
							<td><input type="file" name="mf"></td>
						</tr>
					</table>

					<div id="srsub">
						<input type="submit" value="등록">
					</div>
						<input type="hidden" name="userid" value="${loginuser.userid}">
				</form>
			</div>
		</div>
		<p class="gap1"></p>
	</section>
</body>
</html>