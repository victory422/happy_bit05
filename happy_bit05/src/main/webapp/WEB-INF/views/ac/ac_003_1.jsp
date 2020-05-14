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
		<div class="content" style="margin-top:30px;">
			<div class="row col-12">
			
			<h3>참가자 리스트 <span class="text-muted"style="font-size:1.2rem">(${data.get(0).co_b_title })</span></h3>
			
			<table class="table table-striped col-12" style="margin-top:15px;">
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
		</div>
	</div>
	</div>
	</div>
</div>
<script>
$('.statechange').on("click", function() {
		var co_b_index = $('#co_b_index').val();
		console.log(co_b_index);
		var co_state = $(this).text();
		console.log("state",co_state);
		var m_index = $(this).val();
		console.log("index",m_index);
		$.ajax({
			url : '/ac/m_statechange',
			type : 'post',
			data : {'m_index' : m_index,'co_b_index' : co_b_index},
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