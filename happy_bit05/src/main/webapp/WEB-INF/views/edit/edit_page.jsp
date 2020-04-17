<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>Insert title here</title>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
<header>
</header>
<div class="container">
	<div class="content" style="width: 75%;  margin-top: 30px;">
		<div class="row justify-content-md-center">
			<div class="col-sm-9">
				<div class="input-group mb-4">
					<div class="input-group-prepend">
						<label class="input-group-text">제목</label>
					</div>
					<input type="text" class="form-control">
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="input-group mb-3">
					<select class="custom-select" id="inputGroupSelect03">
						<option selected>분류</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
				</div>
			</div>
		</div>

		<hr>

		<div class="row justify-content-md-center">
			<div class="col_c" style="margin-bottom: 30px" >
				<div class="input-group">
					<textarea class="textarea" id="p_content"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace('p_content');
					</script>
				</div>
			</div>
		</div>

		<div class="row justify-content-md-center">
			<button type="submit" class="btn btn-outline-secondary"
				style="width: 20%; font-weight: bold; margin-bottom: 30px">등 록</button>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>