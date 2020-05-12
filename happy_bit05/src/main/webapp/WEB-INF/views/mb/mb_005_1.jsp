<%@ include file="../includes/mobile_topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<title>코스 변경</title>
</head>
<body>

<form method="get" action="/mp/myCourse/">
		<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive" id="myCourse">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr class="active"
					style="font-weight: bold; background-color: #e9ecef;">
					<td>No</td>
					<td>썸네일</td>
					<td>제목</td>
					<td>코스유형</td>
					<td>거리<small>(km)</small></td>
					<td>도보시간</td>
					<td>자전거시간</td>
					<td>지역</td>
					<td>추천수</td>
					<td>평균기록</td>
					<td>등록일</td>
					<td>원글보기</td>

				</tr>
				<c:if test="${empty listVO }">
							${"등록된 관심코스가 없습니다."}
				</c:if>
				<tbody id="paging">
					<c:forEach var="val" items="${listVO }" varStatus="status">

						<tr id="corseDetail" class="success" 
							onclick="downPage('${val.rn}','${val.lc_type}','${val.lc_title}',
							'${val.m_index}','${val.lc_distance}','${val.lc_record}',
							'${val.lc_date}','${val.lc_index}','${val.lc_xy_arr}')">

							<td>${val.rn}</td>
							<td>${val.lc_thumbnail}</td>
							<td>${val.lc_title}</td>
							<td>${val.lc_type}</td>
							<td>${val.lc_distance}</td>
							<td>${val.lc_run}</td>
							<td>${val.lc_cycle}</td>
							<td>${val.lc_address}</td>
							<td>${val.lc_good}</td>
							<td>${val.lc_record}</td>
							<td>${val.lc_date}</td>
							<td>
								<button
									onclick="location.href='/lc/003/lc_get?lc_index=${val.lc_index}'">
									보기
								</button>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
</div>
</form>

</body>
</html>