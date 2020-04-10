<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
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
 	
 	<form name="upload" action="lc/uploadCourse" method="get">
	
		<h3 class="pb-4 mb-4 font-italic border-bottom" style="margin-top:50px"><font style="vertical-align: inherit; font-weight:bold;"><font style="vertical-align: inherit;">
	       	 코스 등록
	      </font></font></h3>
		<br>
		
		<div class="row justify-content-center">
		
			<div id="map" class="col-8" style="width:500px;height:500px;"></div>
		
		
		<div class="col-4" id="mapText">
			<div class="p-4">
			<h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 거리 : <span id="distance" name="distance"></span>
	       	 <input type="hidden" id="lc_distance" name="lc_distance"/>
	     	 </font></font></h3>
	     	 </div>
	   		<br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 도보 시간 : <span id="run" name="run"></span>
	       	 <input type="hidden" id="lc_run" name="lc_run"/>
	      </font></font></h3>
	      </div>
	      <br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	자전거 시간 : <span id="cycle" name="cycle"></span>
	       	<input type="hidden" id="lc_cycle" name="lc_cycle"/>
	      </font></font></h3>
	      </div>
	      <br>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 출발지 : <span id="address" name="address"></span>
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
						<input type="text" class="form-control" id="lc_title" name="lc_title" placeholder="제목을 입력해주세요.">
					</div>
			</li>
			
			<li class="course-text">
					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">게시판</font></h5>    
						</div>
						<select class="custom-select d-block w-15" id="lc_type" name="lc_type">
						 <option value>육상</option>
						 <option>자전거</option>
						</select>
					</div>
			</li>
			
			<li class="course-text">
					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">지역</font></h5>    
						</div>
						
						<div class="col-md-2" style="margin-left:-15px;">
						<text class="form-control" id="area1" name="area1"></text>
						<input type="hidden" id="lc_area1" name="lc_area1"/>
						</div>
						
						<div class="col-md-2">
						<text class="form-control" id="area2" name="area2"></text>
						<input type="hidden" id="lc_area2" name="lc_area2"/>
						</div>
						
						<div class="col-md-2">
						<text class="form-control" id="area3" name="area3"></text>
						<input type="hidden" id="lc_area3" name="lc_area3"/>
						</div>
					</div>
			</li>
		
			
			<li class="course-text">

					<div class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">썸네일</font></h5>    
						</div>
						<div class="custom-file">
                 		 &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1" name="lc_tumbnail">
             			</div>
					</div>
			</li>
				
			<li class="course-text">
					
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold">내용</font></h5>    
						</div>
							<textarea class="textarea" name="lc_text" id="lc_text"></textarea>
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
		</form>
		
	</div>
	
	
	
<!-- 	-------------------------------------------------------------------------------------->	
<!-- 스크립트 부분 -->
<!-- 스크립트 부분 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12678188621fb459c68a7473a7071d75&libraries=services"></script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
	
	<script>
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
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
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
		
		

		var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

		// 지도에 클릭 이벤트를 등록합니다
		// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {

		    // 마우스로 클릭한 위치입니다 
		    var clickPosition = mouseEvent.latLng;
		    

		    // 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
		    if (!drawingFlag) {
		    	
		    	//HTML에 표시되는 데이터 초기화
		    	document.getElementById('distance').innerHTML= '';
			    document.getElementById('run').innerHTML = '';
			    document.getElementById('cycle').innerHTML = '';
			    document.getElementById('address').innerHTML= '';
		    	
		    	// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다

				  searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				            /* var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : ''; */
				           var detailAddr = result[0].address.address_name;
				            
				            content = '<p class="bAddr">' +
				                            detailAddr + 
				                        '</p>';
		
				            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
				            infowindow.setContent(content);
				      		
				            var contentArr = detailAddr.split(' ');
				            
				            console.log(contentArr[0]);
				            console.log(contentArr[1]);
				            console.log(contentArr[2]);
				            
				            document.getElementById('address').innerHTML=content;
				            document.getElementById('area1').innerHTML=contentArr[0];
				            document.getElementById('area2').innerHTML=contentArr[1];
				            document.getElementById('area3').innerHTML=contentArr[2];
				            
				            document.getElementById('lc_address').value=detailAddr;
				            document.getElementById('lc_area1').value=contentArr[0];
				            document.getElementById('lc_area2').value=contentArr[1];
				            document.getElementById('lc_area3').value=contentArr[2];
				            

				        }   
				    });
				
				  function searchAddrFromCoords(coords, callback) {
					    // 좌표로 행정동 주소 정보를 요청합니다
					    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
					}
			
					function searchDetailAddrFromCoords(coords, callback) {
					    // 좌표로 법정동 상세 주소 정보를 요청합니다
					    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
					}
				
		        // 상태를 true로, 선이 그리고있는 상태로 변경합니다
		        drawingFlag = true;
		        
		        // 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
		        deleteClickLine();
		        
		        // 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
		        deleteDistnce();

		        // 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
		        deleteCircleDot();
		    
		        // 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
		        clickLine = new kakao.maps.Polyline({
		            map: map, // 선을 표시할 지도입니다 
		            path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다
		        });
		        
		        // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
		        moveLine = new kakao.maps.Polyline({
		            strokeWeight: 3, // 선의 두께입니다 
		            strokeColor: '#db4040', // 선의 색깔입니다
		            strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
		            strokeStyle: 'solid' // 선의 스타일입니다    
		        });
		    
		        // 클릭한 지점에 대한 정보를 지도에 표시합니다
		        displayCircleDot(clickPosition, 0);

		            
		    } else { // 선이 그려지고 있는 상태이면

		        // 그려지고 있는 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();

		        // 좌표 배열에 클릭한 위치를 추가합니다
		        path.push(clickPosition);
		        
		        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		        clickLine.setPath(path);

		        var distance = Math.round(clickLine.getLength());
		        displayCircleDot(clickPosition, distance);
		        
		        console.log(path);
		        
		        document.getElementById('lc_xy_arr').value = path;
		    }
		});
		    
		// 지도에 마우스무브 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
		kakao.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

		    // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
		    if (drawingFlag){
		        
		        // 마우스 커서의 현재 위치를 얻어옵니다 
		        var mousePosition = mouseEvent.latLng; 

		        // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
		        
		        // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
		        var movepath = [path[path.length-1], mousePosition];
		        moveLine.setPath(movepath);    
		        moveLine.setMap(map);
		        
		        var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
		            content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
		        
		        // 거리정보를 지도에 표시합니다
		        showDistance(content, mousePosition);   
		    }             
		});                 

		// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
		// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
		kakao.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

		    // 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
		    if (drawingFlag) {
		        
		        // 마우스무브로 그려진 선은 지도에서 제거합니다
		        moveLine.setMap(null);
		        moveLine = null;  
		        
		        // 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
		        var path = clickLine.getPath();
		    
		        // 선을 구성하는 좌표의 개수가 2개 이상이면
		        if (path.length > 1) {

		            // 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
		            if (dots[dots.length-1].distance) {
		                dots[dots.length-1].distance.setMap(null);
		                dots[dots.length-1].distance = null;    
		            }

		            var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
		                content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
		                
		            // 그려진 선의 거리정보를 지도에 표시합니다
		            showDistance(content, path[path.length-1]);  
		             
		        } else {

		            // 선을 구성하는 좌표의 개수가 1개 이하이면 
		            // 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
		            deleteClickLine();
		            deleteCircleDot(); 
		            deleteDistnce();

		        }
		        
		        // 상태를 false로, 그리지 않고 있는 상태로 변경합니다
		        drawingFlag = false;          
		    }  
		});    

		// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
		function deleteClickLine() {
		    if (clickLine) {
		        clickLine.setMap(null);    
		        clickLine = null;        
		    }
		}

		// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
		// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
		function showDistance(content, position) {
		    
		    if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
		        
		        // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
		        distanceOverlay.setPosition(position);
		        distanceOverlay.setContent(content);
		        
		    } else { // 커스텀 오버레이가 생성되지 않은 상태이면
		        
		        // 커스텀 오버레이를 생성하고 지도에 표시합니다
		        distanceOverlay = new kakao.maps.CustomOverlay({
		            map: map, // 커스텀오버레이를 표시할 지도입니다
		            content: content,  // 커스텀오버레이에 표시할 내용입니다
		            position: position, // 커스텀오버레이를 표시할 위치입니다.
		            xAnchor: 0,
		            yAnchor: 0,
		            zIndex: 3  
		        });      
		    }
		}

		// 그려지고 있는 선의 총거리 정보와 
		// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
		function deleteDistnce () {
		    if (distanceOverlay) {
		        distanceOverlay.setMap(null);
		        distanceOverlay = null;
		    }
		}

		// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
		function displayCircleDot(position, distance) {

		    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
		    var circleOverlay = new kakao.maps.CustomOverlay({
		        content: '<span class="dot"></span>',
		        position: position,
		        zIndex: 1
		    });

		    // 지도에 표시합니다
		    circleOverlay.setMap(map);

		    if (distance > 0) {
		        // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
		        var distanceOverlay = new kakao.maps.CustomOverlay({
		            content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
		            position: position,
		            yAnchor: 1,
		            zIndex: 2
		        });

		        // 지도에 표시합니다
		        /* distanceOverlay.setMap(map); */
		    }

		    // 배열에 추가합니다
		    dots.push({circle:circleOverlay, distance: distanceOverlay});
		}

		// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
		function deleteCircleDot() {
		    var i;

		    for ( i = 0; i < dots.length; i++ ){
		        if (dots[i].circle) { 
		            dots[i].circle.setMap(null);
		        }

		        if (dots[i].distance) {
		            dots[i].distance.setMap(null);
		        }
		    }

		    dots = [];
		}

		// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
		// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
		// HTML Content를 만들어 리턴하는 함수입니다
		function getTimeHTML(distance) {

		    // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
		    var walkkTime = distance / 67 | 0;
		    var walkHour = '', walkMin = '';

		    // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
		    if (walkkTime > 60) {
		        walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
		    }
		    walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

		    // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
		    var bycicleTime = distance / 227 | 0;
		    var bycicleHour = '', bycicleMin = '';

		    // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
		    if (bycicleTime > 60) {
		        bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
		    }
		    bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

		    // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
		    var content = '<ul class="dotOverlay distanceInfo">';
		    content += '    <li>';
		    content += '        <span class="label">총거리</span><span class="number">' + distance/1000 + '</span>km';
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">도보</span>' + walkHour + walkMin;
		    content += '    </li>';
		    content += '    <li>';
		    content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
		    content += '    </li>';
		    content += '</ul>'

			    document.getElementById('distance').innerHTML= distance/1000 + 'km';
		    	document.getElementById('run').innerHTML = walkHour + walkMin;
		    	document.getElementById('cycle').innerHTML = bycicleHour + bycicleMin;
		    	
		    	document.getElementById('lc_distance').value= distance/1000;
		    	document.getElementById('lc_run').value = Math.floor(walkkTime / 60) + "시간 " + walkkTime % 60 +"분";
		    	document.getElementById('lc_cycle').value = Math.floor(bycicleTime / 60) + "시간 " + bycicleTime % 60 + "분";

		    return content;
		    
		}
		
		
		

	</script>
	
	
<!-- 	-------------------------------------------------------------------------------------->	


<%@ include file="../includes/footer.jsp"%>