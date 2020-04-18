<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>후기 게시판</title>

<style>

	.redfamily {
	color: red;	
}
.search-box,.close-icon,.search-wrapper {
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
	border:1px solid transparent;
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
	z-index:1;
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
.search-box:not(:valid) ~ .close-icon {
	display: none;
}

</style>

 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
<%@ include file="../includes/middle.jsp"%>
	<form method="get" action="/li/li_005_1">
<input type="hidden" name="li_b_type" value="관리게시판">
	<div class="container">
	<div style="margin-top: 30px;">
		<h1>장비게시판<small> (자랑게시판)</small></h1>
		</div>
		
		<!-- 체크박스 부분 -->
	<div class="input-group mb-12" style="margin-top: 30px;">
	
		<label class="input-group-text col-sm-12">
			<select
				id="type" name="type" class="custom-select custom-select-sm-1"
				style="margin-left: 10px; width: 15%">
				<option value=null selected>종목선택</option>
				<option value="육상">육상</option>
				<option value="자전거">자전거</option>
			</select> 
			<select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
				style="margin-left: 10px; width: 15%">
				<option value=null selected>장비선택</option>
				<option value="스포츠웨어">스포츠웨어</option>
				<option value="안전장비">안전장비</option>
				<option value="신발">신발</option>
				<option value="기타">기타</option>
								<%-- <c:forEach items=”${사용할변수}” var=”넘어온데이터”>
								<option value=”${사용할변수.값}”
									${아이템.변수}
								</option> 
							</c:forEach>--%>
			</select>
			<select
				id="type" name="search_filter" class="custom-select custom-select-sm-1"
				style="margin-left: 10px; width: 15%">
					<option value=null selected>제목</option>
					<option value="내용">내용</option>
					<option value="all">제목+내용</option>
					<option value="작성자">작성자</option>
			</select>
			<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="Enter search term" />
		</label>
		
	</div>

	
	
	<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive">
			<table class="table table-hover" style="margin-top: 30px;">
				<!-- <tr><td><h2>전체글</h2></td>
				<td style="text-align: right;"><input type="checkbox"></td>
				</tr> -->
				<tr class="active">
					<td>게시물 번호</td>
					<td>종목</td>
					<td>게시글 제목</td>
					<td>장비 종류</td>
					<td>작성자</td>
					<td>작성날자</td>
				</tr>
				<tbody id="table_list">
					<c:forEach var="board" items="${list }">
					
						<tr class="success">
							<td><a href="/li/li_006_1?index=${board.li_index }">${board.li_index }</a></td>
							<td>${board.li_type }</td>
							<td>${board.li_title }</td>
							<td>${board.li_category }</td>
							<td>${board.m_index }</td>
							<td>${board.li_date }</td>
						</tr>
					
					</c:forEach>
				</tbody>
			</table>
			
			<div id="row">
				<div class="col-md-6">
					<a href="/li/li_005_1?li_b_type=자랑게시판"><button type="button" class="btn btn-success">글작성</button></a>
				</div>
			<!-- 페이징  -->
				<div class="col-md-6">
					<ul class="pagination justify-content-end">
						<c:if test="${pageUtil.prev }">
							<li class="page-item"><a class="page-link" href="/li/li_001_1?page=${pageUtil.start-1}">Previous</a></li>
						</c:if>
						<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
							<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link" href="/li/li_001_1?page=${pNum }">${pNum }</a></li>
						</c:forEach>
						<c:if test="${pageUtil.next }">
							<li class="page-item"><a class="page-link" href="/li/li_001_1?page=${pageUtil.end+1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	</form>	
	<%@ include file="../includes/footer.jsp"%>
