<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="row" style="margin-top: 50px; margin-bottom: 50px;">
		<div class="col-md-4">
			<a href="#"> <img class="img-fluid rounded mb-3 mb-md-0"
				src="http://placehold.it/400x400" alt="">
			</a>
		</div>
		<div class="col-md-8">
			<div class="card h-100">
				<h5 class="card-header">개인기록</h5>

				<!--=======================================================-->
				<div class="table-responsive">
					<table class="table table-hover" style="margin-top: 30px;">
						<tr class="active">
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
								<tr class="success" onclick="location.href='#'">
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
					</div>
				</div>


				<!--=======================================================-->



			</div>


		</div>
	</div>


</body>
</html>
