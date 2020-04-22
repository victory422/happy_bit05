
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="../includes/topbar.jsp"%>
<%@ include file="../includes/middle.jsp"%>
	
	
<style>
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}
.course-text {margin-bottom:30px;}
.input-group-prepend {width:80px;}
</style>
<!-- 	-------------------------------------------------------------------------------------->	

	<!-- ck에디터 -->
	<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	
<!-- 	-------------------------------------------------------------------------------------->	
<!-- 지도 부분 -->
 	<div class="container">
 	
 	<form:form name="update" action="" method="post" enctype="multipart/form-data">
	
		<h3 class="pb-4 mb-4 font-italic border-bottom" style="margin-top:50px"><font style="vertical-align: inherit; font-weight:bold;"><font style="vertical-align: inherit;">
	       	 코스 등록
	      </font></font></h3>
		<br>
		
		<div class="row justify-content-center">
		
			<div id="map" class="col-8" style="width:500px;height:500px;"></div>
		
		
		<div class="col-4" id="mapText">
			<div class="p-4">
			<h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 거리 : <span id="distance" name="distance">${lc_get.lc_distance } km</span>
	       	 <input type="hidden" id="lc_distance" name="lc_distance"/>
	     	 </font></font></h3>
	     	 </div>
	   		<br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 도보 시간 : <span id="run" name="run">${lc_get.lc_run }</span>
	       	 <input type="hidden" id="lc_run" name="lc_run"/>
	      </font></font></h3>
	      </div>
	      <br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	자전거 시간 : <span id="cycle" name="cycle">${lc_get.lc_cycle }</span>
	       	<input type="hidden" id="lc_cycle" name="lc_cycle"/>
	      </font></font></h3>
	      </div>
	      <br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 출발지 : <span id="address" name="address">${lc_get.lc_address }</span>
	       	 <input type="hidden" id="lc_address" name="lc_address"/>
	      </font></font></h3>
	      </div>
	      <br>
	    </div>
	    </div>
	    
	    <h3 class="pb-4 mb-4 font-italic border-bottom" style="margin-top:50px"><font style="vertical-align: inherit; font-weight:bold;"><font style="vertical-align: inherit;">
	       	 상세 정보
	      </font></font></h3>
		<br>
		
		<div class="row justify-content-left">
		
		<ul class="list-unstyled" style="margin-left:30px;">
			<li class="course-text">
					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">제목</font></h5>    
						</div>
						<input type="text" class="form-control" id="lc_title" name="lc_title" placeholder="제목을 입력해주세요." value="${lc_get.lc_title }">
					</div>
			</li>
			
			<li class="course-text">
					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">게시판</font></h5>    
						</div>
						<select class="custom-select d-block w-15" id="lc_type" name="lc_type">
						 <option value="육상"
						 	<c:out value="${lc_get.lc_type eq '육상' ? 'selected':''}"/>>육상</option>
						 <option value="자전거"
						 	<c:out value="${lc_get.lc_type eq '육상' ? 'selected':''}"/>>자전거</option>
						</select>
					</div>
			</li>
			
			<li class="course-text">
					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">지역</font></h5>    
						</div>
						
						<div class="col-md-2" style="margin-left:-15px;">
						<text class="form-control" id="area1" name="area1" readonly>${lc_get.lc_area1 }</text>
						<input type="hidden" id="lc_area1" name="lc_area1" value="${lc_get.lc_area1 }"/>
						</div>
						
						<div class="col-md-2">
						<text class="form-control" id="area2" name="area2" readonly>${lc_get.lc_area2 }</text>
						<input type="hidden" id="lc_area2" name="lc_area2" value="${lc_get.lc_area2 }"/>
						</div>
						
						<div class="col-md-2">
						<text class="form-control" id="area3" name="area3" readonly>${lc_get.lc_area3 }</text>
						<input type="hidden" id="lc_area3" name="lc_area3" value="${lc_get.lc_area3 }"/>
						</div>
					</div>
			</li>
		
			
			<li class="course-text">

					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">썸네일</font></h5>    
						</div>
						<div class="custom-file">
                 		 &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1" name="lc_thumbnail" value="${lc_get.lc_thumbnail }">
             			</div>
					</div>
			</li>
				
			<li class="course-text">
					
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">내용</font></h5>    
						</div>
							<textarea class="textarea" name="lc_text" id="lc_text">${lc_get.lc_text }</textarea>
							<script type="text/javascript">
								CKEDITOR.replace('lc_text');
							</script>
						</div>
					</div>
			</li>
				
			</ul>
		</div>
		
		<input type="submit" value="업로드" />
		
		<input type="text" id="lc_xy_arr" name="lc_xy_arr"/>
		</form:form>
		
	</div>
	
	
	
<!-- 	-------------------------------------------------------------------------------------->	
<!-- 스크립트 부분 -->
<!-- 스크립트 부분 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12678188621fb459c68a7473a7071d75&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
	
	<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = xy_arr[0], // 위도
	            lon = xy_arr[1]; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
	        
	    	 // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition); 
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMarker(locPosition, message);
	}
	
	
	//점찍는 함수
	function displayCircleDot(position) {

	    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	    var circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });

	    // 지도에 표시합니다
	    circleOverlay.setMap(map);
	}
	
	
	// 선긋는 부분.
	var xy = "${lc_get.lc_xy_arr}";
	var xy_arr = xy.split(',');

	var linePath = [];
	
	for(var i = 0; i < xy_arr.length; i++){
		if(i % 2 != 0){
			xy_arr[i] = xy_arr[i].substring(1, xy_arr[i].length-1);
		}
		else{
			xy_arr[i] = xy_arr[i].substring(1, xy_arr[i].length);
		}
		
		console.log(xy_arr[i]);
	}
	
	for(var i = 0; i < xy_arr.length; i+=2){
		linePath.push(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
		 displayCircleDot(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
	}
	
	for(var i = 0; i < linePath.length; i++){
		console.log(linePath[i]);
	}
	
	// 지도에 표시할 선을 생성합니다
	var polyline = new kakao.maps.Polyline({
	    path: linePath, // 선을 구성하는 좌표배열 입니다
	    strokeWeight: 7, // 선의 두께 입니다
	    strokeColor: '#db4040', // 선의 색깔입니다
	    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid' // 선의 스타일입니다
	});

	// 지도에 선을 표시합니다 
	polyline.setMap(map);  
		

	//마커 표시하기.
	var positions = [
	    {
	        title: '출발', 
	        latlng: new kakao.maps.LatLng(xy_arr[0], xy_arr[1])
	    },
	    {
	        title: '도착', 
	        latlng: new kakao.maps.LatLng(xy_arr[xy_arr.length-2], xy_arr[xy_arr.length-1])
	    }
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    if(i == 1){
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
	    }else{
	    	var marker = new kakao.maps.Marker({
	    		position: positions[i].latlng
	    	});
	    	
	    	marker.setMap(map);
	    }
	}
	
		
		
		
	</script>
	
	
<!-- 	-------------------------------------------------------------------------------------->	


<%@ include file="../includes/footer.jsp"%>