<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2348a50ce2bdcf2f6cf00ff8ad5e426d"></script>
<style>
#map {
	width: 800px;
	height: 400px;
	border: 2px solid blue;
}

section {
	width: 95%;
	height: auto;
	padding: 10px 0;
	background: #cbcbcb;
}

section>#first {
	width: 100%;
	height: 300px;
	background: white;
}

section>#second {
	width: 100%;
	height: 500px;
	overflow: auto;
	background: white;
}
      /*댓글 리스트 CSS START*/
#commentdetails {
   width:95%;
   hight:auto;
   background:white;
   border: 1px solid #ccc;
   box-sizing: border-box;
   margin: 0 auto;
   text-align:center;
}

#commentdetails > h2{
   float : left;
}

#commentdetails > #comment_table{
   width:70%;
   border-collapse:collapse;
   border-right:none;
   border-left:none;
   border-bottom:none;
   margin:0 auto;
   font-size:20px;
   overflow:auto;
}

.no, .wr, .pt, .we {
   width:10%;
   height:40px;
}
.con {
   width:60%;
   height:40px;
}
      /*댓글 리스트 CSS END*/
      
section>#third {
	width: 100%;
	height: 300px;
	overflow: auto;
	background: white;
}

.gap1 {
	height: 15px;
	clear: both;
	overflow: hidden;
	display: block;
}
</style>

<script>
/* ----------------------------------------------------------------------------------------- */
/*                                     주소 검색 시스템                                                                               */
/* ----------------------------------------------------------------------------------------- */
var latiA = new Array();
var longiA = new Array();
var latiK = new Array();
var longiK = new Array();
var latiS = new Array();
var longiS = new Array();
var sw = 0;
var arrs = null; // 샵 json
var arrs2 = null; // 추천 json
var arrsA = null; // 지도리스트 json
var arrsK = null; // 키워드리스트 json

	
//검색데이터 표시 및 지도표시 가능하게 위도경도 형태 변환(주소로 검색)
function display(data) {
	
	$(data.documents).each(
			function(index, add) {
				var result = '';
				result += '<h4>' + "주소 : " + add.address_name + '<br>' + "x : " + add.x + '<br>' 
				          + "y : "+ add.y + '</h4>';
				$('#result').append(result);
				
				$('button').eq(index).append(add.address_name+' '+add.x+' '+add.y);
				
				var latit = parseFloat((parseFloat(add.x)).toFixed(6));
				var longit = parseFloat((parseFloat(add.y)).toFixed(6));
				
				latiA[index] = latit;
				longiA[index] = longit;
				
			}
	);
	//결과값이 없으면 스위치를 1로하고 키워드로 표시
	 if(typeof latiA[0] == "undefined"){
		 sw = 1;
	 }
};
//검색데이터 표시 및 지도표시 가능하게 위도경도 형태 변환(키워드로 검색)
function display2(data) {
 	if(sw==1){
		$(data.documents).each(
				function(index, add) {
					var result = '';
					result += '<h4>' + "키워드 : " + add.place_name + '<br>' + "x : " + add.x + '<br>' 
					          + "y : "+ add.y + '</h4>';
					$('#result').append(result);
							
					var latit = parseFloat((parseFloat(add.x)).toFixed(6));
					var longit = parseFloat((parseFloat(add.y)).toFixed(6));
					
					latiK[index] = latit;
					longiK[index] = longit;
	
				}
		);
 	}
};
// 추천정보 표시
function display3(data) {
		$(data.documents).each(
				function(index, add) {
					var result = '';
					result += '<h4>' + "키워드 : " + add.place_name + '<br>' + "x : " + add.x + '<br>' 
					          + "y : "+ add.y + '</h4>';
					$('#result').append(result);
							
					var latit = parseFloat((parseFloat(add.x)).toFixed(6));
					var longit = parseFloat((parseFloat(add.y)).toFixed(6));
					
					latiK[index] = latit;
					longiK[index] = longit;
	
				}
		);
};
//주소 및 키워드 검색시  데이터 가져오기
function getData() {
//주소검색
		$.ajax({
					method : 'GET',
					url : 'https://dapi.kakao.com/v2/local/search/address.json',
					async : false,
					headers : {
						'Authorization' : 'KakaoAK 8bb4664642b1184f894533fe7edb0245'
					},
					data : {
						'query' : '${address}',
						'page' : 1,
						'AddressSize' : 3
					},
					success : function(data) {
						display(data);
						arrsA = data;
					},
					error : function() {
						alert('error');
					}
				});
		
//키워드검색		
		$.ajax({
					method : 'GET',
					url : 'https://dapi.kakao.com/v2/local/search/keyword.json',
					async : false,
					headers : {
						'Authorization' : 'KakaoAK 8bb4664642b1184f894533fe7edb0245'
					},
					data : {
						'query' : '${address}',
						'page' : 1,
						'size' : 3
					},
					success : function(data) {
						display2(data);
						arrsK = data;
					},
					error : function() {
						alert('error2');
					}
			});
};
// 샵의 정보를 받아오는 테스트 함수
function getshopdata() {
	$.ajax({
		url : 'getshopdata.mc',
		async : false,
		success : function(result) {
			arrs = result;
			
			for(i=0; i<result.length; i++){
				var shopname = result[i].shopname;
				var shopid = result[i].shopid;
				var lat = result[i].lat;
				var lon = result[i].lon;
				var shopphonenumber = result[i].shopphonenumber;
				var resulthtml = '';
				resulthtml += shopname +' ' + shopid + ' ' + lat + ' ' + lon + ' ' + shopphonenumber + '<br>';
							
				var latiS = parseFloat((parseFloat(result[i].lat)).toFixed(6));
				var longiS = parseFloat((parseFloat(result[i].lon)).toFixed(6));
				$('#result2').append(i+' : '+resulthtml);
			}    
		},
		error : function() {
			alert('Error3');
		}
	});
	return arrs;
};
//샵의 추천 정보를 받아오는 테스트 함수
function getshopdata2() {
	$.ajax({
		url : 'getshopdata2.mc',
		async : false,
		success : function(result) {
			arrs2 = result;
			for(i=0; i<result.length; i++){
				var shopid = result[i].shopid;
				var up = result[i].up;
				var down = result[i].down;
				var resulthtml = '';
				resulthtml += shopid + ' ' + up + ' ' + down + '<br>';
				$('#result2').append(resulthtml);
			}    	
		},
		error : function() {
			alert('Error4');
		}
	});
	return arrs2;
};
/* ----------------------------------------------------------------------------------------- */
/*                                     검색 시 지도 시스템                                                                               */
/* ----------------------------------------------------------------------------------------- */
var map = null;
//지도 표시 시작
function mapDislapy() {
	var container = document.getElementById('map');
	var options = {
		center : new kakao.maps.LatLng(37.549530, 126.989045),
		level : 9
	};
	map = new kakao.maps.Map(container, options);
};
//지점 포인트 지도에 표시
function setMarkers(arrs,arrs2) {
	$(arrs).each(
					function(index, shop) {
						var marker = new kakao.maps.Marker({
							title : shop.shopname,
							position : new kakao.maps.LatLng(shop.lat,
									shop.lon)
						});
						marker.setMap(map);
						var iwContent = '<div style="padding:5px; width:100px; font-size:small;"><a href="shop_detail.mc?shopid='+shop.shopid+'" style="color:blue; font-size:large;" target="_blank">' + shop.shopname + '</a>'+ ' 추천수(' + arrs2[index].up + ')' + '<br>'+shop.shopphonenumber+'</div>' 
										,iwRemoveable = true;
						var infowindow = new kakao.maps.InfoWindow({
							content : iwContent,
							removable : iwRemoveable
						});
						kakao.maps.event.addListener(marker, 'click',
								function() {
									infowindow.open(map, marker);
								});
				});
};
//지도 위치 이동
function panTo(lat, lng) {
	var moveLatLon = new kakao.maps.LatLng(lng, lat);
	map.panTo(moveLatLon);
	setMarkers(arrs,arrs2);
}

/* ----------------------------------------------------------------------------------------- */
/*                                    shop 등록시 주소로 위도 경도 세팅                                                                              */
/* ----------------------------------------------------------------------------------------- */


function setshopxy() {

	var shopxy = {};
	
			$.ajax({
				method : 'GET',
				url : 'https://dapi.kakao.com/v2/local/search/address.json',
				async : false,
				headers : {
					'Authorization' : 'KakaoAK 8bb4664642b1184f894533fe7edb0245'
				},
				data : {
					'query' : '${registshop.address}',
					'page' : 1,
					'AddressSize' : 3
				},
				success : function(data) {
					shopxy = {x:parseFloat((parseFloat(data.documents[0].x)).toFixed(6)) , y:parseFloat((parseFloat(data.documents[0].y)).toFixed(6))};
				},
				error : function() {
					
				}
			});

			
			$.ajax({
				url: 'shopxyupdate.mc',
	 		    async : false,
				type: "POST",
				data: shopxy,				
				success : function() {
					
				},
				error : function() {

				}
			});

			
}


//여기 오류뜨면 이클립스 오류임 (정상임)
$(document).ready(function() {
	if(${registshop == null}){
		
	}else{
		setshopxy();
		alert("OK");
	}
	arrs = getshopdata(); // DB샵정보
	arrs2 = getshopdata2(); // DB샵추천정보 
	mapDislapy();
	setMarkers(arrs,arrs2);
});


</script>

<div id="center">
	<h1>당신을 위한 맛집</h1>
	<div id="map"></div>
	<section>
		<p class="gap1"></p>

		<div id="second">
			<div class="list">
				<p>차트 및 리스트</p>
			</div>
		</div>

		<p class="gap1"></p>


		<div id="third">
			<!-- 댓글리스트 div -->
			<div id="commentdetails">
				<h2>댓글</h2>
				<table id="comment_table" border="1">
					<tr>
						<th class="no">번호</th>
						<th class="wr">작성자</th>
						<th class="con">내용</th>
						<th class="pt">이미지</th>
						<th class="we">날짜</th>
					</tr>
					<!-- forEach 문을 활용하여 comment list 보여주기 -->
					<c:forEach var="c" items="${shop_comment }">
						<tr>
							<!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
							<td>${c.commentid}</td>
							<td>${c.userid}</td>
							<td>${c.commentcontents}</td>
							<td><img src="img/comment/${c.comment_img }"
								style="width: 100px; height: 100px;"></td>
							<td><fmt:formatDate value="${c.commentdate}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</section>
</div>