
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/topbar.jsp"%>
<%@ include file="../includes/middle.jsp"%>

<div class="container text-center">
	<div class="row justify-content-center ">
		<div id="map" class="col-8" style="width:100%;height:450px;"></div>
		<div id="muteCourse" class="col-4">
			<h4>
				<div id="area2"></div>
				<div id="area3"></div>
			</h4>
			
		</div>
	</div>
</div>

<input type="text" id="lc_area2" name="lc_area2"/>
<input type="text" id="lc_area3" name="lc_area3"/>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
<script>
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
	            
	            var lc_area2 = document.getElementById('lc_area2').value;
      	      	var lc_area3 = document.getElementById('lc_area3').value;
      	        console.log(lc_area2);
            	console.log(lc_area3);
	            
	            $.ajax({
	          		type: "POST",
	          		cache: false,
	          		async: "true",
	          		url: "../ma/001/main",
	          		data : {
	          			"lc_area2" : lc_area2,
	          			"lc_area3" : lc_area3
	          		},
	          		dataType : "json",
	          		success : function(data){
	          
	          			var muteCourse = document.getElementById('muteCourse');
	          			var positions = []; //마커가 표시될 위치들.
	          			var content; //HTML 내용.
	          			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	          		    var imageSize = new kakao.maps.Size(24, 35); 
	          		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 	// 마커 이미지를 생성합니다    
	          			
	          		    //마커 생성
	          			for(var i = 0; i < data.length; i++){
	          				
	          				var split1 = data[i].lc_xy_arr.split(',');
	    					split1[0] = split1[0].substring(1 , split1[0].length);
	    					split1[1] = split1[1].substring(1, split1[1].length-1);
	    					
	    					var position = new kakao.maps.LatLng(split1[0], split1[1]);
	    					
	    					var markers = new kakao.maps.Marker({
	    						map : map,
	    						position : position,
	    						image : markerImage,
	    						clickable : true
	    					});
	    					
	    					markers.setMap(map);
	          				
		        			content += '<div class="col-md-12">';
		    				content += '<div class="card mb-3 shadow-sm">';
		    				content += '<svg class="bd-placeholder-img card-img-top" width="100%" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">';
		    				content += '<img alt="" id="thumbnail" src="data:image/jsp;base64,' + data[i].lc_request + '" height="200"/>';
		    				content += '</svg>';
		    				content += '<div class="card-body">';
		    				content += '<a class="move" href="' + data[i].lc_index + '">';
		    				content += '<p class="card-text">' + data[i].lc_title + '</p>';
		    				content += '</a>';
		    				content += '<p class="card-text">조회수 : ' + data[i].lc_see + '<br>추천수 : ' + data[i].lc_good + '</p>';
		    				content += '</div></div></div>';
	          			}
	          			
	    				muteCourse.innerHTML = content;
	    					
	          		},
	          		error: function(request, status, error){
	    				 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    				 console.log('error:'+error);
	          		},
	          		complete : function(){
	          			
	          		}
	          	});
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