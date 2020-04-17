<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<form class="form-horizontal" role="form" method="post"
		action="javascript:alert( 'success!' );">
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
		<table class="table table-striped table-bordered table-hover">														
						<tr>
							<td>대회명 </td>
							<td><input type="text" value="비트캠프"></td>							
						</tr>
						<tr>
							<td>대회 일시</td>
							<td><input type="text" value="2020-06-20~2020-06-21"></td>
						</tr>
						<tr>
							<td>장소 </td>
							<td><input type="text" value="철원종합운동장"></td>
						</tr>
						<tr>
							<td>성별</td>
							<td><input type="checkbox">남<input type="checkbox">여</td>
						</tr>
						<tr>
							<td>기념품 </td>
						</tr>
						
						<tr>
							<td>단체/소속</td>
							<td><input type="text" value="비트캠프"></td>
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
							<td><input type="text" value="50000"></td>
						</tr>							
					</table>
		
		<div class="form-group">
			<div class="col-lg-offset-2 col-lg-10">
				<button type="submit" class="btn btn-primary">Sign in</button>
			</div>
		</div>
	</form>
</div>
</body>
<%@include file="../includes/footer.jsp"%>