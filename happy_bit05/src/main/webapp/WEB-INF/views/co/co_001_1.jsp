<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form class="form-horizontal" role="form" method="post" action="ap_001_1">
		<div class="form-group">
			<label for="provision" class="col-lg-5 control-label">참가자 유의사항 및 참가동의서</label>
			<div class="col-lg-10" id="provision">
				<textarea class="form-control" rows="8" style="resize: none">약관동의
블라블라블라블라블라블라블라블라블라블라블라블라
블라블라블라블라블라블라블라블라블라블라블라블라
블라블라블라블라블라블라블라블라블라블라블라블라.................
                        </textarea>
				<div class="radio">
					<label> <input type="radio" id="provisionYn"
						name="provisionYn" value="Y" autofocus="autofocus" checked>
						동의합니다.
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" id="provisionYn"
						name="provisionYn" value="N"> 동의하지 않습니다.
					</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label for="memberInfo" class="col-lg-5 control-label">참가자 유의사항 및 참가동의서</label>
			<div class="col-lg-10" id="memberInfo">
				<textarea class="form-control" rows="8" style="resize: none">개인정보의 항목 및 수집방법
블라블라블라블라블라블라블라블라블라블라블라블라                        
블라블라블라블라블라블라블라블라블라블라블라블라
블라블라블라블라블라블라블라블라블라블라블라블라.................
                        </textarea>
				<div class="radio">
					<label> <input type="radio" id="memberInfoYn"
						name="memberInfoYn" value="Y" checked> 동의합니다.
					</label>
				</div>
				<div class="radio">
					<label> <input type="radio" id="memberInfoYn"
						name="memberInfoYn" value="N"> 동의하지 않습니다.
					</label>
				</div>
			</div>
		</div>
		<c:forEach items="${ data}" var="data">
		<input type="hidden" name="co_title" value="${data.co_b_title }">
		<input type="hidden" name="co_price" value="${data.co_b_price}">
		<input type="hidden" name="co_area" value="${data.co_b_area }">
		<div style="border:0px solid #eee; padding:0px;">
 		<table class="table table-striped table-bordered">	
 			<tbody>													
						<tr>
							<td>대회명 </td>
							<td>${data.co_b_title }</td>							
						</tr>
						<tr>
							<td>대회 일시</td>
							<td>${data.co_b_day }</td>
						</tr>
						<tr>
							<td>장소 </td> 
							<td>${data.co_b_area }</td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="checkbox">남<input type="checkbox">여</td>
						</tr>
						<tr>
							<td>기념품 </td>
							<td style="padding-left:15px;">
							<div>
								<c:set var="co_souvenir" value="${data.co_souvenir }"/>
								<c:forTokens var="co_souveniradd" items="${co_souvenir }" delims=",">
								<label><input type="radio">${co_souveniradd }<br></label>
								</c:forTokens>
							</div>
							</td>
						</tr>
						
						<tr>
							<td>단체/소속</td>
							<td><input type="text" value="비트캠프"></td>
						</tr>
						<tr>
							<th>종목/등급</th>
							<td style="padding-left:15px;">
							<div>
							<c:set var="co_rating" value="${data.co_rating }"/>
							<c:forTokens var="co_ratingadd" items="${co_rating }" delims=",">							
							<label><input type="radio">${co_ratingadd }<br></label>
							</c:forTokens>
							</div>
							</td>
						</tr>
						<tr>
							<td>생년월일 </td>
							<td><input type="text" value="94/01/14"></td>
						</tr>
						<tr>
							<td>휴대전화</td>
							<td><input type="text" value="-빼고 입력해주세요."></td>
						</tr>
						<tr>
							<td>일반전화</td>
							<td><input type="text" value="-빼고 입력해주세요."></td>
						</tr>
						<tr>
							<td>참가비</td>
							<td>
								${data.co_b_price }							
							<input type="hidden" value="${data.co_b_price }" id="amount">
								<input type="hidden" value="${data.co_b_index }" id="co_b_index">
								<input type='button' class="float-right" onclick="kakaopay()" value="결제하기">	
							<c:if test="${param.kakaotest != '1'}">
					  		  	<label class="float-right"> 결제전</label>
							</c:if>
							<c:if test="${param.kakaotest == '1'}">
								<label class="float-right">결제완료</label>					
							</c:if>
							</td>

							
						</tr>
						</tbody>						 	
					</table>
					</div>
	 	</c:forEach>
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="submit" class="btn btn-primary">Sign in</button>
			</div>
		</div>
	</form>
</div>
 

<script>


function kakaopay(){
	
	var amount = $('#amount').val();
	var co_b_index = $('#co_b_index').val();
	$.ajax({
        url : '/kakaopay',
        type : 'post',
        data : {amount : amount, co_b_index : co_b_index},
        success : function(data){
    	     location.href =data;
        	 		
        } 
    });
} 








</script>




















</body>
<%@include file="../includes/footer.jsp"%>