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
		<div class="content" style="width: 1000px; margin-top:30px; ">
			<table class="table table-striped col-12" style="margin-top: 50px">
			<tr>
				<td><h1>대회명 : ${data.get(0).co_b_title }</h1></td>
			</tr>
			<tr>
				<td><h3>대회 장소 : ${data.get(0).co_b_area }</h3></td>
			</tr>
			<tr>
				<td><h3>대회 일시: ${data.get(0).co_b_day }</h3></td>
			</tr>
			</table>
			<table class="table table-striped col-12">
			<thead>
			<tr>
				<td>회원id</td>
				<td>닉네임</td>
				<td>이름</td>
				<td>핸드폰</td>
				<td>성별</td>
				<td>참여상태</td>
			<tr>
			</thead>
			
			
			<c:forEach items="${member }" var="member">
				<tr>
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