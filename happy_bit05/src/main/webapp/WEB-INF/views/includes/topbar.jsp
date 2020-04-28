<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap core CSS -->
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../../resources/css/modern-business.css" rel="stylesheet">
<style>
.carousel-item {
	height: auto;
	width: 100%;
}

</style>

<script type="text/javascript">
	var session = ${sessionVO};
	var login = document.getElementById("login");
	alert(session);
	if(session == null) {
		$("#login").remove();
	}
</script>

</head>

<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="/../">자전거육상</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 코스 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" href="/lc/002/list?lc_type=육상">육상</a> <a
								class="dropdown-item" href="/lc/002/list?lc_type=자전거">자전거</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							대회 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="blog-home-1.html">메뉴1</a> <a
								class="dropdown-item" href="blog-home-2.html">메뉴2</a> <a
								class="dropdown-item" href="blog-post.html">메뉴3</a> <a
								class="dropdown-item" href="/co/co_003_1">대회게시판</a> <a
								class="dropdown-item" href="/cr/cr_001_1">대회후기게시판</a> <a
								class="dropdown-item" href="blog-post.html">메뉴3</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							장비 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="/li/li_001_1?li_b_type=후기게시판">후기
								게시판</a> <a class="dropdown-item" href="/li/li_002_1?li_b_type=추천게시판">추천
								게시판</a> <a class="dropdown-item" href="/li/li_003_1?li_b_type=관리게시판">관리
								게시판</a> <a class="dropdown-item" href="/li/li_004_1?li_b_type=장비게시판">장비
								게시판</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							트레이닝 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="/lt/lt_001_1">질문 게시판</a> <a
								class="dropdown-item" href="/lt/lt_002_1">공유 게시판</a>
						</div></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="/lo"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 내 정보 </a>
						<div class="dropdown-menu dropdown-menu-right" id="loginCheck"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item" id="login" href="/lo">로그인</a> 
							<a class="dropdown-item" href="/mp">내 정보 보기</a> 
							<a class="dropdown-item" href="/mp/myCourse/">내 관심코스</a>
							<a class="dropdown-item" href="/lo/logout">로그아웃</a>
						</div></li>

					<li class="nav-item"><a class="nav-link" href="/SP/SP_001_1">shop</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>