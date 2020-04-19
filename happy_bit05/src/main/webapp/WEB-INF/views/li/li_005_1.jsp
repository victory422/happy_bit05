<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<title>장비 게시판(글작성)</title>
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
						<h1>장비 게시판 <small> ${b_type }  글작성 </small> </h1> <!-- 현재 임시방편 게시판 유형 결정되면 변수로 변경 -->
						<br>
						<div class="input-group mb-1">
							<div class="input-group-prepend">
								<label class="input-group-text">제목</label>
							</div>
							<input name="li_title" type="text" class="form-control">
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
									<option selected>종목선택</option>
									<option value="전체보기">전체 보기</option>
									<option value="육상">육상</option>
									<option value="자전거">자전거</option>
							</select> 
							<select name="li_category" class="custom-select custom-select-sm"
								style="margin-left: 10px">
									<option selected>장비선택</option>
									<option value="스포츠웨어">스포츠웨어</option>
									<option value="안전장비">안전장비</option>
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
	
	<!--  썸네일 -->
			<!-- 	      <div class="row justify-content-md-center">
		            <div class="input-group mb-3">
		              <div class="input-group-prepend">
		                <span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
		              </div>
		              <div class="custom-file">
		                  &nbsp;<input name="li_thumbnail" type="file" class="form-control-file" id="exampleFormControlFile1">
		              </div>
		            </div>
		      </div> -->
	
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