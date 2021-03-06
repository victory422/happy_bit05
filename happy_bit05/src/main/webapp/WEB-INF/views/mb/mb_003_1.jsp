<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
    <style>
     .container {
            margin:0px 0px 0px 0px; /* 위쪽 오른쪽 아래쪽 왼쪽 마진속성 한번에 주기 */
            padding:0px 0px 0px 0px; /* 위 오른쪽 아래쪽 왼쪽 패딩속성 한번에 주기 */
        }
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
.a{
	display: block;
	margin-right: 0;
    margin-left: 0;
    text-align: center;	
}
.btn_inline{
	display: inline-block;
	width:49%;
}
.btn-lg{
padding: 20px 16px;
}
.button4 {background-color: #e7e7e7; color: black;} 
/* Gray */



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
<!-- Navigation -->
<%@ include file="../includes/mobile_topbar.jsp"%>
</head>



<body>
<div class="container" style="max-width: 100%;">
	<div class="row a" style="text-align: center;">
		<h2>${member.m_nickName }님 환영합니다!</h2>
	</div>
	<div class="container" style="max-width: 100%;">
		<br>
		<button type="button" class="btn btn-success btn-lg btn_inline" onclick="location.href='/mb/lc_002_1?lc_type=자전거'">자전거 코스</button>
		<button type="button" class="btn btn-success btn-lg btn_inline" onclick="location.href='/mb/lc_002_1?lc_type=육상'">육상 코스</button>
		<br>
		<br>
		<button type="button" class="btn btn btn-primary btn-lg btn-block" onclick="location.href='/mb/myCourse'">기록 재기</button>
		<br>
		<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='/mb/mb_007_1'">기록 업로드하기</button>
		<br>
		<button type="button" class="btn btn-info btn-lg btn-block" onclick="location.href='/mb/pr_list'">기록 보기</button>
		<br>
		<button type="button" class="btn btn-default btn-lg btn-block" onclick="info()">사용 설명</button>
		<br>
	</div>
</div>
</body>
	
	<script type="text/javascript">
		function info(){
			alert('1.종목을 선택한다. \n 2.관심코스로 등록한다.\n 3.기록을 잰다. \n 4.기록을 업로드한다. \n 5.다른사람들과 소통한다.')
		}
	</script>
</html>