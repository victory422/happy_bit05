<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>트레이닝게시판</title>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
<header> </header>
<div class="container">
	<div class="content" style="width: 75%; margin-top: 30px;">
		<div>
			<div class="col-sm-7">
			<h2>트레이닝 게시판 () )글작성</h2> <br>
				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<label class="input-group-text">제목</label>
					</div>
					<input type="text" class="form-control">
				</div>
			</div>
		</div>
		<br>
		<div>
			<div class="col-sm-8">
				<div class="input-group mb-2">
					<label class="input-group-text">카테고리 <select
						class="custom-select custom-select-sm" style="margin-left: 10px">
							<option selected>운동 종목</option>
							<option value="1">전체 보기</option>
							<option value="2">육상</option>
							<option value="3">자전거</option>
					</select> <select class="custom-select custom-select-sm"
						style="margin-left: 10px">
							<option selected>숙련도</option>
							<option value="1">전체 보기</option>
							<option value="2">초심자</option>
							<option value="3">숙련자</option>
					</select>
					</label>
				</div>
			</div>
		</div>

		<hr>

		<div class="row justify-content-md-center">
			<div class="col_c" style="margin-bottom: 30px">
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
				style="width: 20%; font-weight: bold; margin-bottom: 30px">등
				록</button>
		</div>
	</div>
</div>
<%@ include file="../includes/footer.jsp"%>