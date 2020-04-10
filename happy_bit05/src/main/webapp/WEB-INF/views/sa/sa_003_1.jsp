<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous">
	
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
						<h5 class="card-title text-center">상품등록</h5>

						<div class="form-label-group">
							<form action="SearchProducts/" method="post">
								<div class="input-group">
									<input type="text" class="form-control" id="SearchProducts"
										placeholder="Search for..." name="str"> 
									<span class="input-group-btn"> 
										<input type="submit" class="btn btn-secondary" value="search" type="button">
									</span>
								</div>
							</form>

							<form class="form-signin" action="regist/">
								<input type="text" id="prod_id" class="form-control"
									value="${prod_id}" name="sp_prod_id" required readOnly> 
									<label>제품코드</label> 
									<input
									type="text" id="sale_name" class="form-control"
									placeholder="sale_name" name="sale_name" required> 
									<label>상품이름</label> 
									<input
									type="text" id="sale_name_sub" class="form-control"
									placeholder="sale_name_sub" name="sale_name_sub" required> 
									<label>상품
									서브 이름</label> 
									<input type="text" id="sale_price" class="form-control"
									placeholder="sale_price" name="sale_price" required> 
									<label>상품가격</label>
									<input type="text" id="sale_quantity" class="form-control"
									placeholder="sale_quantity" name="sale_quantity" required> 
									<label>수량</label>
									<input type="text" id="sale_thumbmail" class="form-control"
									placeholder="sale_thumbmail" name="sale_thumbmail" required> 
									<label>썸네일</label>
									<input type="text" id="sale_detail" class="form-control"
									placeholder="sale_detail" name="sale_detail" required> 
									<label>상세페이지</label>
									<button class="btn btn-lg btn-primary btn-block text-uppercase"
									type="submit">Register</button>
							</form>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function popup() {
		var url = "SearchProducts/pop";
		var name = "popup test";
		var option = "width = 500, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
	$('#SearchProducts2').click(function() {
		var insaertData = $('[name=regist]').serialize();
		popup(insaertData);
		alert(insaertData);
	});
</script>
<%@ include file="../includes/footer.jsp"%>