<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/sidebar.jsp" %>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<div style="padding-left: 280px;padding-right: 100px; ">
		<div class="row">
		<div class="col-lg-12">	
		<h3 style="margin-top: 30px;">대회 참가자 관리</h3>
	<hr>
		<form method="get">
				
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
	
				<!-- <select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
					style="margin-left: 10px; width: 15%">
					<option value=null>장비선택</option>
					<option value="운동복">운동복</option>
					<option value="안전장비">안전장비</option>
					<option value="신발">신발</option>
					<option value="기타">기타</option>
									<%-- <c:forEach items=”${사용할변수}” var=”넘어온데이터”>
									<option value=”${사용할변수.값}”
										${아이템.변수}
									</option> 
								</c:forEach>--%>
				</select> -->
				
				<select
					id="type" name="search_filter" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
						<option value=null selected>제목</option>
						<option value="내용">내용</option>
						<option value="all">제목+내용</option>
						<option value="장소">장소</option>
				</select>
					<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="검색어 입력" onsubmit="page_put()"/>
			</label>
			
			</div>
			</form>		
			<table class="table table-striped table-bordered table-hover"  style="margin-top: 50px">
			
			<thead>
			<tr>
				<td>대회명</td>
				<td>대회 날짜</td>
				<td>회원id</td>
				<td>닉네임</td>
				<td>이름</td>
				<td>핸드폰</td>
				<td>성별</td>
				<td>참여상태</td>
			<tr>
			</thead>
			
			
			<c:forEach items="${memberlist }" var="member">
				<tr>
					<td>${member.co_title }</td>
					<td>${member.co_b_day }</td>
					<td>${member.m_id }</td>
					<td>${member.m_nickname }</td>
					<td>${member.m_name }</td>
					<td>${member.m_tel }</td>
					<td>${member.m_gender }</td>
					<c:if test="${member.co_state eq '참가'}">
						<td><button type="button" class="btn btn-info statechange" id="statechange${member.m_index }" value="${member.m_index }">${member.co_state}</button></td>
					</c:if>
					<c:if test="${member.co_state eq '환불'}">
						<td><button type="button" class="btn btn-secondary statechange" id="statechange${member.m_index }" value="${member.m_index }">${member.co_state}</button></td>
					</c:if>
				</tr>	
				<input type="hidden" id="co_b_index" value="${member.co_b_index }">				 
			</c:forEach>
			</table>
			<div class="col-md-10">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link" href="/ac/ac_004_1?page=${pageUtil.start-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
								<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link" href="/ac/ac_004_1?page=${pNum }">${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link" href="/ac/ac_004_1?page=${pageUtil.end+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
		</div>
		
	</div> 
  
 </div>
<script>
$('.statechange').on("click", function() {
		var co_b_index = $('#co_b_index').val();
		console.log("co_b_index : ", co_b_index);
		var co_state = $(this).text();
		console.log("state",co_state);
		var m_index = $(this).val();
		console.log("index",m_index);
		$.ajax({
			url : '/ac/m_statechange',
			type : 'post',
			data : {'m_index' : m_index , 'co_b_index' : co_b_index},
			success : function(data) {
				if(co_state == '참가'){
					
					$('#statechange'+m_index).text("환불");			
					$('#statechange'+m_index).removeClass("btn btn-info");
					$('#statechange'+m_index).addClass("btn btn-secondary");

				}else{
					
					$('#statechange'+m_index).text("참가");			
					$('#statechange'+m_index).removeClass("btn btn-secondary");
					$('#statechange'+m_index).addClass("btn btn-info");

					
				}

			},
			error : function(xhr, status, error){
				console.log(xhr);
				console.log(status);
				console.log(error);
			}
		});
	});  
</script>
</body>
</html>