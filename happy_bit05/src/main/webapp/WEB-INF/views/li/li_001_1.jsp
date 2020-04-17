<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>후기 게시판</title>
</head>
<body background-color:#fff;>
	<div class="container">
		<h1>XXXXXXX 게시판</h1>
		<div class="table-responsive">
			<table class="table">
				<tr>
					<td>게시물 번호</td>
					<td>게시글 제목</td>
					<td>장비 분류</td>
					<td>숙련도</td>
					<td>작성자</td>
					<td>작성날자</td>
				</tr>
				<c:forEach var="board" items="${list }">
					<tr>
						<td>${board.li_index }</td>
						<td>${board.li_b_type }</td>
						<td>${board.li_category }</td>
						<td>${board.li_date }</td>
						<td>${board.li_text }</td>
						<td>${board.li_type }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>