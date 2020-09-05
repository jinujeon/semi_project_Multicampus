<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=cf17c9c8b4afd46b78677c1978c8aab2"></script>
<style>
	#map {
		width: 695px;
		height: 600px;
		border: 2px solid blue;
	}
	
	img {
		width: 50px;
		height: 50px;
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
	
//검색데이터 표시(주소로 검색)
function display(data) {
	
	$(data.documents).each(
			function(index, add) {
				var result = '';
				result += '<h4>' + "주소 : " + add.address_name + '<br>' + "x : " + add.x + '<br>' 
				          + "y : "+ add.y + '</h4>';
				$('#result').append(result);
				
				
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
//검색데이터 표시(키워드로 검색)
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
						'Authorization' : 'KakaoAK ae21156b5c1ff34992c9790674153ad5'
					},
					data : {
						'query' : '${address}',
						'page' : 1,
						'AddressSize' : 3
					},
					success : function(data) {
						display(data);
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
						'Authorization' : 'KakaoAK ae21156b5c1ff34992c9790674153ad5'
					},
					data : {
						'query' : '${address}',
						'page' : 1,
						'size' : 3
					},
					success : function(data) {
						display2(data);
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
				var lat = result[i].lat;
				var lon = result[i].lon;
				var shopphonenumber = result[i].shopphonenumber;
				var resulthtml = '';
				resulthtml += shopname + ' ' + lat + ' ' + lon + ' ' + shopphonenumber + '<br>';
				$('#result2').append(resulthtml);
				var latiS = parseFloat((parseFloat(result[i].lat)).toFixed(6));
				var longiS = parseFloat((parseFloat(result[i].lon)).toFixed(6));
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
		level : 7
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
						var iwContent = '<div style="padding:5px;"><a href="#" style="color:blue; font-size: small " target="_blank">' + shop.shopname + '</a>'+ arrs2[index].up + '<br>'+shop.shopphonenumber+'</div>' 
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
//--------------------------------------------------
$(document).ready(function() {
	getData();
	arrs = getshopdata(); // 샵정보
	arrs2 = getshopdata2(); // 샵추천정보
	mapDislapy();
	//sw==0은 주소로 검색 else는 키워드로 검색
	if(sw==0){
		panTo(latiA[0], longiA[0]);
	}else{
		panTo(latiK[0], longiK[0]);
	}
});
</script>

<div id="map"></div>

<div id="center">
<h1>가게게시글</h1>
<table id="shop_table" border="1">
        <tr>
            <th>번호</th>
            <th>사진</th>
            <th>가게이름</th>
            <th>글쓴이</th>
            <th>조회수</th>
        </tr>
        <!-- forEach 문을 활용하여 shop list 보여주기 -->
        <c:forEach var="s" items="${shoplist }">
        <tr>
            <!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
            <td>${s.shopid}</td>
            <td><img src="img/${s.img1 }"></td>
            <td><a href="shop_detail.mc?shopid=${s.shopid }">${s.shopname}</a></td>
            <td>${s.userid}</td>
            <td>${s.cnt}</td>
        </tr>
        </c:forEach>
</table>
