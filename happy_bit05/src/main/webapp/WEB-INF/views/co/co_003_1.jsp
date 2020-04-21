<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Insert title here</title>
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
	<!-- Custom styles for this template -->
<link href="../../../resources/css/modern-business.css" rel="stylesheet">

</head>
<body>
<div class="container">
<%@include file="../includes/topbar.jsp"%>
<%@include file="../includes/middle.jsp" %>
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
					<div>
						<c:forEach items="${data}" var="data">
						<a href="co_004_1?co_b_index=${data.co_b_index}" style="text-decoration: none;">
					<table class="table table-striped table-bordered table-hover">														
						<tr>
							<td rowspan="4" style="width:200px; height: 200px;">사진</td>
							<td>제목 : ${data.co_b_title}</td>
						</tr>
						<tr>
							<td>일자 : ${data.co_b_day}</td>
						</tr>
						<tr>
							<td>장소 : ${data.co_b_area}</td>
						</tr>
					</table>
					</a>								
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>
	<%@include file="../includes/footer.jsp"%>
</body>