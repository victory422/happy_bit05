<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>관리 게시판</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<input type="hidden" name="li_b_type" value="관리게시판">
	<input type="hidden" name="page" value="1"/>
	<div class="container">
		<form method="get">
		<div style="margin-top: 30px;" class="row">
			<div class="col-md-10">
				<h1>장비게시판<small> (관리Tip)</small></h1>
			</div>
			<div class="col-md-2">				
				<select name="amount" id="list_mount">
					<option value="15">15개씩 보기</option>
					<option value="30">30개씩 보기</option>
				</select>	
			</div>
		
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
				<select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
					style="margin-left: 10px; width: 15%">
					<option value=null>장비선택</option>
					<option value="운동복">운동복</option>
					<option value="안전장비">안전장비</option>
					<option value="신발">신발</option>
					<option value="기타">기타</option>
				</select>
				<select
					id="type" name="search_filter" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
						<option value=null selected>제목</option>
						<option value="내용">내용</option>
						<option value="all">제목+내용</option>
						<option value="작성자">작성자</option>
				</select>
					<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="검색어 입력" onsubmit="page_put()"/>
			</label>
			</div>
		</div>
	</form>	
		<input type="hidden" name=page value="${page }">

	
	
	<!-- 게시글 리스트 출력 테이블 -->
	<div class="table-responsive">
				<table class="table table-hover" style="margin-top: 30px;">
					<!-- <tr><td><h2>전체글</h2></td>
					<td style="text-align: right;"><input type="checkbox"></td>
					</tr> -->
					<tr class="active" style="text-align: center;">
						<td width="8%">게시물 번호</td>
						<td width="8%">종목</td>
						<td width="32%">게시글 제목</td>
						<td width="10%">장비 종류</td>
						<td width="10%">작성자</td>
						<td width="16%">작성날자</td>
						<td width="8%">조회수</td>
						<td width="8%">좋아요</td>
					</tr>
					<tbody id="table_list">
						<c:forEach var="board" items="${list }">
							<tr class="success" style="text-align: center;">
								<td>${board.li_index }</td>
								<td>
									<c:out value="${board.li_type eq 'all'?'전체': board.li_type}"/>
								</td>
								<td onclick="location.href='/li/li_006_1?li_index=${board.li_index }&li_b_type=${board.li_b_type}&page=${page}'"><button type="button" onclick="location.href='/li/li_006_1?page=${page }&li_index=${board.li_index }&li_b_type=${board.li_b_type}'" class="btn btn-link">${board.li_title }</button></td>
								<td>${board.li_category }</td>
								<td>${board.m_index }</td>
								<td>${board.li_date }</td>
								<td>${board.li_see }</td>
								<td>${board.li_good }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
				<div id="row">
					<div class="col-md-6">
						<a href="/li/li_005_1?li_b_type=관리게시판"><button type="button" class="btn btn-success">글작성</button></a>
					</div>
			<!-- 페이징  -->
				<div class="col-md-10">
					<ul class="pagination d-flex justify-content-center">
						<c:if test="${pageUtil.prev }">
							<li class="page-item"><a class="page-link" href="/li/li_003_1?page=${pageUtil.start-1}">Previous</a></li>
						</c:if>
						<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
							<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link" href="/li/li_003_1?page=${pNum }">${pNum }</a></li>
						</c:forEach>
						<c:if test="${pageUtil.next }">
							<li class="page-item"><a class="page-link" href="/li/li_003_1?page=${pageUtil.end+1 }">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	<%@ include file="../includes/footer.jsp"%>