<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
.map {margin:0;}
</style>

<!-- =====================================================================================================================	-->	


	<div class="container col-md-10 bg-light" style="padding:30px;">
	
		HOME > 코스 > ${lc_get.lc_type }
			<hr/>

		<div class="row justify-content-center col-11" style="margin:auto;">
			<div class="w-100"></div>
			<div class = "col-12" style="margin-bottom:30px;">
				${lc_get.lc_type }
				<br/>
				<div><h5>${lc_get.lc_title }</h5></div>
				<br/>
				<div style="margin-bottom:50px;">
					<div style="float:left;">
						${lc_get.m_nickname } | ${lc_get.lc_date }
					</div>
					
					<div style="float:right;">
						조회수 ${lc_get.lc_see } | 댓글 | 하트 ${lc_get.lc_good }
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
	       	 도보 시간 : <span id="run" name="run">${lc_get.lc_run }</span>
	      </font></font></h3>
	      </div>
	      <br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	자전거 시간 : <span id="cycle" name="cycle">${lc_get.lc_cycle }</span>
	      </font></font></h3>
	      </div>
	      <br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 출발지 : <span id="address" name="address">${lc_get.lc_address }</span>
	      </font></font></h3>
	      </div>
	      <br>
	    </div>
	    
	    <div class="w-100"><hr></div>
	    <div style="margin-top:30px;margin-bottom:30px;"></div>
	    
		    <div class="col-11" style="margin:auto;">
			${lc_get.lc_text }
			</div>
			
		<div class="w-100" style="margin-top:30px;margin-bottom:30px;"><hr></div>
		
		<div class = "col-12" style="margin-bottom:30px;">
			<div style="margin-bottom:50px;">
				<div style="float:left;">
					${lc_get.m_nickname } | ${lc_get.lc_date }
				</div>
				
				<div style="float:right;">
					댓글 0 개     |    
					<a href="#">신고</a>
				</div>
			</div>
			
			<div class="w-100">
				<div style="float:left;">
					<c:if test="${member.m_index eq lc_get.m_index }">
					<form action="lc_modify?">
						<button type="submit" class="btn btn-secondary">수정하기</button>
						<input type="hidden" name="lc_index" value="${lc_get.lc_index }"/>
					</form>
					<form>
						<button type="button" class="btn btn-secondary" onclick="location.href='lc_delete?lc_index=${lc_get.lc_index}'">삭제하기</button>
					</form>
					</c:if>
					
				</div>
				
				<div style="float:right;">
					<form id='openForm' action="../002/list" method="get">
						<button type="submit" class="btn btn-secondary">목록으로</button>
 						<input type="hidden" id="lc_type" name="lc_type" value='<c:out value="${lc_get.lc_type }"/>' />
						<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'/>
						<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' />
						<input type="hidden" name="type" value='<c:out value="${cri.type }"/>' />
						<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>' />
					</form>
						<button type="button" class="btn btn-secondary">댓글</button>
				</div>
			</div>
			<br>
			<div class="w-100"></div>
			<br>
			<div class="w-100">
				<div style="float:left;">
					<button type="button" class="btn btn-secondary">블라인드</button>
					
				</div>
				
				<div id="member_menu" style="float:right;">
					<c:if test="${member ne null}">
						<button type='button' class='btn btn-secondary' id='myCourse' name='myCourse' onclick="myCourseIn()"></button>	
						<button type='button' class='btn btn-info'>좋아요</button>
					</c:if>
				</div>
			</div>
		</div>
		
		<div class="w-100" style="margin-top:30px;margin-bottom:30px;"><hr></div>
		
		<!-- 관심코스와 좋아요에 필요한 파라미터들. -->
		<input type="hidden" id="myCourse_lc_index" name="myCourse_lc_index" value='<c:out value="${lc_get.lc_index}" />'/> 	
		<input type="hidden" id="myCourse_m_index" name="myCourse_m_index" value="${member.m_index }" />
		<input type="hidden" id="empty_search" name="empty_search" value="${search}" />	
	    </div>
		
		
		
	</div>	
<!-- =====================================================================================================================	-->	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12678188621fb459c68a7473a7071d75&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	
	
	//------------------------------------------------------------------------------------------
	// 관심코스 등록.
	
	
	var lc_index = document.getElementById("myCourse_lc_index").value;
	var m_index = document.getElementById("myCourse_m_index").value;
	var myCourse = document.getElementById("myCourse");
	var member_menu = document.getElementById("member_menu");
	

	function myCourseIn(){
		
		$.ajax({
			type:'post',
			url:'/lc/003/lc_myCourse',
			data: {'m_index' : m_index,
				   'lc_index' : lc_index},
			success : function(){
				if(document.getElementById("empty_search").value == "empty"){
					console.log('test', JSON.stringify(m_index));
					myCourse.innerText = "관심 코스 해제";
					document.getElementById("empty_search").value = "not_empty";
					alert("관심코스가 추가되었습니다.");
				}else if(document.getElementById("empty_search").value == "not_empty"){
					myCourse.innerText = "관심 코스";
					document.getElementById("empty_search").value = "empty";
					alert("관심코스가 해제되었습니다.");
				}
			}
		});
	}; 
	

	</script>
	<script>
	$(document).ready(function(){
		
		
		//관심코스 등록되어 있는지 검색.
		if(m_index != null){
			
			if(document.getElementById("empty_search").value == "empty"){
				myCourse.innerText = "관심코스";
				console.log("Dddd");
							
			}else if(document.getElementById("empty_search").value == "not_empty"){
				myCourse.innerText = "관심코스 해제";		
				console.log("fffff");
			}
				
		}
		
	});
	
	</script>

<%@ include file="../includes/footer.jsp"%>