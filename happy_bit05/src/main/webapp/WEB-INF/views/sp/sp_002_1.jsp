<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>상세페이지</title>
</head>
<body>
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			상품이름 <small> 상품가격 </small>
		</h1>

		<!-- <ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="index.html">Home</a></li>
		<li class="breadcrumb-item active">Portfolio Item</li>
	</ol>
	 상품이름 아래 미니 네비게이션 -->


		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-fluid" src="http://placehold.it/750x500" alt="">
			</div>

			<div class="col-md-4">
				<h3 class="my-3">Project Description</h3>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
				<h3 class="my-3">Project Details</h3>
				<!-- select -->
				<div role="group" class="my-3"
					aria-label="Button group with nested dropdown">
					<button type="button" class="btn btn-info" style="width: 30%;">Type</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop3" type="button"
							class="btn btn-info dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop3">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

				<div class="" role="group"
					aria-label="Button group with nested dropdown">
					<button type="button" class="btn btn-info" style="width: 30%;">Quantity</button>
					<div class="btn-group" role="group">
						<button id="btnGroupDrop3" type="button"
							class="btn btn-info dropdown-toggle" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="btnGroupDrop3">
							<a class="dropdown-item" href="#">Dropdown link</a> <a
								class="dropdown-item" href="#">Dropdown link</a>
						</div>
					</div>
				</div>

				<!-- /select -->

				<div class="my-4" role="group"
					aria-label="Button group with nested dropdown">
					<a href="#" class="btn btn-primary">Buy now </a> <a href="#"
						class="btn btn-primary">Shopping basket </a>
				</div>

			</div>
			<!-- /.row -->

			<!-- Related Projects Row -->
			<h3 class="my-4">Thumbnails</h3>

			<div class="row">

				<div class="col-md-3 col-sm-6 mb-4">
					<a href="#"> <img class="img-fluid"
						src="http://placehold.it/500x300" alt="">
					</a>
				</div>

				<div class="col-md-3 col-sm-6 mb-4">
					<a href="#"> <img class="img-fluid"
						src="http://placehold.it/500x300" alt="">
					</a>
				</div>

				<div class="col-md-3 col-sm-6 mb-4">
					<a href="#"> <img class="img-fluid"
						src="http://placehold.it/500x300" alt="">
					</a>
				</div>

				<div class="col-md-3 col-sm-6 mb-4">
					<a href="#"> <img class="img-fluid"
						src="http://placehold.it/500x300" alt="">
					</a>
				</div>

			</div>
			<!-- /.row -->

			<!-- 상세페이지 -->
			<h3 class="my-4">Detail</h3>
			<div>
				<img class="img-fluid" src="http://placehold.it/1200x2000" alt="">
			</div>
		</div>
	</div>
</body>

<%@ include file="sp_003_2.jsp"%>
<%@ include file="../includes/footer.jsp"%>