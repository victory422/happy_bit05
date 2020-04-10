<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>장비 게시판</title>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
<header> </header>
<div class="container">
	<form id="form" method="post">
	<input type="hidden" name="li_b_type" value="장비게시판">
		<div class="content" style="width: 75%; margin-top: 30px;">
			<div>
				<div class="col-sm-7">
					<h2>장비 게시판 ( ) 글작성</h2>
					<br>
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
						<label class="input-group-text">카테고리 
						<select
							name="li_type" class="custom-select custom-select-sm"
							style="margin-left: 10px">
								<option selected>운동 종목</option>
								<option value="전체보기">전체 보기</option>
								<option value="육상">육상</option>
								<option value="자전거">자전거</option>
						</select> 
						<select name="li_category" class="custom-select custom-select-sm"
							style="margin-left: 10px">
								<option selected>장비 종류</option>
								<option value="신발">스포츠웨어</option>
								<option value="안정장비">안정장비</option>
								<option value="신발">신발</option>
								<option value="기타">기타</option>
								<%-- <c:forEach items=”${사용할변수}” var=”넘어온데이터”>
								<option value=”${사용할변수.값}”
									${아이템.변수}
								</option> 
							</c:forEach>--%>
						</select>
						</label>
					</div>
				</div>
			</div>

			<hr>

			<div class="row justify-content-md-center">
				<div class="col_c" style="margin-bottom: 30px">
					<div class="input-group">
						<textarea class="textarea" name="li_text" id="li_place"></textarea>
						<script type="text/javascript">
							CKEDITOR.replace('li_place');
						</script>
					</div>
				</div>
			</div>

			<div class="row justify-content-md-center">
				<button type="submit" class="btn btn-primary"
					style="width: 12%; font-weight: bold; margin-bottom: 30px">미리보기</button>
				<button type="submit" id="btnsave" class="btn btn-outline-secondary"
					style="width: 12%; font-weight: bold; margin-bottom: 30px; margin-left: 10px">등
					록</button>
			</div>
		</div>
	</form>

</div>
<%@ include file="../includes/footer.jsp"%>