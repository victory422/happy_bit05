<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>장비 게시판</title>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<%@ include file="../includes/middle.jsp"%>
	<div class="container">
		<form id="form" method="post">
		
			<div class="content" style="width: 75%; margin-top: 30px;">
				<div>
					<div class="col-sm-12">
						<h1>트레이닝 게시판 <small> ${b_type }  글작성 </small> </h1> <!-- 현재 임시방편 게시판 유형 결정되면 변수로 변경 -->
						<br>
						<div class="input-group mb-1">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input name="lt_title" type="text" class="form-control">
						</div>
					</div>
				</div>
				<br>
				<div>
					<div class="col-sm-8">
						<div class="input-group mb-2">
							<label class="input-group-text">카테고리 
							<select
								name="lt_type" class="custom-select custom-select-sm"
								style="margin-left: 10px">
									<option selected>종목선택</option>
									<option value="전체보기">전체 보기</option>
									<option value="육상">육상</option>
									<option value="자전거">자전거</option>
							</select> 
							<select
								name="lt_tier" class="custom-select custom-select-sm"
								style="margin-left: 10px">
									<option selected>난이도</option>
									<option value="전체">전체</option>
									<option value="초심자">초심자</option>
									<option value="숙련자">숙련자</option>
							</select> 
							</label>
						</div>
					</div>
				</div>
	
				<hr>
	
				<div class="row justify-content-md-center">
					<div class="col_c" style="margin-bottom: 30px">
						<div class="input-group">
							<textarea class="textarea" name="lt_text" id="lt_place"></textarea>
							<script type="text/javascript">
								CKEDITOR.replace('lt_place');
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