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
    <link href="../../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
  var record_arr = xy_arr;

  // start btn
  $(".btnStart").click(function(){

    if(starFlag){
      $(".fa").css("color","#FAED7D")
      this.style.color = "#4C4C4C";
      starFlag = false;

      if(time == 0){
        init();
      }

      timer = setInterval(function(){
        time++;

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
      }, 1000);
      
      //startEvnet() 종료.
      clearInterval(startTimer);
      
      //내 위치 추적, 좌표 지우기.
      recordStart = setInterval(function(){
    	  
    	  //내 위치 가져오기
    	  myPositionOnly();
    	  
    	  //내 위치 좌표
    	  var targetLat = Math.floor(parseFloat($('#mylat').val())*1000)/1000;
    	  //경로 위치 좌표.
 		  var lineLat = Math.floor(parseFloat(xy_arr[0])*1000)/1000;
    	  
    	  //위도 오차범위 검색.
    	  if(targetLat == lineLat){
    		  
    		//Lat이 맞다면 Lon오차범위를 확인하기위해서 변수
  			var targetLon = Math.floor($('#mylon').val()*100)/100
  			var lineLon = Math.floor(xy_arr[1]*100)/100
  			
  			//경도 오차범위 검색.
  			if(targetLon == lineLon){
  				
  				//내 위치 불러오기.
	    		 var mylat = document.getElementById('mylat').value;
	    		 var mylon = document.getElementById('mylon').value;
	    		  
	    		 record_arr.splice(0,2);
	    		  
	    		 xy_arr[0] = mylat;
	    		 xy_arr[1] = mylon;
	    		  
	    		 for(var i =  0; i < record_arr.size(); i++){
	    		  xy_arr[i+2] = record_arr[i];
	    		 }
  			}
    	  }
      }, 3000);
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

        
    	 // 지도 중심좌표를 접속위치로 변경합니다
	    map.setCenter(locPosition); 
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

//5초 마다 내위치를 비교해서 범위안에 들어와있는지 확인
(aa()); 

$(function startEvent() {
        	
        startTimer = setInterval(function(){
        	aa();
        },6000);
        
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
	        displayMyMarker(locPosition);
	            
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
    var circleOverlay = new kakao.maps.CustomOverlay({
        content: '<span class="dot"></span>',
        position: position,
        zIndex: 1
    });

    // 지도에 표시합니다
    circleOverlay.setMap(map);
}

for(var i = 0; i < xy_arr.length; i+=2){
	linePath.push(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
	 displayCircleDot(new kakao.maps.LatLng(xy_arr[i], xy_arr[i+1]));
}.

	

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




/* ---------------------------------------------------------------------------------------------------- */
/* 마커 관련 함수들. */

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    });       
}

// 내 위치를 표시하는 마커입니다.
function displayMyMarker(locPosition) {

    // 마커를 생성합니다
    var myMarker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    });       
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
	    var courseMarker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
    }else{
    	var courseMmarker = new kakao.maps.Marker({
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
		 
		  myPositionOnly();
		 
		  console.log('그그'+$('#mylat').val());
		 console.log('느느'+xy_arr[0]);
		 
		 var targetLat = Math.floor(parseFloat($('#mylat').val())*100)/100;
		 var lineLat = Math.floor(parseFloat(xy_arr[0])*100)/100;
		 
		 console.log(targetLat);
		 console.log(lineLat);
		 if(targetLat == lineLat){
			//먼저 Lat이 오차범위안에 있는지 확인 
			
			//Lat이 맞다면 Lon오차범위를 확인하기위해서 변수
			var targetLon = Math.floor($('#mylon').val()*100)/100
			var lineLon = Math.floor(xy_arr[1]*100)/100
		 
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
		 
		  myPositionOnly();
		 
		  console.log('그그'+$('#mylat').val());
		 console.log('느느'+xy_arr[0]);
		 
		 var targetLat = Math.floor(parseFloat($('#mylat').val())*100)/100;
		 var lineLat = Math.floor(parseFloat(xy_arr[0])*100)/100;
		 
		 console.log(targetLat);
		 console.log(lineLat);
		 if(targetLat == lineLat){
			//먼저 Lat이 오차범위안에 있는지 확인 
			
			//Lat이 맞다면 Lon오차범위를 확인하기위해서 변수
			var targetLon = Math.floor($('#mylon').val()*100)/100
			var lineLon = Math.floor(xy_arr[1]*100)/100
		 
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

</script>

</body>
</html>
