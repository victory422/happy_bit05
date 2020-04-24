<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>

		<form action="/ms/regist" method="post">
			<table>
				<tr>
					<td id="title">아이디</td>
					<td><input type="text" name="m_id" maxlength="20"> <input
						type="button" value="중복확인"></td>
				</tr>
				<tr>
					<td id="title">닉네임</td>
					<td><input type="text" name="m_nickName" maxlength="20">
						<input type="button" value="중복확인"></td>
				</tr>

				<tr>
					<td id="title">비밀번호</td>
					<td><input type="password" name="m_pw1" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">비밀번호 확인</td>
					<td><input type="password" name="m_pw2" maxlength="15">
					</td>
				</tr>

				<tr>
					<td id="title">이름</td>
					<td><input type="text" name="m_name" maxlength="40"></td>
				</tr>

				<tr>
					<td id="title">성별</td>
					<td><input type="radio" name="m_gender" value="남" checked>남
						<input type="radio" name="m_gender" value="여">여</td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" name="m_birth_yy" maxlength="4"
						placeholder="년(4자)" size="6"> <select name="m_birth_mm">
							<option value="">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>

					</select> <input type="text" name="m_birth_dd" maxlength="2" placeholder="일"
						size="4"></td>
				</tr>

				<tr>
					<td id="title">이메일</td>
					<td><input type="text" name="m_email_1" maxlength="30">@
						<select name="email_2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
							<option>hotmail.com</option>
							<option>hitel.com</option>
							<option>paran.com</option>
							<option>yahoo.com</option>
							<option>직접입력</option>
					</select>
					<td><input type="button" value="이메일 인증"></td>
					</td>
				</tr>

				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="m_tel" /></td>
				</tr>
				<tr>
					<td id="title">주소</td>
					<td><input type="text" size="50" name="m_address" /></td>
				</tr>
				<tr>
					<td id="title">사진</td>
					<td><input type="file" name="m_picture" size=40></td>
					<td><input type="submit" value="업로드"></td>
				</tr>
			</table>
			<br> 
			<input type="submit" value="가입" /> 
			<input type="reset" value="취소" />
		</form>
</body>



<%@ include file="../includes/footer.jsp"%>