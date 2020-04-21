<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<html>
<title>Insert title here</title>
</head>

<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
 
<div class="container" style="margin-top:20px; margin-bottom:20px;">
	<div class="content" style="width: 1000px">
		<form action="ac_001_1.do" method="post"> 
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
				<div class="input-group mb-3">
					<select class="custom-select" id="inputGroupSelect03" name="co_b_type">
						<option selected>분류</option>
						<option value="사이클">사이클</option>
						<option value="마라톤">마라톤</option>
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
				<input type="text" class="form-control" name="co_b_day">
			</div>
			  
		</div>
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">장소</label>
				</div>
				<input type="text" class="form-control" name="co_b_area">
			</div>
		
		</div>
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">접수기한</label>
				</div>
				<input type="text" class="form-control" name="co_b_period">	
			</div>
		</div>
		
		<div class="col-sm-6 ac_sou">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">기념품</label>
				</div>
				
				<input type="text" class="form-control" name="co_souvenir" id="ac_souvenirid">
				<button class="btn btn-primary" type="button" id="ac_souveniradd">추가</button>	
				
			</div>
		</div>
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">참가비</label>
				</div>
				<input type="text" class="form-control" name="co_b_price">	
			</div>
		</div>
		<div class="col-sm-6 ac_rat">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">종목/등급</label>
				</div>
				
				<input type="text" class="form-control" name="co_rating" id="ac_rating">
				<button class="btn btn-primary" type="button" id="ac_ratingadd">추가</button>	
				
			</div>
		</div>
		</div>
		
		
		<hr>

		<div class="row justify-content-md-center">
			<div class="col_c" style="margin-bottom: 100px">
				<div class="input-group">
					<textarea class="form-control" id="p_content" name="co_b_text"></textarea>
					
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

 
<script>
 

$('#ac_souveniradd').click(function(){
		
	var ac_text = '';
	
	ac_text += '<input name="co_souvenir" value="'+$('#ac_souvenirid').val() +'">';	
	
	$('.ac_sou').append(ac_text);
	
	$('#ac_souvenirid').val('');

});


$('#ac_ratingadd').click(function(){

	var ra_text = '';
	
	ra_text += '<input name ="co_rating" value="'+$('#ac_rating').val() +'">';
	
	$('.ac_rat').append(ra_text);
	
	$('#ac_rating').val('');
	
})






























</script>


<%@include file="../includes/footer.jsp"%>