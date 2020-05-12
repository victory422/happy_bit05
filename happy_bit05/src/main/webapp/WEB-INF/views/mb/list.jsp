<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>modal</title>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>


<!-- Bootstrap core CSS -->
<link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.carousel-item {
	height: auto;
	width: 100%;
}

a {
	text-decoration: none;
	color: #000000;
}

a:hover {
	color: #ff0000;
}

nav ul li {
	display: inline; /*  세로나열을 가로나열로 변경 */
	border-left: 1px solid #999; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
	font: bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
	padding: 0 10px; /* 각 메뉴 간격 */
}

.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

.course-text {
	margin-bottom: 30px;
}

.input-group-prepend {
	width: 80px;
}

.map {
	margin: 0;
}
</style>

<script>
	

function course_url(j){
	alert('course_change'+j);
	$('#course_change'+j).submit();
}



(function (){
	$.ajax({
		type : "get",
		url : '../mb/list',
		success : function(data){
			console.log(data);
			htm = "<tr class='info'><td>변경할 코스를 선택해주세요.</td></tr>"

			
			htm += '<tr><td></td></tr>'
				for(var j in data) {
				
				htm += '<tr class="success" >';
				htm += '<td><a href="/mb/mb_004_1?lc_index='+data[j].lc_index+'">코스명 : '+data[j].lc_title+'</a></td>';
				htm += '</tr>';
				
				console.log(htm);
				}
			
			$('#vals').append(htm);
			
		},
		error : function(data) {
			alert("error : "+ (JSON.stringify(data)));
			console.log("error : "+ (JSON.stringify(data)));
		}
	});
}());


</script>

</head>
<body>




<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive" id="myCourse">
			<table id="vals" class="table table-hover" style="margin-top: 0px;">
			</table>

</div>


<script type="text/javascript">

	
	function sort(type) {
		console.log(type);	
		
		$.ajax({
			type : "get",
			url : '/mb_006_1/sort/',
			data : {"type" : type},
			dataType : "json",
			success : function(data){
				console.log(data);
				var htm = '';
				
				htm = '<tr class="success">';
				for(var i in data) {
					for( var j in data[i]) {
					htm = '<td>'+data[i][j]+'</td>';
					htm = '<td>'+data[i][j]+'</td>';
					htm = '<td>'+data[i][j]+'</td>';
					htm = '<td>'+data[i][j]+'</td>';
					htm = '<td>'+data[i][j]+'</td>';
					}
				}
				htm = '</tr>';
				
				document.getElementById('vals').html(htm);
				
				
				

				
				
			},
			error : function(data) {
				console.log("error : "+ (JSON.stringify(data)));
			}
		});
		
	}


	
</script>
</body>
</html>
