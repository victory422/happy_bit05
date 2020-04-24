<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<title>Product List</title>

<style>
.redfamily {
	color: red;
}

.search-box, .close-icon, .search-wrapper {
	position: relative;
	padding: 10px;
}

.search-wrapper {
	width: 500px;
	margin: auto;
	margin-top: 50px;
}

.search-box {
	width: 80%;
	border: 1px solid #ccc;
	outline: 0;
	border-radius: 15px;
}

.search-box:focus {
	box-shadow: 0 0 15px 5px #b0e0ee;
	border: 2px solid #bebede;
}

.close-icon {
	border: 1px solid transparent;
	background-color: transparent;
	display: inline-block;
	vertical-align: middle;
	outline: 0;
	cursor: pointer;
}

.close-icon:after {
	content: "X";
	display: block;
	width: 15px;
	height: 15px;
	position: absolute;
	background-color: #FA9595;
	z-index: 1;
	right: 35px;
	top: 0;
	bottom: 0;
	margin: auto;
	padding: 2px;
	border-radius: 50%;
	text-align: center;
	color: white;
	font-weight: normal;
	font-size: 12px;
	box-shadow: 0 0 2px #E50F0F;
	cursor: pointer;
}

.search-box:not (:valid ) ~ .close-icon {
	display: none;
}
</style>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>


		<div class="container">
			<div style="margin-top: 30px;">
				<h1>Product List</h1>
			</div>

			<!-- 체크박스 부분 -->
		<form method="get" action="/sa/products/page=1?
									ate_id=${pageUtil.dto.cate_id}&
									vend_id=${pageUtil.dto.vend_id}&
									input_text=${pageUtil.dto.input_text}
									">
			<div class="input-group mb-12" style="margin-top: 30px;">

				<label class="input-group-text col-sm-12"> 
				<select id="cate_id"
					name="cate_id" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 25%">
						<option value=null selected>카테고리</option>
						<option value="null"></option>
				</select> 
				<select id="vend_id" name="vend_id"
					class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
					style="margin-left: 10px; width: 25%">
						<option value=null selected>협력사</option>
						<option value="null"></option>
				</select> 
				
				<input type="text" style="margin-left: 10px; width: 50%" id="input_text"
					name="input_text" class="search-box form-control"
					placeholder="Enter search product ID" />
				<input type="submit" value="search"/>
				</label>

			</div>

		</form>


			<!-- 게시글 리스트 출력 테이블 -->
			<div class="table-responsive">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr class="active">
						<td>No</td>
						<td>제품코드</td>
						<td>협력사코드</td>
						<td>제품원가</td>
						<td>제품판매가</td>
						<td>카테고리코드</td>
						<td>등록일</td>

					</tr>
					<c:if test="${empty list }">
							${"데이터가 존재하지않아요."}
				  	  	</c:if>
					<tbody id="paging">

						<c:forEach var="val" items="${list }" varStatus="status">
							<tr class="success" onclick='location.href="/sa/new/prod_id=${val.SP_PROD_ID}"'>
							
								<td>${val.RN }</td>
								<td>${val.SP_PROD_ID}</td>
								<td>${val.SP_VEND_ID }</td>
								<td>${val.SP_PROD_COST }</td>
								<td>${val.SP_PROD_PRICE_NORMAL }</td>
								<td>${val.SP_CATE_ID}</td>
								<td>${val.SP_PROD_DATE}</td>

							</tr>
						</c:forEach>
					
					</tbody>
				</table>

				<div id="row">

					<!-- 페이징  -->
					<div class="col-md-6">
						<ul class="pagination justify-content-end">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link"
									href="/sa/SearchProducts/page=${pageUtil.start-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }"
								var="pNum">
								<li class="page-item ${pNum==pageUtil.dto.page?'active':''}"><a
									class="page-link" href="/sa/SearchProducts/page=${pNum }?
									cate_id=${pageUtil.dto.cate_id}&
									vend_id=${pageUtil.dto.vend_id}&
									input_text=${pageUtil.dto.input_text}
									">${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link"
									href="/sa/SearchProducts/page=${pageUtil.end+1 }">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
		</div>
	

	
	<%@ include file="../includes/footer.jsp"%>