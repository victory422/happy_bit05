<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!-- Navigation -->
	<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
				<a class="navbar-brand" href="/mb/mb_003_1">BnR</a>
				<button class="navbar-toggler navbar-toggler-right" type="button"
					data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav">
						<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 코스보기 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="nav-link" href="/mb/lc_002_1?lc_type=육상">육상</a> <a
								class="nav-link" href="/mb/lc_002_1?lc_type=자전거">자전거</a>
						</div></li>
						<li class="nav-item"><a class="nav-link" href="/mb/myCourse">기록재기</a></li>
						<li class="nav-item"><a class="nav-link" href="/mb/mb_007_1">나의기록보기</a></li>
						<li class="nav-item"><a class="nav-link" href="/mb/logout" onclick="logout()">로그아웃</a></li>
					</ul>
			</div>
		</div>
	</nav>
	
	
	<script type="text/javascript">
		if('${sessionVO}'=="" && (sessionStorage.getItem("sessionScript")=="" || sessionStorage.getItem("sessionScript")==null )) {
			console.log("로그인정보가 없습니다.");
			var myInfo = document.getElementById('myInfo');
			myInfo.text = "로그인";
			myInfo.setAttribute('href','/lo');
			myInfo.setAttribute('data-toggle','');
		}else {
			
		}
		
		function logout() {
			sessionStorage.removeItem("sessionScript");
			console.log("로그아웃 중. "+sessionStorage.getItem("sessionScript"));
		}
	</script>