
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/topbar.jsp"%>
<%@ include file="../includes/middle.jsp"%>

<div class="container text-center">
	<div class="row justify-content-center ">
		<div id="map" class="col-8" style="width:100%;height:350px;"></div>
		<div class="col-4">

			<c:forEach var="ma" varStatus="status" items="${list}">
			<div class="col-md-3">
				<div class="card mb-3 shadow-sm">
				<svg class="bd-placeholder-img card-img-top" width="100%" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
				<img alt="" id="thumbnail" src="data:image/jsp;base64, ${ma.lc_request}" height="200"/>
				</svg>
				<div class="card-body">
					<a class="move" href="<c:out value='${ma.lc_index}'/>">
						<p class="card-text">${ma.lc_title}</p>
					</a>
					<p class="card-text">조회수 : ${ma.lc_see}<br>추천수 : ${lc.lc_good}</p>
				</div>
				</div>
			</div>
		</c:forEach>
			
		</div>
	</div>
</div>

<input type="hidden" id="lc_area2" name="lc_area2"/>
<input type="hidden" id="lc_area3" name="lc_area3"/>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
<script>

//스크립트세션 주입
sessionStorage.setItem("sessionScript", '${sessionVO.m_index}');
console.log("홈 session : "+sessionStorage.getItem("sessionScript"));

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lng = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lng), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      //위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
        searchDetailAddrFromCoords(locPosition, function(result, status) {
            if (status === kakao.maps.services.Status.OK) {
            	var detailAddr = result[0].address.address_name;
                
                var content = '<div class="bAddr">' +
                                '<span class="title">법정동 주소정보</span>' + 
                                detailAddr + 
                            '</div>';

                var contentArr = detailAddr.split(' ');
                
                document.getElementById('lc_area2').value=contentArr[1];
	            document.getElementById('lc_area3').value=contentArr[2];
	            
	            document.getElementById('area2').innerHTML=contentArr[1];
	            document.getElementById('area3').innerHTML=contentArr[2];
            }   
        });
      
      	var lc_area2 = document.getElementById('lc_area2').value;
      	var lc_area3 = document.getElementById('lc_area3').value;
      	
      	$.ajax({
      		type: "POST",
      		async: "true",
      		url: "/ma/001/main",
      		data : {
      			lc_area2 : lc_area2,
      			lc_area3 : lc_area3
      		},
      		dataType : "text",
      		success : function(){
      			
      		},
      		error: function(){
      			
      		},
      		complete : function(){
      			
      		}
      	});
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}

function searchAddrFromCoords(coords, callback) {
    // 좌표로 행정동 주소 정보를 요청합니다
    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
}

function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

</script>


<%@ include file="../includes/footer.jsp"%>