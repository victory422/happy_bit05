<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>Home</title>
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



</script>

</head>
<body>



	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
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
					<li class="nav-item"><a class="nav-link" href="../mb/mb_006_1">나의기록</a></li>
					<li class="nav-item"><a class="nav-link" href="#">기록측정</a></li>
				</ul>
			</div>
		</div>
	</nav>



	<div class="container">
		<div class="row">
			<div class="col-md-6 col-md-offset-3" style="text-align: center;">
				<div class="table-responsive">
					<table class="table table-hover" style="margin-bottom: 2px;">
						<tr class="active"
							style="font-weight: bold; background-color: #e9ecef;">
							<td>No</td>
							<td>코스명</td>
							<td>종목</td>
							<td>기록</td>
							<td>일자</td>

						</tr>
						<tbody>
							<c:forEach var="val" items="${list }" varStatus="status">
								<tr class="success">
									<td>${val.RN}</td>
									<td>${val.PR_TITLE}</td>
									<td>${val.PR_TYPE}</td>
									<td>${val.PR_RECORD}</td>
									<td>${val.PR_RECORDDATE}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>


			</div>
		</div>



	</div>


	<script type="text/javascript">
	console.log('${list}');
		
	</script>
</body>
</html>
