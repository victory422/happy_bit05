<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.nio.file.Path"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>후기 게시판</title>

<style>

	.redfamily {
	color: red;	
}
.search-box,.close-icon,.search-wrapper {
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
	border:1px solid transparent;
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
	z-index:1;
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
.search-box:not(:valid) ~ .close-icon {
	display: none;
}

</style>
 <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</head>
<body>
	<!-- 넘겨줄값들 -->
<input type="hidden" name="li_b_type" value="후기게시판"/>
<!-- <input type="hidden" name="back_url" value="li_001_1.jsp"/>  -->
	<input type="hidden" name="page" value="1"/>

	<div class="container">
		<form method="get">
		<div style="margin-top: 30px;" class="row">
			<div class="col-md-12">
				<h1>장비 Tip</h1>
			</div>
			<div class="col-md-10"></div>
			<div class="col-md-2">		
				<c:choose>
					<c:when test="${member ne null}">
						<div class="col-md-12">
							<a href="/li/li_005_1?li_b_type=후기게시판"><button type="button" class="btn btn-success">글작성 </button></a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col-md-12">
							<button type="button" onclick="need_login()" class="btn btn-success">글작성</button>
						</div>
					</c:otherwise>
				</c:choose>
			<!-- 페이지수 변경 (미완성) -->		
				<!-- <select name="amount" id="list_mount">
					<option value="15">15개씩 보기</option>
					<option value="30">30개씩 보기</option>
				</select>	 -->
			</div>
			<!-- 체크박스 부분 -->
		<div class="input-group mb-12 d-flex bd-highlight" style="margin-top: 30px;">
			<label class="input-group-text col-sm-12">
				<select
					id="type" name="type" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
					<option value=null>종목선택</option>
					<option value="육상" 
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '육상'?'selected':''}"/>
					</c:forEach>
					>육상 </option>
					<option value="자전거" 
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '자전거'?'selected':''}"/>
					</c:forEach>
					>자전거</option>
				</select> 
				<select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
					style="margin-left: 10px; width: 15%">
					<option value=null>장비선택</option>
					<option value="운동복"
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '운동복'?'selected':''}"/>
					</c:forEach>
					>운동복</option>
					<option value="안전장비"
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '안전장비'?'selected':''}"/>
					</c:forEach>
					>안전장비</option>
					<option value="신발"
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '신발'?'selected':''}"/>
					</c:forEach>
					>신발</option>
					<option value="기타"
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '기타'?'selected':''}"/>
					</c:forEach>
					>기타</option>
				</select>
				<select
					id="type" name="search_filter" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
						<option value="제목" selected>제목</option>
						<option value="내용">내용</option>
						<option value="all">제목+내용</option>
						<option value="작성자">작성자</option>
				</select>
					<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="검색어 입력" onsubmit="page_put()"/>
			</label>
			</div>
		</div>
	</form>	
		<input type="hidden" name=page value="${page }">
		
		<!-- 게시글 리스트 출력 테이블 -->
			<div class="table-responsive">
				<table class="table table-hover" style="margin-top: 30px;">
					<!-- <tr><td><h2>전체글</h2></td>
					<td style="text-align: right;"><input type="checkbox"></td>
					</tr> -->
					<tr class="active" style="text-align: center;">
						<td width="10%">종목</td>
						<td width="34%">게시글 제목</td>
						<td width="10%">장비 종류</td>
						<td width="12%">작성자</td>
						<td width="18%">작성날자</td>
						<td width="9%">조회수</td>
						<td width="9%">좋아요</td>
					</tr>
					<tbody id="table_list">
						<c:forEach var="board" items="${list }">
							<tr class="success" style="text-align: center;">
								<td>
									<c:out value="${board.li_type eq 'all'?'전체': board.li_type}"/>
								</td>
								<td onclick="location.href='/li/li_006_1?li_index=${board.li_index }&li_b_type=${board.li_b_type}&page=${page}'"><button type="button" onclick="location.href='/li/li_006_1?page=${page }&li_index=${board.li_index }&li_b_type=${board.li_b_type}'" class="btn btn-link">${board.li_title }</button></td>
								<td>${board.li_category }</td>
								<td>${board.m_nickname }</td>
								<td>${board.li_date }</td>
								<td>${board.li_see }</td>
								<td>${board.li_good }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
				<div id="row">
					<div class="col-md-6">
						<c:choose>
						<c:when test="${member ne null}">
							<div class="col-md-6">
								<a href="/li/li_005_1?li_b_type=후기게시판"><button type="button" class="btn btn-success">글작성 </button></a>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col-md-6">
								<button type="button" onclick="need_login()" class="btn btn-success">글작성</button>
							</div>
						</c:otherwise>
					</c:choose>
					</div>
				<!-- 페이징  -->
					<div class="col-md-10">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link" href="/li/li_001_1?page=${pageUtil.start-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
								<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link page_now btn btn-link">${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link" href="/li/li_001_1?page=${pageUtil.end+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
			</div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			$('select[name=amount]').on('change',function(){
				alert('change!!')
				$(this).attr('selected','selected')
				alert('selected!!')
				$('form').attr('action','/li/li_001_1').submit();
				
			})
			
			$('a.page_now').on('click',function(){
				//alert($('input[name=page]').val($(this).text()))
				//alert($('select[name=type]').val())
				
				var a =$('select[name=type]').length;
				//배열생성
				var aArr = new Array(a);
				
				//필터값들 스트링으로 변환
				for(var i=0; i<a; i++){
					aArr[i] = $('select[name=type]').eq(i).val();
					//alert(aArr[i]);
				}
				
				//선택한 종목값
				//aArr[1]
				//선택한 장비값
				//aArr[2]
				//현재 선택된 a태그안  
				$(this).attr('href',"/li/li_001_1?page="+$(this).text()+"&type="+aArr[0],aArr[1])
				})
		});
		
		function page_put()
		{
			('input[name=page]').val(1)
		}
		
		function need_login() {
			alert('로그인이 필요합니다.')
		}
	</script>

	<%@ include file="../includes/footer.jsp"%>
