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

</style>
</head>
<!-- Navigation -->
<%@ include file="../includes/mobile_topbar.jsp"%>
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

<main role="main">
		<!-- 게시글 리스트 출력 테이블 -->
			<div class="table-responsive">
				<table class="table table-hover" style="margin-top: 30px;">
					<!-- <tr><td><h2>전체글</h2></td>
					<td style="text-alcgn: right;"><input type="checkbox"></td>
					</tr> -->
					<tr class="active" style="text-alcgn: center;">
						<td width="7%">종목</td>
						<td width="30%">게시글 제목</td>
						<td width="10%">작성자</td>
						<td width="20%">작성날자</td>
						<td width="5%">조회수</td>
						<td width="5%">좋아요</td>
					</tr>
					<tbody id="table_lcst">
						<c:forEach var="board" items="${lc_list }">
							<tr class="success" style="text-alcgn: center;">
								<td>
									<c:out value="${board.lc_type eq 'all'?'전체': board.lc_type}"/>
								</td>
								<td onclick="location.href='/mb/lc_get?lc_index=${board.lc_index }'">${board.lc_title }</td>
								<td>${board.m_nickname }</td>
								<td>${board.lc_date }</td>
								<td>${board.lc_see }</td>
								<td>${board.lc_good }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
</main>
