<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!-- Custom styles for this template -->
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
				<!-- 페이징  -->
					<div class="col-md-10">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link" href="/co/co_003_1?page=${pageUtil.start-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
								<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link" href="/co/co_003_1?page=${pNum }">${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link" href="/co/co_003_1?page=${pageUtil.end+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>

<script>

$(document).ready(function(){

	
	
	//alert(${param.test1});
	
})

</script>
	<%@include file="../includes/footer.jsp"%>		
	
	
	
