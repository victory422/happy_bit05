<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous">
	
</script>
<script type="text/javascript" src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	
<script>
	let num = 1;
	function attachAddr(){
		  const str = '<input type="text" id="sale_name_sub" class="form-control"'
					+ 'placeholder="sale_name_sub" name="sale_name_sub"' 
					+ 'style="width: 85%; float: right;" required />'
					+ '<input type="hidden" id="sale_code_sub" name="sale_code_sub" value="'+num+'" />';
					num++;
		  $("#appendDiv").append(str); // JQuery를 이용해서 appendDiv라는 id값을 가져와서 그곳에 append 시킨다.
		}

	function ajaxFileUpload() {

		var form = jQuery("#form")[0];
		var formData = new FormData(form[0]);
	        formData.append("message", "ajax로 파일 전송하기");
	        formData.append("file", jQuery("#ajaxFrom")[0].files[0]);

        jQuery.ajax({
              url : "/sa/new"
            , type : "POST"
            , processData : false
            , contentType : false
            , data : formData
            , success:function(json) {
                var obj = JSON.parse(json);
			}
		});
	}
	
	
</script>
	

<html>
<title>Shop</title>

</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-10 col-xl-9 mx-auto">
				<div class="card card-signin flex-row my-5">
					<div class="card-img-left d-none d-md-flex">
						<!-- Background image for card set in CSS! -->
					</div>
					<div class="card-body">
						<h4 class="card-title text-center"><Strong>상품등록</Strong></h4>

						<div class="form-label-group">
								<label style="margin-top: 30px">제품코드</label>
							<form action="/sa/SearchProducts/page=1" method="get" id="form">
								<div class="input-group">
									<input type="text" class="form-control" id="SearchProducts"
										placeholder="Search for..." name="input_text"> 
									<button type="submit" class="btn btn-secondary" id="search">
									search</button>
								</div>
							</form> 
							<form class="form-signin" action="form" method="post">
								<input type="text" id="prod_id" class="form-control"
									value="${prod_id}" name="prod_id" required readOnly> 
								<label style="margin-top: 30px">상품이름</label>
								<input type="text" id="sale_name" class="form-control"
									placeholder="sale_name" name="sale_name" required> 
								<label style="margin-top: 30px" id="sub_name" >
								상품 서브 이름 ex)color, size, taste</label> 
								<div class=""></div>
              					<button class="btn btn-primary" style="margin-left: 30px;"
              						onclick="attachAddr(); return false;">추가
              					</button>
								<input type="text" id="sale_name_sub" class="form-control"
									placeholder="sale_name_sub" name="sale_name_sub" 
									style="width: 85%; float: right" required>
								<input type="hidden" id="sale_code_sub" name="sale_code_sub" value="0"/>
								<div id="appendDiv"></div>
								
								<label style="margin-top: 30px; width:100%;">상품가격</label>
								<input type="text" id="sale_price"
									class="form-control" placeholder="sale_price" name="sale_price"
									required> 
									
								<label style="margin-top: 30px;">상품수량</label> 
								<input type="text" id="sale_quantity" class="form-control"
									placeholder="sale_quantity" name="sale_quantity" required>
								
	                     		<label style="margin-top: 30px">썸네일</label>
	                       		<input type="file" class="btn btn-outline-secondary" 
	                       			id="ajaxFrom" name="sale_thumbmail" multiple="multiple" />
	                       			<button onclick="ajaxFileUpload()">썸네일</button>
	                       		<div style="width:100%;"></div>
			               	
								<label style="margin-top: 30px">상세페이지</label>
								<div class="row justify-content-md-center">
									<div class="col_c" style="margin-bottom: 30px">
										<div class="input-group">
											<textarea class="textarea" name="sale_detail" 
											id="sale_detail"></textarea>
											<script type="text/javascript">
												CKEDITOR.replace('sale_detail');
											</script>
										</div>
									</div>
								</div>
								
								<label style="margin-top: 30px; width:100%;">포인트적립률</label>
								<input type="text" id="sale_pointRate"
									class="form-control" placeholder="sale_pointRate" 
									name="sale_pointRate" required> 
								
								<label style="margin-top: 30px; width:100%;">상품공개여부</label>
								<input type="radio" id="sale_view" name="sale_view" 
								value="true" checked="">보이기
								&nbsp;&nbsp; 
								<input type="radio" id="sale_view" name="sale_view" 
								value="false" style="margin-bottom: 50px;">보이지 않기
							

								<div class="row justify-content-md-center">
									<button type="submit" class="btn btn-primary"
										style="width: 20%; font-weight: bold; 
										margin-bottom: 30px">미리보기</button>
									<button type="submit" id="btnsave"
										class="btn btn-outline-secondary"
										style="width: 20%; font-weight: bold; 
										margin-bottom: 30px; margin-left: 10px"
										onclick="javascript: form.action='/sa/new/regist';">
										등록</button>
								</div>

							</form>
							
							<form action="/sa/new/upload" method="post" enctype="multipart/form-data">
							    <input type="file" name="file"/>
							    <input type="submit" value="제출"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<%@ include file="../includes/footer.jsp"%>