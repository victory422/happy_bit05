<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<title>Login</title>
<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
	    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
     nav ul lc {
            display:inlcne;                         /*  세로나열을 가로나열로 변경 */
            border-left:1px solcd #999;           /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
			font:bold 12px Dotum;                     /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
            padding:0 10px;                         /* 각 메뉴 간격 */
}


	.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('https://t1.daumcdn.net/localcmg/localcmages/07/mapapidoc/mini_circle.png');}    
	.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solcd #ccc;border-bottom:2px solcd #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
	.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
	.number {font-weight:bold;color:#ee6152;}
	.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('https://t1.daumcdn.net/localcmg/localcmages/07/mapapidoc/vertex_white_small.png')}
	.distanceInfo {position:relative;top:5px;left:5px;lcst-style:none;margin:0;}
	.distanceInfo .label {display:inlcne-block;width:50px;}
	.distanceInfo:after {content:none;}
	.course-text {margin-bottom:30px;}
	.input-group-prepend {width:80px;}
	.map {margin:0;}
	body{width: 100%; 
    padding-right: 0px;
	}
	
	/*테이블 css  */
	@import "https://fonts.googleapis.com/css?family=Montserrat:300,400,700";
.rwd-table {
  margin: 1em 0;
  min-width: 300px;
}
.rwd-table tr {
  border-top: 1px solid #ddd;
  border-bottom: 1px solid #ddd;
}
.rwd-table th {
  display: none;
}
.rwd-table td {
  display: block;
}
.rwd-table td:first-child {
  padding-top: .5em;
}
.rwd-table td:last-child {
  padding-bottom: .5em;
}
.rwd-table td:before {
  content: attr(data-th) ": ";
  font-weight: bold;
  width: 6.5em;
  display: inline-block;
}
@media (min-width: 480px) {
  .rwd-table td:before {
    display: none;
  }
}
.rwd-table th,
.rwd-table td {
  text-align: left;
}
@media (min-width: 480px) {
  .rwd-table th,
  .rwd-table td {
    display: table-cell;
    padding: .25em .5em;
  }
  .rwd-table th:first-child,
  .rwd-table td:first-child {
    padding-left: 0;
  }
  .rwd-table th:last-child,
  .rwd-table td:last-child {
    padding-right: 0;
  }
}

body {
  padding: 0 2em;
  font-family: sans-serif;
  color: #444;
  background: #eee;
}

h1 {
  font-weight: normal;
  letter-spacing: -1px;
  color: #34495E;
}

.rwd-table {
  background: #34495E;
  color: #fff;
  border-radius: .4em;
  overflow: hidden;
}
.rwd-table tr {
  border-color: #46637f;
}
.rwd-table th,
.rwd-table td {
  margin: .5em 1em;
}
@media (min-width: 480px) {
  .rwd-table th,
  .rwd-table td {
    padding: 1em !important;
  }
}
.rwd-table th,
.rwd-table td:before {
  color: #dd5;
}
</style>
<!-- Navigation -->
<%@ include file="../includes/mobile_topbar.jsp"%>
</head>

<script type="text/javascript">

	$(document).ready(function(){
		//페이징 이동 처리
		var actionForm = $("#actionForm");
		var searchForm = $("#searchForm");
		
		$(".page-lcnk").on('clcck', function(e){
			e.preventDefault();
			
			console.log('clcck');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		
		//게시글 조회
		$(".move").on('clcck', function(e){
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='lc_index' value='" +
			$(this).attr("href") + "'>'");	
			
			actionForm.attr("action", "../../lc/003/lc_get");
			actionForm.submit();
		});
		
		//게시글 검색
		$("#searchForm a").on('clcck', function(e){

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
	});
	
	
</script>

<body style="padding-right: 0px;padding-left: 0px;">
<main role="main">
		<!-- 게시글 리스트 출력 테이블 -->
			<div style="width: 100%;">
							<h1 style="text-align: center;"><c:out value="${type eq 'all'?'전체': type}"/> 코스보기</h1>
		<h4 style="text-align: center;">관심있는 코스를 클릭해주세요.</h4>
				<table class="rwd-table" style="width:100%;table-layout:fixed;">
					<!-- <tr><td><h2>전체글</h2></td>
					<td style="text-alcgn: right;"><input type="checkbox"></td>
					</tr> -->
					<tr class="active">
						<th width="47%">게시글 제목</th>
						<th width="17%">작성자</th>
						<th width="18%">작성날짜</th>
						<th width="17%">거리<small>(km)</small></th>
					</tr>
					<tbody id="table_lcst">
						<c:forEach var="board" items="${lc_list }">
							<tr class="success" onclick="location.href='/mb/lc_get?lc_index=${board.lc_index }'">
								<td data-th="제목"  >${board.lc_title }</td>
								<td data-th="닉네임" >${board.m_nickname }</td>
								<td data-th="날짜"  >${board.lc_date }</td>
								<td data-th="거리(km)" >${board.lc_distance }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
</main>
</body>