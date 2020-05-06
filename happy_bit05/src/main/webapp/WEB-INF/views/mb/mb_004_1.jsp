<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Home</title>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>


    <!-- Bootstrap core CSS -->
    <link href="/happy_bit05/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
.carousel-item {
     height: auto;
     width: 100%;
     }
     a{text-decoration:none; color:#000000;}
     a:hover{color:#ff0000;}
     nav ul li {
            display:inline;                         /*  세로나열을 가로나열로 변경 */
            border-left:1px solid #999;           /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
			font:bold 12px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding:0 10px;                         /* 각 메뉴 간격 */
}


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
    <script>
        $.ajax({
				url: "../mb/load",
				type: "GET",
				cache: false,
				dataType: "json",
				data: "hi",
				success: function(data) {
					 alert('success'+data);
					 $('#showmap').html(data.lc_xy_arr);
					 $('#xy_arr').val(data.lc_xy_arr);
				},
				 error: function(request, status, error){
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 console.log('error:'+error);
				 }
				 });
        
    </script>

</head>
<body>

<!-- 지도 관련 파라미터들 -->

<!-- 코스 경로 좌표 -->
<input type="text" id="xy_arr"/>

<!-- 내 위치 좌표 -->
<input type="text" id="mylat" />
<input type="text" id="mylon" />


<!-- Navigation -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">


        <a class="navbar-brand" href="#">BnR</a>
        <button class="navbar-toggler navbar-toggler-right" type="button"
                data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" href="#">나의 코스</a></li>
                <li class="nav-item"><a class="nav-link" href="#">코스 게시판</a></li>
                <li class="nav-item"><a class="nav-link" href="#">기록자랑</a></li>
                <li class="nav-item"><a class="nav-link" href="#">기록측정</a></li>
            </ul>
        </div>
    </div>
</nav>



<div class="container">
    <div class="row">
        <div id='showDate'></div>
        <div id="showmap"></div>
        <br>
        <br>



        <div class="col-md-6 col-md-offset-3" style="text-align: center;">
            <h1>코스명<small><br>기록 측정<br>

                <!-- 기록이 들어감-->
                <div id="check"></div>
                <div id="time">00:00:00</div>

            </small></h1>
            <br>

            <button type="button" id="startbtn" class="btn btn-default btn-lg">Start</button>
            <button type="button" id="pausebtn" class="btn btn-danger btn-lg btnStop">Stop</button>
            <br>
            <br>
            <div id="upload"><br></div>
            <br>
            <!-- Button trigger modal -->
            <button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
                경로 변경
            </button>
            <button type="button" class="btn btn-default btn-sm" onclick="myPosition()">
                내 위치
            </button>
            <button type="button" class="btn btn-default btn-sm" onclick="coursePosition()">
     	  다음경로
            </button>
            
            <!-- 지도를 표시할 div 입니다 -->
			<div id="map" style="width:100%;height:350px;"></div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <div  class="modal-body">
                            ...
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary">Save changes</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>



</div>

<script>
var time = 0;
var starFlag = true;
$(document).ready(function(){
  buttonEvt();
});

function init(){
  document.getElementById("time").innerHTML = "00:00:00";
}

function buttonEvt(){
  var hour = 0;
  var min = 0;
  var sec = 0;
  var timer;
  var record_arr = JSON.parse(JSON.stringify(xy_arr));

  // start btn
  $(".btnStart").click(function(){

    if(starFlag){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      starFlag = false;

      if(time == 0){
        init();
      }
      
    //startEvnet() 종료.
      clearInterval(startTimer);
    
    //마커를 지웁니다.
		marker.setMap(null);
    
      timer = setInterval(function(){
        time++;
		console.log('11===================================>'+time);
        min = Math.floor(time/60);
        hour = Math.floor(min/60);
        sec = time%60;
        min = min%60;

        var th = hour;
        var tm = min;
        var ts = sec;
        
        if(th<10){
        th = "0" + hour;
        }
        if(tm < 10){
        tm = "0" + min;
        }
        if(ts < 10){
        ts = "0" + sec;
        }

        document.getElementById("time").innerHTML = th + ":" + tm + ":" + ts;
      
     	 //여기서부터 경로를 따라갑니다.
        console.log('스타트 인터벌 도는 중.===================================>'+time);
  	 	 //내 위치 가져오기
  	 	 myPositionOnly();
  	  
  		  //내 위치 좌표
  	 	 var targetLat = Math.floor(parseFloat($('#mylat').val())*10000)/10000;
  	  	//경로 위치 좌표.
		 var lineLat = Math.floor(parseFloat(xy_arr[0])*10000)/10000;
  	  
  	  	console.log('targetLat = ' + targetLat);
  	  	console.log('lineLat = ' + lineLat);
  	 	 //위도 오차범위 검색.
  	 	 if(targetLat == lineLat){
  		  	
  	 		console.log('스타트 인터벌 도는 중1.===================================>'+time);
  	 		
  			//Lat이 맞다면 Lon오차범위를 확인하기위해서 변수
			var targetLon = Math.floor($('#mylon').val()*10000)/10000;
			var lineLon = Math.floor(xy_arr[1]*10000)/10000;
			
			//경도 오차범위 검색.
			if(targetLon == lineLon){
				
				console.log('스타트 인터벌 도는중2. ------------------------------->' + time);
				 //내 위치 불러오기.
	    		 var mylat = document.getElementById('mylat').value;
	    		 var mylon = document.getElementById('mylon').value;
	    		 
	    		 //카피 배열의 0~1번째 값 삭제.
	    		 record_arr.splice(0,2);
	    		 
	    		 xy_arr = [];
	    		 
	    		 //내 위치를 코스 배열 0~1번째에 넣기.
	    		 xy_arr[0] = mylat;
	    		 xy_arr[1] = mylon;
	    		 
	    		 //카피 배열을 2번째부터 넣기.
	    		 if(record_arr.length >= 1){
			    	 for(var i =  0; i < record_arr.length; i++){
			    	 	xy_arr[i+2] = record_arr[i];
			    	 }  
	    		 }
	    		 

	    			
	    		 //여기서부터 지도 새로 표시하는 부분입니다.
	    		 linePath = [];
	    		 
		    		//기존의 점은 지운다.
	 				deleteCircleDot();
	    		 
	    			//점찍는 함수.
	    			function startingCircleDot(position) {
	    				
	    			    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	    			    circleOverlay = new kakao.maps.CustomOverlay({
	    			        content: '<span class="dot"></span>',
	    			        position: position,
	    			        zIndex: 1
	    			    });
	    			
	    			    // 지도에 표시합니다
	    			    circleOverlay.setMap(map);
	    			 	// 배열에 추가합니다
	    			    dots.push({circle:circleOverlay});
	    			}
	    			
	    			for(var i = 0; i < xy_arr.length; i+=2){
	    				linePath.push(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
	    				startingCircleDot(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
	    			}
	    			
	    				
	    			
	    			for(var i = 0; i < linePath.length; i++){
	    				console.log(linePath[i]);
	    			}
	    			
	    			// 기존의 선을 지웁니다.
	    			polyline.setMap(null);
	    			
	    			// 지도에 표시할 선을 생성합니다
	    			polyline = new kakao.maps.Polyline({
		    			path: linePath, // 선을 구성하는 좌표배열 입니다
		    			strokeWeight: 7, // 선의 두께 입니다
		    			strokeColor: '#db4040', // 선의 색깔입니다
		    			strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    			strokeStyle: 'solid' // 선의 스타일입니다
		    		});
	    			
	    			
	    			// 지도에 선을 표시합니다 
	    			polyline.setMap(map);
	    			
	    			if(xy_arr.length == 2){
	    				clearInterval(timer);
	    			      starFlag = true;

	    			      var $button = $('<button class="btn btn-primary">upload업로드</button>');

	    			      $('#upload').html($button);
	    			}
	    			
			}
  	 	 }
  	  
      }, 1000);
      
      }
  });

  // pause btn
  $("#pausebtn").click(function(){
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);
      starFlag = true;

      var $button = $('<button class="btn btn-primary">upload업로드</button>');

      $('#upload').html($button);
    }
  });

  // stop btn
  $("#stopbtn").click(function(){
    if(time != 0){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      clearInterval(timer);
      starFlag = true;
      time = 0;
      init();
    }
  });
}

</script>



<!-- ----------------------------------------------------------------------------------------------------------- -->
<!-- 지도관련 스크립트. -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 1 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 




/* ------------------------------------------------------------------------------------------------ */
/* 위치 띄워주는 함수들. */


/* 페이지 들어왔을때 경로 첫 지점 보여주기. */
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
    	
    	var myLat = position.coords.latitude, // 위도
        	myLon = position.coords.longitude; // 경도
        	
        	document.getElementById("mylat").value = myLat;
	        document.getElementById("mylon").value = myLon;
        
        var lat = xy_arr[0], // 위도
            lon = xy_arr[1]; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

        //마커를 표시합니다.
        displayMyMarker(locPosition);
    	 // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition); 
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
}

//2초 마다 내위치를 비교해서 범위안에 들어와있는지 확인
(aa()); 

$(function startEvent() {
        	
        startTimer = setInterval(function(){
        	console.log('00===================================>');
        	aa2();
        },2000);
        
});


/* 내 위치랑 마커 가져오기. */
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
function myPosition(){
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        document.getElementById("mylat").value = lat;
	        document.getElementById("mylon").value = lon;
	        
	        // 마커와 인포윈도우를 표시합니다
	        map.setCenter(locPosition);    
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	    displayMyMarker(locPosition);
	}
	   
}

// 내 위치만 가져오기
function myPositionOnly(){
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	    	
	        
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	            
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	        document.getElementById("mylat").value = lat;
	        document.getElementById("mylon").value = lon;
	        
	      	//마커 위치, 현재 위치로 옮기기.
	        myMarker.setPosition(locPosition);
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	        //마커 위치, 현재 위치로 옮기기.
	        myMarker.setPosition(locPosition);
	}
	
}

//코스 다음 경로보기.
function coursePosition(){
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
	    navigator.geolocation.getCurrentPosition(function(position) {
	        
	        var lat = xy_arr[0], // 위도
	            lon = xy_arr[1]; // 경도
	        
	        var locPosition = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다

	        
	    	 // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition); 
	            
	      });
	    
	} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
	    
	    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
	        message = 'geolocation을 사용할수 없어요..'
	        
	}
}


/* ---------------------------------------------------------------------------------------- */
/* 지도에 경로 표시하는 함수들. */


//선긋는 함수.
var xy = document.getElementById("xy_arr").value;
var xy_arr = xy.split(',');

var linePath = [];
var circleOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
var dots = []; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

	for(var i = 0; i < xy_arr.length; i++){
		if(i % 2 != 0){
			xy_arr[i] = xy_arr[i].substring(1, xy_arr[i].length-1);
		}
		else{
			xy_arr[i] = xy_arr[i].substring(1, xy_arr[i].length);
		}
		
		console.log(xy_arr[i]);
	}
	
	//점찍는 함수
	function displayCircleDot(position) {
	
	    // 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
	    circleOverlay = new kakao.maps.CustomOverlay({
	        content: '<span class="dot"></span>',
	        position: position,
	        zIndex: 1
	    });
	
	    // 지도에 표시합니다
	    circleOverlay.setMap(map);
	    
		// 배열에 추가합니다
	    dots.push({circle:circleOverlay});
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

	
	// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
	function deleteCircleDot() {
	    var i;

	    for ( i = 0; i < dots.length; i++ ){
	        if (dots[i].circle) { 
	            dots[i].circle.setMap(null);
	        }

	    }

	    dots = [];
	}


/* ---------------------------------------------------------------------------------------------------- */
/* 마커 관련 함수들. */

// 도착지점 마커 전역변수.
//var marker;
var courseMarker;

// 내 위치 마커 전역변수.
var myMarker;

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
/* function displayMarker(locPosition) {

	//시작, 도착 지점을 표시하는 마커.
	 	marker = new kakao.maps.Marker({  
	    map: map, 
	    position: locPosition
	 });
    
    marker.setMap(map);
} */

// 내 위치를 표시하는 마커입니다.
function displayMyMarker(locPosition) {

	//내 위치를 표시하는 마커.
	 	myMarker = new kakao.maps.Marker({  
	    map: map, 
	    position: locPosition
	 });
    
    myMarker.setMap(map);
} 


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
	    	courseMarker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    
	    
	    });
	    
	    courseMarker.setMap(map);
	    
    }else{
    	marker = new kakao.maps.Marker({
    		position: positions[i].latlng
    	});
    	
    	marker.setMap(map);
    }
}


/* ------------------------------------------------------------------------------------------------------- */

/* 페이지 열렸을 때 내 위치와 시작위치의 오차 확인 */
function aa() {
	 $.ajax({
	url: "../mb/load",
	type: "GET",
	cache: false,
	dataType: "json",
	success: function(data) {
		 /* alert('success'+data); */
		 //lat 오차범위 첫번째
		 
		 //필요 없을 수도....
		  //myPosition();
		 
		 console.log('01===================================>');
		 console.log('그그'+$('#mylat').val());
		 console.log('느느'+xy_arr[0]);
		 
		 var targetLat = Math.floor(parseFloat($('#mylat').val())*10000)/10000;
		 var lineLat = Math.floor(parseFloat(xy_arr[0])*10000)/10000;
		 
		 console.log(targetLat);
		 console.log(lineLat);
		 if(targetLat == lineLat){
			//먼저 Lat이 오차범위안에 있는지 확인 
			
			//Lat이 맞다면 Lon오차범위를 확인하기위해서 변수
<<<<<<< HEAD
			var targetLon = Math.floor($('#mylon').val()*10000)/10000
			var lineLon = Math.floor(xy_arr[1]*10000)/10000
=======
			var targetLon = Math.floor($('#mylon').val()*10000)/10000;
			var lineLon = Math.floor(xy_arr[1]*10000)/10000;
>>>>>>> develope
		 
			if(targetLon == lineLon){
				document.getElementById('startbtn').className = "btn btn-lg btn-primary btnStart";
				//Lat과 Lon이 같다면 Start에 요소 추가구문
				console.log("22221111");
			}
		 }else{
			 document.getElementById('startbtn').className = "btn btn-lg btn-danger";
		 }
	},
	 error: function(request, status, error){
		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 console.log('error:'+error);
	 }
	
	 });

}


/* 모르겠음.. 몬가.. 몬가 하나 더 있음... */
function aa2() {
	 $.ajax({
	url: "../mb/load",
	type: "GET",
	cache: false,
	dataType: "json",
	success: function(data) {
		 /* alert('success'+data); */
		 //lat 오차범위 첫번째
		 
		 
		 console.log('02===================================>');
		 myPositionOnly();
		 
		  console.log('그그'+$('#mylat').val());
		 console.log('느느'+xy_arr[0]);
		 
		 var targetLat = Math.floor(parseFloat($('#mylat').val())*10000)/10000;
		 var lineLat = Math.floor(parseFloat(xy_arr[0])*10000)/10000;
		 
		 console.log(targetLat);
		 console.log(lineLat);
		 if(targetLat == lineLat){
			//먼저 Lat이 오차범위안에 있는지 확인 
			
			//Lat이 맞다면 Lon오차범위를 확인하기위해서 변수
<<<<<<< HEAD
			var targetLon = Math.floor($('#mylon').val()*10000)/10000
			var lineLon = Math.floor(xy_arr[1]*10000)/10000
=======
			var targetLon = Math.floor($('#mylon').val()*10000)/10000;
			var lineLon = Math.floor(xy_arr[1]*10000)/10000;
>>>>>>> develope
		 
			if(targetLon == lineLon){
				document.getElementById('startbtn').className = "btn btn-lg btn-primary btnStart";
				//Lat과 Lon이 같다면 Start에 요소 추가구문
				console.log("22221111");
				buttonEvt();
			}
		 }else{
			 document.getElementById('startbtn').className = "btn btn-lg btn-danger";
		 }
	},
	 error: function(request, status, error){
		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 console.log('error:'+error);
	 }
	
	 });

}

</script>

</body>
</html>
