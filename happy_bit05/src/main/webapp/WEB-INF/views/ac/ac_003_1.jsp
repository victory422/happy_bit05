<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top: 20px; margin-botton: 20px;">
		<div class="content" style="width: 1000px; margin-top:30px; ">
			<c:forEach items="${data}" var="data">
				<table class="table table-striped col-12">
				<tr><td><h1>제목 : ${data.co_b_title }</h1></td></tr>
				<tr><td><h1>일시 : ${data.co_b_day }</h1></td></tr>
				<tr><td><h2>접수기간 : ${data.co_b_period }</h2></td></tr>
				<tr><td><h3>장소 : ${data.co_b_area }</h3></td></tr>
				</table>
			</c:forEach>	
		
			<table class="table table-striped col-12">
			<thead>
			<tr>
				<td>회원id</td>
				<td>닉네임</td>
				<td>이름</td>
				<td>핸드폰</td>
				<td>성별</td>
			<tr>
			</thead>
			
			<c:forEach items="${member }" var="member">
				<tr>
				
				
				</tr>
			</c:forEach>
			
						 
			</table>
			
		</div>
		
	</div>
</body>
</html>