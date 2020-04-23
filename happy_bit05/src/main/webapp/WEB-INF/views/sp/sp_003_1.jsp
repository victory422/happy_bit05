<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<title>장바구니 내역</title>

</head>

<body>
	<div class="container">
		<h2 class="mt-4 md-3">배송정보입력</h2>
		<div class="row">
			<div class="col-lg-7">
				<div class="card">
					<div class="card-header">
						<div class="row">
							<h5 class="col-lg-4"><strong>배송지 선택</strong></h5>
							<form class="col-lg-5">
								<input type="radio" name="deli_address" value="ownAddress" checked>기존
								&nbsp;&nbsp; 
								<input type="radio" name="deli_address" value="otherAddress">신규
							</form>
						</div>
					</div>
				<ul class=mt-4 md-3>
					<form>
						<li>
							<div class="control-group form-group">
								<div class="controls">
									<label>Full Name:</label> <input type="text"
										class="form-control" id="name" required=""
										data-validation-required-message="Please enter infomation"
										aria-invalid="true">
									<p class="help-block"></p>
								</div>
							</div>
						</li>
						<li>
							<div class="control-group form-group">
								<div class="controls">
									<label>Phone number:</label> <input type="text"
										class="form-control" id="name" required=""
										data-validation-required-message="Please enter infomation"
										aria-invalid="true">
									<p class="help-block"></p>
								</div>
							</div>
						</li>
						<li>
							<div class="control-group form-group">
								<div class="controls">
									<label>Address:</label> <input type="text" class="form-control"
										id="name" required=""
										data-validation-required-message="Please enter infomation"
										aria-invalid="true">
									<p class="help-block"></p>
								</div>
							</div>
						</li>
						<li>
							<div class="control-group form-group">
								<div class="controls">
									<label>wanted:</label> <input type="text" class="form-control"
										id="name" required="" aria-invalid="false">
									<p class="help-block"></p>
								</div>
							</div>
						</li>
					</form>
				</ul>
		
				</div>
			</div>
			<div class="col-lg-5">
				<div class="card" id="checkout_totals">
					<div class="card-header">
						<h5>
							<strong>결제금액</strong>
						</h5>
					</div>

					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<div class="row">
								<div class="col-lg-7">주문금액 (원)</div>
								<div class="col-lg-5">45,000</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="row">
								<div class="col-lg-7">배송비 (원)</div>
								<div class="col-lg-5">2,500</div>
							</div>
						</li>
						<li class="list-group-item">
							<div class="row">
								<div class="col-lg-7"><h5><strong>총 금액 (원)</strong></h5></div>
								<div class="col-lg-5"><h5><strong>47,500</strong></h5></div>
							</div> 
						</li>
						<div class="card-body">
							<a href="#" class="btn btn-primary">Buy Now</a>
						</div>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>


<%@ include file="../includes/footer.jsp"%>