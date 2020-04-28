<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<title>My course</title>

<style>
.redfamily {
	color: red;
}

.search-box, .close-icon, .search-wrapper {
	position: relative;
	padding: 10px;
}

.search-wrapper {
	width: 500px;
	margin: auto;
	margin-top: 50px;
}

.search-box {
	width: 80%;
	border: 1px solid #ccc;
	outline: 0;
	border-radius: 15px;
}

.search-box:focus {
	box-shadow: 0 0 15px 5px #b0e0ee;
	border: 2px solid #bebede;
}

.close-icon {
	border: 1px solid transparent;
	background-color: transparent;
	display: inline-block;
	vertical-align: middle;
	outline: 0;
	cursor: pointer;
}

.close-icon:after {
	content: "X";
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	background-color: #FA9595;
	z-index: 1;
	right: 35px;
	top: 0;
	bottom: 0;
	margin: auto;
	padding: 2px;
	border-radius: 50%;
	text-align: center;
	color: white;
	font-weight: normal;
	font-size: 12px;
	box-shadow: 0 0 2px #E50F0F;
	cursor: pointer;
}

.search-box:not (:valid ) ~ .close-icon {
	display: none;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<div class="container">
		<div style="margin-top: 30px;">
			<h1>My Course</h1>
		</div>

		<!-- 체크박스 부분 -->

		<form method="get" action="/mp/myCourse/page=1?">
			<div class="input-group mb-12" style="margin-top: 30px;">

				<label class="input-group-text col-sm-12"> <select
					id="cate_id" name="cate_id"
					class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 25%">
						<option value=null selected>카테고리</option>
						<option value="null">육상</option>
						<option value="null">자전거</option>
				</select> <input type="text" style="margin-left: 10px; width: 50%" id=""
					name="" class="search-box form-control"
					placeholder="Enter search product ID" /> <input type="submit"
					value="search" />
				</label>
			</div>
		</form>

		<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr class="active" style="font-weight: bold; background-color: #e9ecef;">
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


						<tr class="success" href="#collapse${val.rn}"
							data-toggle="collapse" aria-expanded="true"
							aria-controls="collapseOne">

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
									보기</button>
							</td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

			<div id="row">

				<!-- 페이징  -->
				<div class="col-md-6">
					<ul class="pagination justify-content-end">
						<c:if test="${pageUtil.prev }">
							<li class="page-item"><a class="page-link"
								href="/mp/myCourse/page=${pageUtil.start-1}">Previous</a></li>
						</c:if>
						<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }"
							var="pNum">
							<div class="mb-4" id="accordion" role="tablist"
								aria-multiselectable="true"></div>
							<li class="page-item ${pNum==pageUtil.dto.page?'active':''}"><a
								class="page-link" href="/mp/myCourse/page=${pNum }">${pNum }</a>
							</li>
						</c:forEach>
						<c:if test="${pageUtil.next }">
							<li class="page-item"><a class="page-link"
								href="/mp/myCourse/page=${pageUtil.end+1 }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<c:forEach var="val" items="${listVO }" varStatus="status">
					<div id="collapse${val.rn}" class="collapse" role="tabpanel"
						aria-labelledby="headingOne">
						<div class="card-body">
							<%@ include file="in_mp_001_3.jsp"%>

						</div>
					</div>
				</c:forEach>


			</div>

		</div>

	</div>



	<%@ include file="../includes/footer.jsp"%>