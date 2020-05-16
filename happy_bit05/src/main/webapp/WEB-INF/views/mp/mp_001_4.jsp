<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<title>My Post</title>

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
		<script type="text/javascript" 
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12678188621fb459c68a7473a7071d75&libraries=services">
		</script>
	<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
	<script type="text/javascript" 
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=82ad3ba87fbee08d3a9f5cdbcb70051d&libraries=services,clusterer,drawing">
	</script>

</head>
<body>
	<div class="container">

		<div style="margin-top: 30px;">
			<h1>My Posts</h1>
		</div>

		<!-- 체크박스 부분 -->

		<form method="get" action="/mp/myPost/">
		
			<div class="input-group mb-12" style="margin-top: 30px;">
				<label class="input-group-text col-sm-12"> 
					<select id="cate_id" name="cate_id"
						class="custom-select custom-select-sm-1"
						style="margin-left: 10px; width: 25%">
							<option selected>카테고리</option>
							<option value="null">육상</option>
							<option value="null">자전거</option>
					</select> 
					<input type="text" style="margin-left: 10px; width: 50%" id=""
						name="" class="search-box form-control"
						placeholder="Enter search word" /> 
					<a class="text-muted" aria-label="Search" name="search_button" href="">
          				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" 
          				stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" 
          				stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false">
          				<circle cx="10.5" cy="10.5" r="7.5"></circle>
          				<path d="M21 21l-5.2-5.2"></path>
          				</svg>
       				 </a>
				</label>
			</div>
		</form>


		<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive" id="myPost">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr class="active"
					style="font-weight: bold; background-color: #e9ecef; text-align: center;">
					<td>No</td>
					<td>게시판</td>
					<td>제목</td>
					<td>추천</td>
					<td>조회</td>
					<td>게시일</td>
				</tr>
				<c:if test="${empty postList }">
							${"등록된 관심코스가 없습니다."}
							
				</c:if>
				<tbody id="">

					<c:forEach var="val" items="${postList }" varStatus="status">


						<tr id="" class="success"  style="text-align: center;"
							onclick="goPage('${val.TABLENAME}', '${val.T_INDEX}')">

							<td>${val.RN}</td>
							<td>${val.TABLENAME}</td>
							<td>${val.TITLE}</td>
							<td>${val.GOOD}</td>
							<td>${val.SEE}</td>
							<td>${val.REGISTDATE}</td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

			<div id="row">

				<!-- 페이징  -->
				<div class="col-md-6">
					<ul class="pagination justify-content-end al-center">
						<c:if test="${pageUtil.prev }">
							<li class="page-item">
								<a class="page-link" href="/mp/myPost?page=${pageUtil.start-1}">
									Previous
								</a>
							</li>
						</c:if>
						<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }"
							var="pNum">
							<div class="mb-4" id="accordion" role="tablist"
								aria-multiselectable="true"></div>
							<li class="page-item ${pNum==pageUtil.dto.page?'active':''}">
								<a class="page-link" href="/mp/myPost?page=${pNum}">
									${pNum}
								</a>
							</li>
							
						</c:forEach>
						<c:if test="${pageUtil.next }">
							<li class="page-item">
								<a class="page-link" href="/mp/myPost?page=${pageUtil.end+1 }">
									Next
								</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>

<script>

	function goPage(tableName, t_index ) {
		console.log("tableName :"+tableName);
		console.log("t_index :"+t_index);
		
		switch (tableName) {
			case 'myrecord' :
				location.href = '/pr/pr_003_1?pr_index='+t_index ;
				break;
				
			case 'item' :
				location.href = '/li/li_006_1?li_index='+t_index+'&li_b_type=후기게시판';
				break;
				
			case 'course' :
				location.href = '/lc/003/lc_get?lc_index='+t_index ;
				break;
				
			case 'competition_review' :
				location.href = '/cr/cr_003_1?co_r_index='+t_index ;
				break;
				
			case 'trainning' :
				alert("아직 페이지 세팅 전");
				break;
				
				default : alert("error!");
		} 
		
		
		
		
		
		
		
		
		
	}
	
</script>


	<%@ include file="../includes/footer.jsp"%>