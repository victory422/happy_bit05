<%@ include file="../includes/mobile_topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta charset="utf-8">
<title>기록 자랑 상세 페이지</title>
<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>


    <!-- Bootstrap core CSS -->
    <link href="/happy_bit05/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

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
	
	.custom_padding{padding-right: 0px;padding-left: 0px;}
</style>
</head>
	<body>
		<div class="container">
			<form method="get">
		
				<!-- 체크박스 부분 -->
				<div class="input-group mb-12 d-flex bd-highlight"
					style="margin-top: 30px;">
		
					<label class="input-group-text col-sm-12"> <select id="type"
						name="type" class="custom-select custom-select-sm-1"
						style="margin-left: 10px; width: 15%">
		
							<option value=null>종목선택</option>
							<option value="육상"
								<c:forEach var="type1" items="${type }">
							<c:out value="${type1 eq '육상'?'selected':''}"/>
							</c:forEach>>육상
							</option>
							<option value="자전거"
								<c:forEach var="type1" items="${type }">
							<c:out value="${type1 eq '자전거'?'selected':''}"/>
							</c:forEach>>자전거</option>
				
					</select> <!-- <select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
							style="margin-left: 10px; width: 15%">
							<option value=null>장비선택</option>
							<option value="운동복">운동복</option>
							<option value="안전장비">안전장비</option>
							<option value="신발">신발</option>
							<option value="기타">기타</option>
											<%-- <c:forEach items=”${사용할변수}” var=”넘어온데이터”>
											<option value=”${사용할변수.값}”
												${아이템.변수}
											</option> 
										</c:forEach>--%>
						</select> --> <select id="type" name="search_filter"
						class="custom-select custom-select-sm-1"
						style="margin-left: 10px; width: 15%">
							<option value=null selected>제목</option>
							<option value="내용">내용</option>
							<option value="all">제목+내용</option>
					</select> <input type="text" style="width: 55%" id="input_text"
						name="input_text" class="search-box form-control"
						placeholder="검색어 입력" onsubmit="page_put()" />
					</label>
		
				</div>
			</form>
			<table class="table table-striped table-bordered table-hover"
				style="margin-top: 30px;">
				<thead>
					<tr>
						<th>제목</th>
						<th>일자</th>
						<th>기록</th>
						<th>추천수</th>
						<th>조회수</th>
					</tr>
				</thead>
		
				<tbody>
					<c:forEach items="${data}" var="data">	
						<tr onClick = "location.href='/pr/pr_003_1?pr_index=${data.pr_index}'">			
							<td>${data.pr_title }</td>
							<td>${data.pr_recordDate }</td>
							<td>${data.pr_record }</td>
							<td>${data.pr_good }</td>
							<td>${data.pr_see }</td>
						</tr>
					</c:forEach>
				</tbody>
		
			</table>
		</div>
	</body>
</html>