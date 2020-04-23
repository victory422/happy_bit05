<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@include file="../includes/middle.jsp" %>
<div class="container">
	<div class="row col-12" >
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">

					<div class="col-sm-3">
						<div class="input-group mb-4">
							<select class="custom-select" name="test">
								<option selected>분류</option>
								<option value="사이클">사이클</option>
								<option value="마라톤">마라톤</option>
							</select>
						</div>
					</div>
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>내용</th>							
								<th>일자</th>
								<th>종목</th>
								<th>조회수</th>
								<th>추천수</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${data}" var="data">
							<tr>
								<td>${data.co_r_index }</td>
								<td>${data.co_r_title}</td>
								<td>${data.co_r_text }</td>
								<td>${data.co_r_day}</td>
								<td>${data.co_r_type }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
					<form role="form" action="cr_002_1" method="get">
					<button type="submit" class="btn btn-primary float-right">글작성</button>
				</form>								
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>
	<%@include file="../includes/footer.jsp"%>
</body>