<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<title>장바구니 내역</title>

</head>

<body>

	<div class="">
		<a href="" class="">메인</a> 
		<span class="">/</span> 
		<span class="">장바구니 내역</span>
	</div>
	<h3>1개의 상품이 장바구니에 존재합니다.</h3>

	<form name="checkout_form" action="" method="post">

		<div id="cart_items">
			<table class="" border="1">
				<thead>
					<tr>
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
						<td class="" id="price_display_update_2891958022">
						<span id="sec_product_price_2891958022" class="">45,152</span>
							&nbsp;
							<span
							class="">원</span>
						<td class="">

							<div class="" id="quantity_update_2891958022">
								<a class="">+</a> 
								<input type="text" size="3"
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

		<div class="">
			<a class="" href="">장바구니 비우기</a>
			<button id="button_cart" class="" type="submit"
				name="dispatch[checkout.update]">장바구니 업데이트</button>
		</div>
	</form>
	<div id="gift_certificates"></div>
	<div class="" id="checkout_totals">
		<ul class="">
			<li class=""><span class="">주문 총금액</span> <span class=""><span
					class=" ">45,152</span>&nbsp;<span class=" ">원</span></span></li>
			<li class=""><span class=""> 배송비 </span> <span class=""><span
					class=" ">2,500</span>&nbsp;<span class=" ">원</span></span></li>
		</ul>

		<div class=""></div>
		<ul class="">
			<li class=""><span class="">총금액</span> <span class=""><span
					id="sec_cart_total" class="">50,000</span>&nbsp;<span class="">원</span></span>
			</li>
		</ul>
	</div>

	<div class="">
		<a href="" class="">쇼핑계속하기</a> <a href="" class="">결제하기</a>
	</div>

</body>


<%@ include file="../includes/footer.jsp"%>