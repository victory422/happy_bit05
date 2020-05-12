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
 <div class="container" style="margin-top: 50px; margin-botton: 20px;">
 <h1 style="text-align: center; margin-top: 30px;">대회 참가자 관리</h1>
		<div class="content" style="width: 1000px; margin-top:30px; ">	
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
			<table class="table table-striped col-12"  style="margin-top: 50px">
			
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
					<td>${member.co_state }</td>
				</tr>					 
			</c:forEach>
			</table>
			
		</div>
		
	</div> 
  
  
  
  
</body>
</html>