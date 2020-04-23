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
		<div class="">
			<a href="" class="">메인</a> <span class="">/</span> <span class="">장바구니
				내역</span>
		</div>
		<div class="mt-4 md-3">
			<h3>1개의 상품이 장바구니에 존재합니다.</h3>
		</div>
		<form name="checkout_form" action="" method="post" class="mt-4 md-3">
			<div id="cart_items" class="card h-100">
				<table>
					<thead>
						<tr class="card-header">
							<th class="">&nbsp;</th>
							<th class="">상품</th>
							<th class="">가격</th>
							<th class="">수량</th>
							<th class="">주문 총금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="image"></td>
							<td class="" style="width: 50%;"><a href="" class="">상품명</a>

								<div class=" " id="opt_2891958022_4685">
									<select name="cart_products[2891958022][product_options][4685]"
										id="option_2891958022_4685"
										onchange="fn_change_options('2891958022', '2891958022',
											'4685');">
										<option value="11046" selected="selected">360 VCaps</option>
									</select>
								</div>
								<div class="">
									<a class=" " href="" data-ca-target-id="" title="상품 제거하기">상품
										제거하기</a>
								</div></td>
							<td class="" id="price_display_update_2891958022"><span
								id="sec_product_price_2891958022" class="">45,152</span> &nbsp;
								<span class="">원</span>
							<td class="">

								<div class="" id="quantity_update_2891958022">
									<a class="">+</a> <input type="text" size="3"
										id="amount_2891958022"
										name="cart_products[2891958022][amount]" value="1" class="">
									<a class="">−</a>
								</div>
							</td>

							<td class="" id="price_subtotal_update_2891958022"><span
								id="sec_product_subtotal_2891958022" class="">45,152</span>&nbsp;<span
								class="">원</span></td>
						</tr>

					</tbody>
				</table>
			</div>

			<div class="mt-4 md-3"></div>
			<div class="breadcrumb">
				<a class="btn btn-primary" style="float: right;" href="">장바구니
					비우기</a>&nbsp;&nbsp;&nbsp;
				<button id="button_cart" style="float: right;"
					class="btn btn-primary" type="submit"
					name="dispatch[checkout.update]">장바구니 업데이트</button>
			</div>


		</form>

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
							<div class="col-lg-7">
								<h5>
									<strong>총 금액 (원)</strong>
								</h5>
							</div>
							<div class="col-lg-5">
								<h5>
									<strong>47,500</strong>
								</h5>
							</div>
						</div>
					</li>
					<div class="card-body">
						<a href="" class="btn btn-primary">쇼핑계속하기</a> 
						<a href="/sp/payment"
							class="btn btn-primary">Buy Now</a>
					</div>
				</ul>
			</div>

		</div>
</body>


<%@ include file="../includes/footer.jsp"%>