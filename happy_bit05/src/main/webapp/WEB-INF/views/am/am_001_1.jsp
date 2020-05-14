<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/sidebar.jsp" %>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

  
  
  
<div style="padding-left: 280px;padding-right: 100px; ">
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<!-- /.panel-heading -->
				<div class="panel-body">
				
	<h3 style="margin-top: 30px;">신고 회원 목록</h3>
	<hr>
				
				<form method="get">
					<!-- 체크박스 부분 -->
		<div class="input-group mb-12 d-flex bd-highlight" style="margin-top: 30px;">
			
			<label class="input-group-text col-sm-12">
			
				<select
				
					id="type" name="type" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
					
					<option value=null>종목선택</option>
					<option value="육상" 
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '육상'?'selected':''}"/>
					</c:forEach>
					>육상 </option>
					<option value="자전거" 
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '자전거'?'selected':''}"/>
					</c:forEach>
					>자전거</option>
					
				</select> 
	
				<!-- <select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
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
				</select> -->
				
				<select
					id="type" name="search_filter" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
						<option value=null selected>제목</option>
						<option value="내용">내용</option>
						<option value="all">제목+내용</option>
						<option value="장소">장소</option>
				</select>
					<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="검색어 입력" onsubmit="page_put()"/>
			</label>
			
			</div>
			</form>
					<table class="table table-striped table-bordered table-hover" style="margin-top: 30px;">
						<thead>
							<tr>
								<th>회원 번호</th>
								<th>회원 아이디</th>
								<th>회원 이름</th>
								<th>회원 닉네임</th>
								<th>회원 전화번호</th>
								<th>신고당한 횟수</th>
								<th>상태</th>
								
							</tr>
						</thead>
						<c:forEach items="${data}" var="data">
							<tr>
								<td><a style="color:#4c3527;"href="am_003_1?m_index=${data.m_index}">${data.m_index}</a></td>
								<td><a style="color:#4c3527;"href="am_003_1?m_index=${data.m_index}">${data.m_id}</a></td>
								<td><a style="color:#4c3527;"href="am_003_1?m_index=${data.m_index}">${data.m_name}</a></td>
								<td><a style="color:#4c3527;"href="am_003_1?m_index=${data.m_index}">${data.m_nickName}</a></td>
								<td>${data.m_tel}</td>
								<td>${data.m_count}</td>
								<c:if test="${data.m_state eq '1' }">
								<td><button type="button" class="btn btn-secondary disposechange">주의</button></td>
								</c:if>
								<c:if test="${data.m_state eq '2' }">
								<td><button type="button" class="btn btn-danger disposechange">블랙리스트</button></td>
								</c:if>
								<c:if test="${data.m_state eq '3' }">
								<td><button type="button" class="btn btn-danger disposechange">회원삭제</button></td>
								</c:if>
								
							</tr>
					</c:forEach> 
						</table>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content"></div>

						</div>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	</div>

</body>
</html>