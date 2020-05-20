<%@ include file="../includes/mobile_topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
<title>기록 업로드</title>
<style>
.align-center { text-align: center; } 
.ck.ck-deitor{ max-width: 100%;}
</style>


<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<body>
	
	<div class="container col-md-12 bg-light" style="padding:0px;">
	<form name="update" action="/mp/update" method="post" enctype="multipart/form-data">
		HOME > 코스 > ${lc_get.lc_type }
			<hr/>

		<div class="row justify-content-center col-12" style="margin:auto;">
			<div class="w-100"></div>
			<div class = "col-12" style="margin-bottom:30px;">
				<c:choose>
					<c:when test="${lc_get.lc_type eq '육상'}"><img src="../../resources/img/lc/running.png" width="60px"/></c:when>
					<c:when test="${lc_get.lc_type eq '자전거'}"><img src="../../resources/img/lc/cycle.png" width="60px"/></c:when>
				</c:choose>
				<br/>
				<div><h4><a href="/mb/lc_get?lc_index=${lc_get.lc_index }">${lc_get.lc_title }</a></h4></div>
				<br/>
				<div style="margin-bottom:50px;">
					<div style="float:left;">
						코스 작성자 : ${lc_get.m_nickname } 	| 	 코스 게시일 : ${lc_get.lc_date }
					</div>
					
					<div style="float:right;">
						코스 조회수 ${lc_get.lc_see } 코스 추천수 ${lc_get.lc_good }
					</div>
				</div>

				<hr/>
			</div>
			
				<div id="map" class="col-md-8" style="width:800px;height:500px;"></div>
			
		<div class="col-md-4" id="mapText">
			<div class="p-4">
			<h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 거리 : <span id="distance" name="distance">${lc_get.lc_distance } km</span>
	     	 </font></font></h3>
	     	 </div>
	   		<br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 출발지 : <span id="address" name="address">${lc_get.lc_address }</span>
	      </font></font></h3>
	      </div>
	      <br>
	      		   		
		   	<div class="p-4">
		      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
		       	 완주 기록 : <span id="address" name="address">${lc_get.pr_record }</span>
		      </font></font></h3>
		      </div>
		      <br>
	      
	    </div>
	    
	    <div class="w-100"><hr></div>
	    <div style="margin-top:30px;margin-bottom:30px;"></div>
	    
			
			<!-- 제목 -->
			</div>
			<div>
						<input type="text" class="form-control" id="pr_title" name="pr_title" placeholder="제목을 입력해주세요." value="${lc_get.pr_title }">
					</div>
					
			<!-- 텍스트 -->
		<div class="w-100" style="margin-top:10px;margin-bottom:10px;"><hr></div>
		<ul class="list-unstyled" style="margin-left:0px;">
			
			<li class="course-text">

					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">썸네일</font></h5>    
						</div>
						<div class="custom-file">
                 		 &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1" name="pr_thumbnail" value="">
             			</div>
					</div>
			</li>
			
			<li class="course-text">
					
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">게시글 내용</font></h5>    
						</div>
							<textarea class="textarea" name="pr_text" id="pr_text">${lc_get.pr_text }</textarea>
							<script type="text/javascript">
							
								CKEDITOR.replace('pr_text',{
									customConfig: '../../../resources/CKEditorSample/ckeditor/mconfig.js'
								});
							</script>
						</div>
					</div>
			</li>
		</ul>
		
			<button type="submit" class="btn btn-success">업로드</button>
			<!-- PR_INDEX값 컨트롤러에 넘겨줌 -->
			<input type="hidden" name="pr_index" value="${lc_get.pr_index }">
		</form>
	</div>	
</body>
<!-- =====================================================================================================================	-->	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12678188621fb459c68a7473a7071d75&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	//페이지 로딩시 댓글 목록

	var board_index = $('#board_index').val();//게시글 넘버 변수에 넣어주기

	console.log("인덱스 : ",board_index);

	var popupWidth = 600;
	var popupHeight = 450;

	var popupX = (window.screen.width / 2) - (popupWidth / 2); 
	// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
	 
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음 
	 
	
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
	
	
	//------------------------------------------------------------------------------------------
	
	</script>
	<script>
/* 	$(document).ready(function(){
		
		
		//관심코스 등록되어 있는지 검색.
		
		
	});
	 */
	</script>

</html>
