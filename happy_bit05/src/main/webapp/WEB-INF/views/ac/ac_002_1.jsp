<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../../../resources/css/modern-business.css" rel="stylesheet">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">Board List page</div>
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>#번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<c:forEach items="${data}" var="data">
							<tr>
								<td>${data.co_b_index}</td>
								<td>${data.co_b_title}</td>
								<td>${data.co_b_text}</td>
								<td></td>
								<td></td>
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
				<!-- /.table-responsive -->
				<form role="form" action="ac_002_1.do" method="post">
					<button type="submit" class="btn btn-default">글 작성</button>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</body>
</html>