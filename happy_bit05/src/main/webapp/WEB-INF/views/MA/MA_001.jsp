
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/topbar.jsp"%>
<%@ include file="../includes/middle.jsp"%>


<style>
	html, body {width:100%;height:100%;margin:0;padding:0;} 
	.map_wrap {position:relative;overflow:hidden;width:100%;height:600px;}
	.radius_border{border:1px solid #919191;border-radius:5px;}     
	.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif;}
	.custom_typecontrol span {display:block;width:65px;height:30px;float:left;text-align:center;line-height:30px;cursor:pointer;}
	.custom_typecontrol .btn {background:#fff;background:linear-gradient(#fff,  #e6e6e6);}       
	.custom_typecontrol .btn:hover {background:#f5f5f5;background:linear-gradient(#f5f5f5,#e3e3e3);}
	.custom_typecontrol .btn:active {background:#e6e6e6;background:linear-gradient(#e6e6e6, #fff);}    
	.custom_typecontrol .selected_btn {color:#fff;background:#425470;background:linear-gradient(#425470, #5b6d8a);}
	.custom_typecontrol .selected_btn:hover {color:#fff;}   
	.custom_zoomcontrol {position:absolute;top:50px;right:10px;width:36px;height:80px;overflow:hidden;z-index:1;background-color:#f5f5f5;} 
	.custom_zoomcontrol span {display:block;width:36px;height:40px;text-align:center;cursor:pointer;}     
	.custom_zoomcontrol span img {width:15px;height:15px;padding:12px 0;border:none;}             
	.custom_zoomcontrol span:first-child{border-bottom:1px solid #bfbfbf;}            
</style>

<!-- 새로운 부트스트랩 추가 적용--------------------------------------------------------------------------------------- -->
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../../resources/mainBoot/assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../resources/mainBoot/css/styles.css" rel="stylesheet" />
<!-- -------------------------------------------------------------------------------------------------------------------- -->
<div class="container text-center">
	<section class="page-section">
	<div class="jumbotron">
	<h2 class="text-center mt-0">지금 당장 달려볼까요!</h2>
	<hr class="divider my-4">
	<p class="text-black-50 mb-4">사용자의 위치와 가장 가까운 코스들을 불러옵니다.</p>
	</div>
	<br>
	<div class="row justify-content-center ">
		<div class="col-8">
		   <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div> 
		</div>
		<div class="col-4">
			 <select id="lc_type" class="custom-select" onchange="mainView()">
				  <option value="육상" selected="selected">육상</option>
				  <option value="자전거">자전거</option>
				</select>
			<div id="muteCourse" class="overflow-auto" style="height:600px; background-color: white;"></div>
		</div>
	</div>
	</section>
</div>


<section id="portfolio">
            <div class="container-fluid p-0">
                <div class="row no-gutters">
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/lc/002/list?lc_type=육상"><img class="img-fluid" src="../../resources/mainBoot/assets/img/portfolio/thumbnails/runner1.png" alt="">
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Running Course</div>
                            </div></a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/lc/002/list?lc_type=자전거"><img class="img-fluid" src="../../resources/mainBoot/assets/img/portfolio/thumbnails/cycler1.png" alt="">
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Cycle Course</div>
                            </div></a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/co/co_003_1"><img class="img-fluid" src="../../resources/mainBoot/assets/img/portfolio/thumbnails/arena1.png" alt="">
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Competition</div>
                            </div></a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/pr/pr_002_1"><img class="img-fluid" src="../../resources/mainBoot/assets/img/portfolio/thumbnails/record1.png" alt="">
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Complete Record</div>
                            </div></a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/li/li_004_1?li_b_type=장비게시판"><img class="img-fluid" src="../../resources/mainBoot/assets/img/portfolio/thumbnails/inven1.png" alt="">
                            <div class="portfolio-box-caption">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Training Gear</div>
                            </div></a>
                    </div>
                    <div class="col-lg-4 col-sm-6">
                        <a class="portfolio-box" href="/lt/lt_002_1"><img class="img-fluid" src="../../resources/mainBoot/assets/img/portfolio/thumbnails/train1.png" alt="">
                            <div class="portfolio-box-caption p-3">
                                <div class="project-category text-white-50">Category</div>
                                <div class="project-name">Work Out</div>
                            </div></a>
                    </div>
                </div>
            </div>
        </section>

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

var markers = [];
var infowindow = [];

function mainView(){
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
		            
		            var lc_area2 = document.getElementById('lc_area2').value;
	      	      	var lc_area3 = document.getElementById('lc_area3').value;
	      	      	var lc_type = document.getElementById('lc_type').value;
	      	        console.log(lc_area2);
	            	console.log(lc_area3);
	            	console.log(lc_type);
	            	
	            	for(var i=0; i < markers.length; i++){
	            		// 마커에 클릭이벤트를 등록합니다
	            		markers[i].setMap(null);
	            		infowindow[i].close();
	            	}
		            
		            $.ajax({
		          		type: "POST",
		          		cache: false,
		          		async: "true",
		          		url: "../ma/001/main",
		          		data : {
		          			"lc_area2" : lc_area2,
		          			"lc_area3" : lc_area3,
		          			"lc_type" : lc_type
		          		},
		          		dataType : "json",
		          		success : function(data){
		          
		          			var muteCourse = document.getElementById('muteCourse');
		          			var positions = []; //마커가 표시될 위치들.
		          			var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		          		    var imageSize = new kakao.maps.Size(24, 35);
		          		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 	// 마커 이미지를 생성합니다    
	          				var course = ''; //리스트 내용.
	              			var content = []; //HTML 내용.
	              			infowindow = [];
	              			markers = [];
		          		    
		          		    //마커 생성
		          			for(var i = 0; i < data.length; i++){
		          				
		          				var split1 = data[i].lc_xy_arr.split(',');
		    					split1[0] = split1[0].substring(1 , split1[0].length);
		    					split1[1] = split1[1].substring(1, split1[1].length-1);
		    					
		    					positions[i] = new kakao.maps.LatLng(split1[0], split1[1]);
		    					
		    					//마커 눌렀을때 나올 내용.
		    					content[i] = '';
		    					content[i] += '<form id="mainGet'+i+'" action="../../lc/003/lc_get" method="post">';
			        			//content[i] += '<div class="col-md-12">';
			    				content[i] += '<div class="card mb-3 shadow-sm">';
			    				content[i] += '<svg class="bd-placeholder-img card-img-top" width="100%" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">';
			    				if(data[i].lc_request){
			    					content[i] += '<img alt="" id="thumbnail" src="data:image/jsp;base64,' + data[i].lc_request + '" height="100"/>';
			    				} else {
			    					content[i] += '<img alt="" id="thumbnail" src="/resources/img/lc/basic.png" height="100"/>';
			    				}
			    				content[i] += '</svg>';
			    				content[i] += '<div class="card-body" height="20">';
			    				content[i] += '<p class="card-text">' + data[i].lc_title + '</p>';
			    				content[i] += '<p class="card-text">조회수 : ' + data[i].lc_see + '<br>추천수 : ' + data[i].lc_good + '</p>';
			    				content[i] += '<input name="lc_index" type="hidden" value="'+ data[i].lc_index +'"/>';
			    				content[i] += '</div></div>';
			    				content[i] += '</form>';
		    					
			    				//마커 생성.
		    					markers[i] = new kakao.maps.Marker({
		    						map : map,
		    						position : positions[i],
		    						image : markerImage,
		    						clickable : true,
		    						content : content[i]
		    					});
		    					
		    					//마커 표시.
		    					markers[i].setMap(map);
		    					
		    					// 마커에 표시할 인포윈도우를 생성합니다 
		    				    infowindow[i] = new kakao.maps.InfoWindow({
		    				        content: content[i] // 인포윈도우에 표시할 내용
		    				    });
			    				
			    				//리스트에 나올 내용.
			    				course += '<table id = "mainList'+ i +'" class="table table-bordered table-hover" onClick = "lcGet('+i+')">';														
								course += '<tr>';
								course += '	<td rowspan="2" style="width:120px; height: 100px; padding: 0;">';
								if(data[i].lc_request){
			    					course += '<img alt="" id="thumbnail" src="data:image/jsp;base64,' + data[i].lc_request + '" height="100"/>';
			    				} else {
			    					course += '<img alt="" id="thumbnail" src="/resources/img/lc/basic.png" height="100"/>';
			    				}								course += '	</td>';
								course += '	<td>' + data[i].lc_title + '</td>';
								course += '</tr><tr>';
								course += ' <td>추천수 : '+ data[i].lc_good +'</td>';	
								course += '</tr>';
								course += '<input name="lc_index" type="hidden" value="'+ data[i].lc_index +'"/>'
								course += '</table>';
			    				
								//마커에 이벤트 등록.
		    					addMouseOver(map, markers[i], infowindow[i]);
								addMouseOut(markers[i], infowindow[i]);
			    				
								
		          			}
		          			
		    				muteCourse.innerHTML = course;
		    				
		    				
		    				//리스트에 이벤트 주기.
		    				for(var i = 0; i < data.length; i++){
		    					(function(i){
		    						var listOne = document.getElementById('mainList' + i);
		    						console.log(listOne);
		    						
		    						listOne.addEventListener("mouseover", function(){ 
		    								infowindow[i].open(map, markers[i]);
		    								map.setCenter(positions[i])
		    							});
		    						listOne.addEventListener("mouseout", function(){ 
		    								infowindow[i].close();
		    								map.setCenter(locPosition);
		    							});
		    						
		    					})(i);
		    					
		    				}
		    				
	
		    					
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

};

//주변 코스 최초 실행.
mainView();


/* function mainAd(){
	$.ajax({
  		type: "POST",
  		cache: false,
  		async: "true",
  		url: "../ma/001/main_ad",
  		success : function(data){
  			
  			var middle_ol = document.getElementById('middle_ol');
  			var middle_div = document.getElementById('middle_div');
  			
  			var content_ol = '<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>';
  			var content_div = '<div class="carousel-item active max-small" style="background-image: url("data:image/jsp;base64,"'+${data[0].request_image} +')"></div>';
  			
  			for(var i = 1; i < data.length; i++){
  				content_ol += '<li data-target="#carouselExampleIndicators" data-slide-to="'+i+'"></li>';
  				
  				content_div += '<div class="carousel-item max-small"';
				content_div += '		style="background-image: url("data:image/jsp;base64,"'+${data[i].request_image} +')">';
				content_div += '			<div class="carousel-caption d-none d-md-block">';
				content_div += '			</div>';
				content_div += '		</div>';
  			}
  			
  			middle_ol.innerHTML = content_ol;
  			middle_div.innerHTML = content_div;
  		}
	});
}

//광고 최초 실행.
mainAd();
 */
/* ---------------------------------------------------------------------------------------------------------- */

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

//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}

function addMouseOver(map, marker, infowindow){
	kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
}

function addMouseOut(marker, infowindow){
	kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
}

function lcGet(i){
	var get = document.getElementById('mainGet' + i);
	
	get.submit();
}

//지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomIn() {
    map.setLevel(map.getLevel() - 1);
}

// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
function zoomOut() {
    map.setLevel(map.getLevel() + 1);
}

</script>


<%@ include file="../includes/footer.jsp"%>