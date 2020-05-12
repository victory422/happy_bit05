<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!-- Custom styles for this template -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<style>


</style>
<link href="../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="../../resources/css/modern-business.css" rel="stylesheet">
<meta charset="UTF-8">
<title>신고하기</title>
</head>
<body style="padding-top:0;">
<div class="container">
	<div class="bs-callout" style="padding:10px; background-color: #dee2e6; margin-top:15px; font-weight: bold;">
		신고하기
	</div>
	<input type="hidden" name="m_index" id="m_index" value="${data.m_index}">
	<table style="width:100%; margin-top:15px; ;" class="table-table">
		<tr>
			<td style="width:15%; font-weight: bold;">제&nbsp;&nbsp;&nbsp;&nbsp;목: </td>
			<c:if test="${param.re_type == 'lc'}">
			<input type="hidden" name="title" id="title" value="${data.lc_title }">
			<input type="hidden" name="board_index" id="board_index" value="${data.lc_index }">
			</c:if>
		</tr>
		<tr>
			<td style="font-weight: bold">작성자: </td>
			<td><c:out value="${data.m_nickname }"></c:out></td>
		</tr>
	</table>	
	<hr>
	<table style="width:100%" class="table-talbe">	
		<tr>
			<td style="width:15%; font-weight: bold; position: absolute;">신고사유</td> 
			<td style="width:80%">					
				<div><input type="radio" name="reason" value="부적절한 홍보 게시글">부적절한 홍보 게시글</div>			
				<div><input type="radio" name="reason" value="음란성 또는 청소년에게 부적합한 내용">음란성 또는 청소년에게 부적합한 내용</div>			
				<div><input type="radio" name="reason" value="명예훼손/사생활 침해 및 저작권침해등">명예훼손/사생활 침해 및 저작권침해등</div>
				<div><input type="radio" name="reason" id="etc" value="기타">기타</div>	
				<textarea class="form-control test123" id="text2"rows="4" cols="100" style="display:none"></textarea>	
			</td>
		</tr>		
	</table>		
	<hr>
	<div style="text-align: center;">
		<button type="button" onclick="report()">신고</button>&ensp;
		<button type="button" onclick="cancel()">취소</button>
	</div>
</div>				

<script>

var title = $("#title").val();
var m_index =$("#m_index").val();
var board_index = $("#board_index").val();


console.log(title);
console.log(m_index);
console.log(board_index);


//라디오 버튼 값가져오기
$("input:radio[name=reason]").click(function(){
 radio = $("input[name=reason]:checked").val();
	console.log(radio);	
	if($("input[name=reason]:checked").val() == "기타"){
		console.log("OK");
		//$('#text2').addClass("test123");
		$("#text2").css("display","");
    }else{
    	console.log("NO");
    	//$('#text2').removeClass("test123");
    	$("#text2").css("display","none");
    	var check = $("input[name=reason]:checked").val();
    	console.log(check);
    }
	
});


function report(){
	
	$.ajax({
		url : '/re/re_insert',
		type : 'post',
		data : {'title' : title, 'm_index' : m_index, 'radio' : radio,'board_index' : board_index},
		success : function(data) {
			if(data == 0){
				alert("회원만 사용가능합니다.");
				window.close();
			}
			if (data == 1) {
				window.close();
				alert("신고완료");
						
			}
			
		}		
	});
	
}
function cancel(){
	
	window.close();
	
}


</script>


</body>
</html>