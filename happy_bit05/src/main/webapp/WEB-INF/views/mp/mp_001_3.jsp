<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<title>My course</title>

<style>
.redfamily {
	color: red;
}

.search-box, .close-icon, .search-wrapper {
	position: relative;
	padding: 10px;
}

.search-wrapper {
	width: 500px;
	margin: auto;
	margin-top: 50px;
}

.search-box {
	width: 80%;
	border: 1px solid #ccc;
	outline: 0;
	border-radius: 15px;
}

.search-box:focus {
	box-shadow: 0 0 15px 5px #b0e0ee;
	border: 2px solid #bebede;
}

.close-icon {
	border: 1px solid transparent;
	background-color: transparent;
	display: inline-block;
	vertical-align: middle;
	outline: 0;
	cursor: pointer;
}

.close-icon:after {
	content: "X";
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	background-color: #FA9595;
	z-index: 1;
	right: 35px;
	top: 0;
	bottom: 0;
	margin: auto;
	padding: 2px;
	border-radius: 50%;
	text-align: center;
	color: white;
	font-weight: normal;
	font-size: 12px;
	box-shadow: 0 0 2px #E50F0F;
	cursor: pointer;
}

.search-box:not (:valid ) ~ .close-icon {
	display: none;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<script type="text/javascript" 
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12678188621fb459c68a7473a7071d75&libraries=services">
		</script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing">
	</script>

</head>
<body>
	<div class="container">

		<div style="margin-top: 30px;">
			<h1>My Course</h1>
		</div>

		<!-- 체크박스 부분 -->

		<form method="get" action="/mp/myCourse/">
		
			<div class="input-group mb-12" style="margin-top: 30px;">
				<label class="input-group-text col-sm-12"> 
					<select id="cate_id" name="cate_id"
						class="custom-select custom-select-sm-1"
						style="margin-left: 10px; width: 25%">
							<option selected>카테고리</option>
							<option value="null">육상</option>
							<option value="null">자전거</option>
					</select> 
					<input type="text" style="margin-left: 10px; width: 50%" id=""
						name="" class="search-box form-control"
						placeholder="Enter search word" /> 
					<input type="submit" value="search" />
				</label>
			</div>
		</form>


		<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive" id="myCourse">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr class="active"
					style="font-weight: bold; background-color: #e9ecef;">
					<td>No</td>
					<td>제목</td>
					<td>종목</td>
					<td>거리</td>
					<td>도보</td>
					<td>자전거</td>
					<td>지역</td>
					<td>추천</td>
					<td>등록일</td>
					<td>원글</td>


				</tr>
				<c:if test="${empty listVO }">
							${"등록된 관심코스가 없습니다."}
							
				</c:if>
				<tbody id="">

					<c:forEach var="val" items="${listVO }" varStatus="status">


						<tr id="corseDetail" class="success" 
							onclick="downPage('${val.rn}','${val.lc_type}','${val.lc_title}',
							'${val.m_index}','${val.lc_distance}','${val.lc_record}',
							'${val.lc_date}','${val.lc_index}','${val.lc_xy_arr}')">

							<td>${val.rn}</td>
							<td>${val.lc_title}</td>
							<td>${val.lc_type}</td>
							<td>${val.lc_distance}</td>
							<td>${val.lc_run}</td>
							<td>${val.lc_cycle}</td>
							<td>${val.lc_address}</td>
							<td>${val.lc_good}</td>
							<td>${val.lc_date}</td>
							<td>
								<button
									onclick="location.href='/lc/003/lc_get?lc_index=${val.lc_index}'">
									보기
								</button>
							</td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

			<div id="row">

				<!-- 페이징  -->
				<div class="col-md-6">
					<ul class="pagination justify-content-end">
						<c:if test="${pageUtil.prev }">
							<li class="page-item">
								<a class="page-link" href="/mp/myCourse?page=${pageUtil.start-1}">
									Previous
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }"
							var="pNum">
							<div class="mb-4" id="accordion" role="tablist"
								aria-multiselectable="true"></div>
							<li class="page-item ${pNum==pageUtil.dto.page?'active':''}">
								<a class="page-link" href="/mp/myCourse?page=${pNum}">
									${pNum}
								</a>
							</li>
							
						</c:forEach>
						<c:if test="${pageUtil.next }">
							<li class="page-item">
								<a class="page-link" href="/mp/myCourse?page=${pageUtil.end+1 }">
									Next
								</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
			
			<div id="detailBody" class="card-body" style="display:none">
				<div class="row" style="margin-top: 50px; margin-bottom: 50px;">
				<!--  Map loading -->
					<div id="map" class="col-md-4" style="width:400px;height:400px;">
					</div>
				
					<div class="col-md-8">
						<div class="card h-100">

							<table class="table table-hover"
								style="margin-top: 0px; background-color: #343a40;">
								<tr class="active" style="font-weight: bold; color: white;">
									<td>No</td>
									<td>종목</td>
									<td>제목</td>
									<td>거리</td>
									<td>평균기록</td>
									<td>등록일</td>
								</tr>

								<tr id="tdText" class="active" style="color: white;">


								</tr>

							</table>

							<!--==========================하단 상세페이지=============================-->
							<div class="table-responsive">
								<table class="table table-hover" style="margin-top: 2px;">
									<tr class="active"
										style="font-weight: bold; background-color: #e9ecef;">
										<td>No</td>
										<td>일자</td>
										<td>기록</td>
										<td>증감</td>
										<td>게시여부</td>

									</tr>
									<tbody id="detail">
										<!-- ajax 데이터 -->
									</tbody>

								</table>

								<div id="row">

									<!-- 페이징  -->
									<div class="col-md-6" id="ajaxPaging">
										
									</div>
								</div>
							</div>
							<!--=======================================================-->
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

<script>

	var lc_map = "";
	function downPage(rn, lc_type, lc_title, m_index, lc_distance, lc_record, lc_date,
			lc_index,lc_xy_arr) {
				document.getElementById('detailBody').style.display ="block";
				lc_map = lc_xy_arr;		
	
		    	var td = "";
				td += '<td>' + rn + '</td>';
				td += '<td>' + lc_type + '</td>';
				td += '<td>' + lc_title + '</td>';
				td += '<td>' + lc_distance + '</td>';
				td += '<td>' + lc_record + '</td>';
				td += '<td>' + lc_date + '</td>';
				$("#tdText").html(td);
			

		
	
//맵 사용하기
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
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
	var xy = lc_map;
	var xy_arr = xy.split(',');

	var linePath = [];
	
	for(var i = 0; i < xy_arr.length; i++){
		if(i % 2 != 0){
			xy_arr[i] = xy_arr[i].substring(1, xy_arr[i].length-1);
		}
		else{
			xy_arr[i] = xy_arr[i].substring(1, xy_arr[i].length);
		}
		
		//console.log(xy_arr[i]);
	}
	
	for(var i = 0; i < xy_arr.length; i+=2){
		linePath.push(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
		 displayCircleDot(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
	}
	
	//for(var i = 0; i < linePath.length; i++){
	//	console.log(linePath[i]);
	//}
	
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
//맵 끝

ajaxPage(lc_index, m_index, 1);
	} //downPage 끝
	

	function ajaxPage(courseIndex, memberIndex, pageNumber) {
		
        //스크롤 고정
        var offset = $("#ajaxPaging").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
        
		var lc_index = courseIndex;
		var m_index = memberIndex;
		var pageNum = pageNumber;
	console.log("lc_index : "+lc_index);
	console.log("m_index : "+m_index);
	console.log("page : "+pageNum);
	$.ajax({ 
	    type : "POST",  
	    url : "/mp/myCourse/detail",  
	    data : { "lc_index" :lc_index, 
	    		 "m_index" : sessionStorage.getItem("sessionScript"),
	    		 "page" : pageNum},
	    dataType : "json",
	    success : function(data){
	    	
	    	var td = "";
	    	
	        for(i=0; i<data.length-1; i++) {
			    	console.log("console data rn : "+data[i]['RN']);
			    	console.log("console data pr_recorddate: "+data[i]['PR_RECORDDATE']);
			    	console.log("console data pr_record : "+data[i]['PR_RECORD']);
			    	
			    	td += '<tr class="success">';
					td += '<td>' + data[i]['RN'] + '</td>';
					td += '<td>' + data[i]["PR_RECORDDATE"] + '</td>';
					td += '<td>' + data[i]["PR_RECORD"] + '</td>';
					td += '<td>' + 0 + '</td>';
					td += '<td>';
					td += '<button onclick="location.href=\'/lc/003/lc_get?lc_index='+lc_index+'\'">view';
					td +=  '</button></td>';
					td += '</tr>';
	        }
	
	        $("#detail").html(td);
	    	
	    	var j = data.length-1; // 마지막 length는 페이지정보
	        var prev = data[j]['prev'];
	        var next = data[j]['next'];
	        var start = data[j]['start']*1;
	        var end = data[j]['end']*1;
	        page = data[j]['page']*1;
	        var paging = '';
	        console.log("page : "+page, "prev: "+prev, "next: "+next, "start: "+start, "end :"+end);
	        paging += '<ul class="pagination justify-content-end">';
	        if(prev == 'true') {
	            paging += '<li class="page-item">';
	            paging += '<a class="page-link" href="/mp/myCourse'+ (-1+start) +'">Previous</a>';
	            paging += '</li>';
	        }
	        for(var pNum = start; pNum <= end; pNum++) {
				console.log(pNum==page);
	        	if(pNum==page) {
	            	paging += '<li class="page-item active">';
	        	}else paging += '<li class="page-item ">';
	        	paging += '<a class="page-link" onclick=\"ajaxPage('+lc_index+', '+m_index+', '+page+')\">';
	        	paging += pNum;
	        	page = pNum;
	        	paging += '</a>';
	        	paging += '</li>';
	        }
	        
	        if(next == 'true') {
	        	paging += '<li class="page-item">';
	        	paging += '<a class="page-link" href="/mp/myCourse/detail'+ (1+end) +'">';
	        	paging += 'Next';
	        	paging += '</a>';
	        	paging += '</li>';
	        }
	        paging += '</ul>';
	        console.log(paging);
	        $("#ajaxPaging").html(paging);
	        

	    },  
	
	    error:function(xhr,status,error,data){ //ajax 오류인경우  
	            alert("error\nxhr : " + xhr + ", status : " + status + ", error : " + error+ ", data : " + data); 
	    }  
	});
}
	
</script>


	<%@ include file="../includes/footer.jsp"%>