<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/sidebar.jsp" %>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>


<div style="padding-left: 280px;padding-right: 100px; "> 
<h1 style="text-align: center; margin-top: 30px;">회원 상세보기</h1>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
			<div style="border:0px solid #eee; padding:0px;">
 		<table class="table table-striped table-bordered" style="margin-top:50px;">	
 			<tbody>													
						<tr>
							<td>회원 번호 </td>
							<td>${data.m_index}</td>							
						</tr>
						<tr>
							<td>회원 아이디</td>
							<td>${data.m_id}</td>
						</tr>
						<tr>
							<td>회원 이름</td>
							<td>${data.m_name }</td>
						</tr>
						<tr>
							<td>회원 성별 </td>
							<td>${data.m_gender }</td>
						</tr>				
						<tr>
							<td>회원 생일</td>
							<td>${data.m_birth }</td>
						</tr>
						<tr>
							<td>회원 이메일</td>
							<td>${data.m_email}</td>
						</tr>
						<tr>
							<td>회원 핸드폰번호</td>
							<td>${data.m_tel }</td>
						</tr>
						<tr>
							<td>회원 주소</td>
							<td>${data.m_address}</td>
						</tr>
						<tr>
							<td>신고당한횟수</td>
							<td>${data.m_count}</td>
						</tr>						
						</tbody>						 	
					</table>
					</div>
					<div style="text-align: right; margin-top: 5px;">
					<form action="am_del" method="get">
						<input type="hidden" name="m_index" value="${data.m_index }">
						<input class="btn btn-danger" type="submit" value="회원삭제">
					</form>
					</div>
			</div>
		</div>
	</div>
</div>
			
<script>

var m_index = $('#m_index').val();









</script>



  
</body>
</html>