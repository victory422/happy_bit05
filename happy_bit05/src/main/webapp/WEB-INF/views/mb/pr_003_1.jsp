<%@include file="../includes/mobile_topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	

    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    

<div class="container" style="max-width: 100%;margin-left: 0px;margin-right: 0px;padding-right: 0px;padding-left: -20px;">
<div class="row justify-content-center col-12" style="max-width: 100%;">
			<div class="w-100" style="margin: 0;">
			<div class = "col-12" style="margin-bottom:30px;padding-left: 0px;padding-right: 0px;">
				<c:choose>
					<c:when test="${data.lc_type eq '육상'}"><img src="../../resources/img/lc/running.png" width="60px"/></c:when>
					<c:when test="${data.lc_type eq '자전거'}"><img src="../../resources/img/lc/cycle.png" width="60px"/></c:when>
				</c:choose>
				<br/>
				<div><h3>${data.pr_title }</h3> <h5>코스명 : (${data.lc_title })</h5></div>

				</div>
				<div class="col-8">
					<h5>작성자 : ${data.m_nickname }</h5>
				</div>
				<div class="col-4">
					<h5>날짜 : ${data.pr_resistDate }</h5>
					<h5><a onclick="report()" class="text-muted">신고하기</a></h5>
				</div>
			
			<div style="margin-bottom:10px;">
					
				</div>
				</div>
			
				<div id="map" class="col-md-12" style="width:90%;height:300px;"></div>
			
		<div class="col-md-4" id="mapText">
			<div class="p-4">
			<h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 거리 : <span id="distance" name="distance">${data.lc_distance } km</span>
	     	 </font></font></h3>
	     	 </div>
	   		
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 도보 시간 : <span id="run" name="run">${data.lc_run }</span>
	      </font></font></h3>
	      </div>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	자전거 시간 : <span id="cycle" name="cycle">${data.lc_cycle }</span>
	      </font></font></h3>
	      </div>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 출발지 : <span id="address" name="address">${data.lc_address }</span>
	      </font></font></h3>
	      </div>
	      
	      <div class="p-4">
	      <h3 class="pb-2 mb-2 font-italic border-bottom"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
	       	 측정 시간 : <span id="address" name="address">${data.pr_record }</span>
	      </font></font></h3>
	      </div>
	      <br>
	    </div>
	    
	    <div class="w-100"><hr></div>
	    <div style="margin-top:30px;margin-bottom:30px;"></div>
	    

			<br>
			
	<div class="content" style="width:100%;">

			<div style="margin-bottom: 50px">
				<div class="text_container text_padding">${data.pr_text }</div>
			</div>
				<div id="" class="padding_1">
					<!-- 좋아요 기능 -->
					<table style="width:100%">
						<tr>
							<td style="width:60%">
					<c:choose>
						<c:when test="${data.m_index ne null}">
							<a href='javascript: like_func();'><img
								src="/resources/img/dislike.png" id='like_img'></a>추천수<span class="good_cnt"> ${data.pr_good }</span>
						</c:when>
						<c:otherwise>
							<a href='javascript: login_need();'><img
								src="/resources/img/like.png"></a>추천수<span class="good_cnt"> ${data.pr_good }</span>
						</c:otherwise>
					</c:choose>
					</td>
					<td style="width:40%; text-align: right;">
					<div>					
					<button class="btn btn-info" onclick="location.href='/mb/pr_list'">목록으로돌아가기</button>
					</div>
					</td>
					</tr>
					</table>
				</div>

			<!--  댓글  -->
			<div class="container"
				style="border: 1px solid darkgray; margin-bottom: 30px; margin-top: 30px; padding: 5px;">
				<div class="row col-12" style="margin-right: 0px;padding-right: 0px;padding-left: 0px;margin-left: 0px;">
					<div class="col-lg-12" style="padding-right: 0px;padding-left: 0px;">
						<div class="container">
							<label for="content">댓글쓰기</label>
						</div>
						<form name="commentInsertForm">
							<div class="input-group">
							<div>
								<input type="text" class="form-control" name="com_text"
									placeholder="내용을 입력하세요." style="margin-bottom: 25px;"/>
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"
										id="commentInsertBtn">등록</button><br><input type="hidden"
									id="board_index" name="board_index" value="${data.pr_index }">
								<!-- value값 게시판에 맞게 바꾸세요 -->
								</span>
								</div>
								<div class="container">
									<b>Comments</b>
								</div>
								<div class="container" style="border: 1px solid black;">
									<div class="commentList"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 댓글 마무리 -->
	</div>
</div>
</div>

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
	var xy = "${data.lc_xy_arr}";
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

<script>

var board_index = $('#board_index').val();//게시글 넘버 변수에 넣어주기


var popupWidth = 600;
var popupHeight = 450;

var popupX = (window.screen.width / 2) - (popupWidth / 2); 
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
 
var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
  
//신고하기 창띄우기
function report(){
	//re_type 게시판 마다 맞게 바꿔주기
	 window.open("/re/report?re_type=pr&board_index="+board_index+"", '새창', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY); 
	
}

//페이지 로딩시 댓글 목록
$(document).ready(function() {
	
	//좋아요
	console.log("여기오는거지?",board_index);
	
	(function(){
		$.ajax({
			url: "../pr/like_check",
			type: "GET",
			cache: false,
			dataType: "json",
			data: 'pr_index=' +board_index,
			success: function(data) {
				 if(data.good_check == 0){
				        like_img = "/resources/img/dislike.png";
				      } else {
				        like_img = "/resources/img/like.png";
				      }
				      $('#like_img').attr('src', like_img);
				     
			},
			 error: function(request, status, error){
				 console.log("비회원")
			 }
			 })
		})();
	
	commentList();
});
 

function like_func(){

	
	  $.ajax({
		    url: "/pr/like",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'pr_index=' +board_index,
		    success: function(data) {
		      var msg = '';
		      var like_img = '';
		      msg += data.msg;
		      alert(msg);
		      if(msg != 'no'){
			      	      
		      if(data.good_check == 0){
		        like_img = "/resources/img/dislike.png";
		      } else {
		        like_img = "/resources/img/like.png";
		      }      
		      $('')
		      $('#like_img').attr('src', like_img);
		      $('.good_cnt').text(data.good_cnt);
		      
		      }else{
		    	  alert("로그인이 필요합니다.")
		      }
		      /* $('#like_check').html(data.like_check); */
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });
		} 
 
//var board_index = "${param.co_b_index}";

$('#commentInsertBtn').click(function() { //댓글 등록 버튼 클릭시
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	commentInsert(insertData); //Insert 함수호출(아래)
	console.log($('[name=commentInsertForm]').serialize());
});
//댓글 목록 
function commentList() {
	
	$.ajax({
		url : '/comment/list',
		type : 'get',
		data : {data : board_index},
		success : function(data) {
			console.log('test',JSON.stringify(data))
			//console.log(value.com_index1);
			var a = '';
			$.each(data,function(key, value) {
				a += '<div class="commentArea" style="margin-bottom: 15px;">';
				a += 	'<div class="commentInfo'+value.com_index+'">'+ '작성자 : '+ value.m_nickname;
				a +=	'&emsp; <a onclick="dedetlist('+value.com_index+')" id="a'+value.com_index+'">댓글보기</a>';
				a +=		'<a onclick="dedet('+value.com_index+');"  value="0" class="float-right">댓글</a>';
				a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';
                a +=	'</div>';             
				a += 	'<div class="commentContent'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
				/*
					if(value.com_dedetflag == 1){					
						a += '<div class="commentArea1'+value.com_index+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px; margin-left: 50px;">';
						a += 	'<div class="commentInfo'+value.com_index1+'">'+ '상위 댓글 번호 : '+ value.com_index1 ;
						a +=		'<a onclick="dedet('+value.com_index+');"  value="0" class="float-right">댓글</a>';
						a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
		                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';        	
		                a +=	'</div>'; 
		                a += 	'<div class="commentContent1'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
		                a +='</div>'
					}
					a +='</div>';
				*/
			});
			$(".commentList").html(a);
			
		}
	});
}

//대댓글 리스트
var check = true;
var checkIdx = 0;
function dedetlist(com_index){
	alert(com_index);
	var a ='';
	$.ajax({
		url : '/comment/dedetlist',
		type : 'get',
		data : {'com_index' : com_index},
		success : function(data){
			$.each(data,function(key, value){
				a += '<div class="commentArea1'+com_index+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += 	'<div class="commentInfo'+value.com_index1+'">'+ '작성자 : '+ value.m_nickname ;
				a += 		"<img src='../resources/img/reply.png' class='float-left'>";
				a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';        	
                a +=	'</div>'; 
                a += 	'<div class="commentContent1'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
                a +='</div>'
			});
			
			
			if($("#a"+com_index).text() == '댓글보기'){
				$(".commentContent" + com_index).append(a);
				$("#a"+com_index).text("댓글지우기");
			}else{
				$(".commentArea1" + com_index).remove();
				$("#a"+com_index).text("댓글보기");
			}
			

		}
	})	

}


//댓글작성
function commentInsert(insertData) {
	$.ajax({
		url : '/comment/insert',
		type : 'post',
		data : insertData,
		success : function(data) {
			if (data == 1) {
				commentList(); //댓글 작성 후 댓글 목록 reload
				alert("댓글 작성");
				 $('[name=com_text]').val('');
			}
		}		
	});
}

//댓글 수정 작성폼 만들기
function commentUpdate(com_index, com_text){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+com_index+'" value="'+com_text+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+com_index+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+com_index).html(a);
    
}
//댓글 수정
function commentUpdateProc(com_index){
    var updateContent = $('[name=content_'+com_index+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'com_text' : updateContent, 'com_index' : com_index},
        success : function(data){
            if(data == 1) 
            	alert("댓글 수정");
            	commentList(); //댓글 수정후 목록 출력 
        }
    });
}
//댓글 삭제 
function commentDelete(com_index){
    $.ajax({
        url : '/comment/delete/'+com_index,
        type : 'post',
        success : function(data){
            if(data == 1) 
         		alert("댓글 삭제");   	
            	commentList(); //댓글 삭제후 목록 출력 
        }
    });
}
//대댓글 폼생성
function dedet(com_index){
	alert(board_index);
	

		var textareaTag = "<hr><div style='margin-left:50px;'><textarea rows='2' cols='105' name='test1_"+com_index+"'></textarea>";
			//textareaTag += "<input type='hidden' id='co_b_index' name='co_b_index'>";
			textareaTag += "<button type='button'  class='btn btn-outline-secondary' style='margin-bottom:25px' onclick='dedetinsert("+com_index+")'>완료</button></div>"
	    $(".commentContent" + com_index).append(textareaTag);
		
	
	$("#dedet").text("댓글취소");

}
//대댓글 작성
function dedetinsert(com_index){
	
		alert(board_index); 
	var test1 = $('[name=test1_'+com_index+']').val();
	$.ajax({
		url : '/comment/dedetinsert',
		type : 'post',
		data : {"com_text" : test1, "com_index" : com_index, "board_index" : board_index},
		success : function(data){
			if(data == 1)				
				alert("대댓글 작성");
			 	commentList();
		}
	})
}

</script>













