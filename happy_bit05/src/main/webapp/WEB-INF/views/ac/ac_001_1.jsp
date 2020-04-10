<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<title>Insert title here</title>
</head>

<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
 
<div class="container">
	<div class="content" style="width: 1000px">
		<form action="ac_001_1" method="post">
		<div class="row justify-content-md-center">
			<div class="col-sm-9">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text">제목</label>
					</div>
					<input type="text" class="form-control" name="co_b_title">
				</div>
			</div>
			<div class="col-sm-3">
				<div class="input-group mb-3" width: 800px;>
					<select class="custom-select" id="inputGroupSelect03">
						<option selected>분류</option>
						<option value="1">사이클</option>
						<option value="2">마라톤</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row justify-content-md-center">
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">일자</label>
				</div>
				<input type="text" class="form-control" id="co_b_day">
			</div>
		</div>
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">종목</label>
				</div>
				<input type="text" class="form-control" id="co_b_type">
			</div>
		</div>
		</div>
		<hr>

		<div class="row justify-content-md-center">
			<div class="col_c" style="margin-bottom: 100px">
				<div class="input-group">
					<textarea class="form-control" id="p_content"></textarea>
					
					<script type="text/javascript">
							CKEDITOR.replace('p_content')                                                                              
						</script>
				</div>
			</div>
		</div>

		<div class="row justify-content-md-center">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
				</div>
				<div class="custom-file">
					&nbsp;<input type="file" class="form-control-file"
						id="exampleFormControlFile1">
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