<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    // 인코딩
    request.setCharacterEncoding("UTF-8");
%>

<html>
<title>Insert title here</title>
</head>

<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
 
<div class="container" style="margin-top:20px; margin-bottom:20px;">
	<div class="content" style="width: 1000px">
		<form action="cr_002_1.do" method="post"> 
		<div class="row justify-content-md-center">
			<div class="col-sm-9">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text">제목</label>
					</div>
					<input type="text" class="form-control" name="co_r_title">
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="input-group mb-3">
					<select class="custom-select" id="inputGroupSelect03" name="co_r_type">
						<option selected>분류</option>
						<option value="사이클">사이클</option>
						<option value="마라톤">마라톤</option>
					</select>
				</div>
			</div>
			
		</div>		
		<!--
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">대회이름</label>
				</div>
				<input type="text" class="form-control" name="co_r_">
			</div>		
		</div>
-->
		<hr>

		<div class="row justify-content-md-center">
			<div class="col_c" style="margin-bottom: 100px">
				<div class="input-group">
					<textarea class="form-control" id="p_content" name="co_r_text"></textarea>
					
					<script type="text/javascript">
							CKEDITOR.replace('p_content')                                                                              
						</script>
				</div>
			</div>
		</div>
		<div class="row justify-content-md-center">
			<button type="submit" class="btn btn-outline-secondary"
				style="width: 20%; font-weight: bold">등 록</button>
		</div>
		</form>
	</div>
</div>


<%@include file="../includes/footer.jsp"%>