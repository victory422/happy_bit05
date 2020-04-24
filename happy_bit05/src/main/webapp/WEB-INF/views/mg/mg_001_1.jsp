
<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>메세지함</title>

<h1>메세지함</h1>
</head>


<body>
<%@ include file="../includes/middle.jsp"%>


<!-- 메세지함 출력 테이블 -->
			<div class="table-responsive">
				<table class="table table-hover" style="margin-top: 30px;">
					<!-- <tr><td><h2>전체글</h2></td>
					<td style="text-align: right;"><input type="checkbox"></td>
					</tr> -->
					<tr class="active" style="text-align: center;">
						<td width="8%">일자</td>
						<td width="8%">ID</td>
						<td width="32%">발송유형</td>
						<td width="10%">제목</td>
						<td width="10%">내용</td>
						<td width="16%">삭제</td>
					</tr>
<%-- 					<tbody id="table_list">
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
							</tr>
						</c:forEach>
					</tbody>
 --%>				</table>
			</div>

<%@ include file="../includes/footer.jsp"%>
