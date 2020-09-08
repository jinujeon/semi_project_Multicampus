<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- fmt를 사용하기위한 태그 라이브러리 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2348a50ce2bdcf2f6cf00ff8ad5e426d"></script>
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
		level : 6
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
/*                                   주소에 따른 게시글 보여주는 함수                                                                               */
/* ----------------------------------------------------------------------------------------- */
 // 가게리스트 표시
function displayShop(shoplist) {
		var range = 0.035; // 입력한 주소좌표의 +-range 값으로 샵이 있는지 판별한다 
		$(shoplist).each(
				function(index, list) {
					var result = '';
					if(sw==0){
						console.log(list.shopname+'의 범위:'+ (longiA[0]+range > list.lat && longiA[0]-range < list.lat && latiA[0]+range > list.lon && latiA[0]-range < list.lon));
						if(longiA[0]+range > list.lat && longiA[0]-range < list.lat && latiA[0]+range > list.lon && latiA[0]-range < list.lon){
							result += '<tr><td>'+list.shopid+'</td><td><img src="img/'+list.img1+'"></td><td><a href="shop_detail.mc?shopid='+list.shopid+'">'+list.shopname+'</a></td><td>'+list.userid+'</td><td>'+list.cnt+'</td></tr>';
							$('table').append(result);
						}						
					}else{
						console.log(list.shopname+'의 범위:'+ (longiK[0]+range > list.lat && longiK[0]-range < list.lat && latiK[0]+range > list.lon && latiK[0]-range < list.lon));
						if(longiK[0]+range > list.lat && longiK[0]-range < list.lat && latiK[0]+range > list.lon && latiK[0]-range < list.lon){
							result += '<tr><td>'+list.shopid+'</td><td><img src="img/'+list.img1+'"></td><td><a href="shop_detail.mc?shopid='+list.shopid+'">'+list.shopname+'</a></td><td>'+list.userid+'</td><td>'+list.cnt+'</td></tr>';
							$('table').append(result);
							
						}
					}			
					
				}
		);
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
					console.log(data);
				},
				error : function() {
					alert('error_shopxy');
				}
			});

/*			
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
			
*/			
}
 
//--------------------------------------------------
$(document).ready(function() {
	setshopxy();
	getData(); // 검색한 값으로 검색리스트 받아오기
	arrs = getshopdata(); // DB샵정보
	arrs2 = getshopdata2(); // DB샵추천정보 
	mapDislapy();
	//sw==0은 주소로 검색 else는 키워드로 검색
	if(sw==0){
		panTo(latiA[0], longiA[0]);
	}else{
		panTo(latiK[0], longiK[0]);
	}
	displayShop(arrs);
});
</script>

<!--정보확인용 테스트화면-->
<h1>${address}</h1>
<div id="result"></div>
<div id="result2">
</div>


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
<!--        <c:forEach var="s" items="${shoplist}">   -->
        <tr>
            <!-- 컨트롤러에서 넘겨준 list 모델 객체를 쓰는 방법을 잘 익혀두자 -->
<!--        <td>${s.shopid}</td>
            <td><img src="img/${s.img1 }"></td>
            <td><a href="shop_detail.mc?shopid=${s.shopid}">${s.shopname}</a></td>
            <td>${s.userid}</td>
            <td>${s.cnt}</td>
-->
      </tr>                                
<!--         </c:forEach>                             -->
</table>
