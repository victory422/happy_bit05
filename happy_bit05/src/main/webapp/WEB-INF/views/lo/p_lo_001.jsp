<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Password Confirm</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

</head>
<body onunload="opener.pClose()"> 
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Login</h3>

				</div>
				<div class="card-body">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" name="m_id"  id="m_id" value="${sessionVO.m_id}" disabled="disabled">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" name="m_pw" id="m_pw"
								placeholder="password">
						</div>
						<div class="form-group">
							<input type="submit" value="confirm"  onclick="login()"
								class="btn float-right login_btn">
						</div>
					
						<br>
				</div>
				<div class="card-footer"></div>

			</div>
		</div>
	</div>
	</div>
	</div>
</body>

<script type="text/javascript">

function login() {
	var id = document.getElementById('m_id').value;
	var pw = document.getElementById('m_pw').value;
	var returnPw = sessionStorage.getItem("password");
	var passwordUpdate = sessionStorage.getItem("passwordUpdate");
	console.log(passwordUpdate);
	if(passwordUpdate=='0' && pw==returnPw) {
		console.log("수정 중인 비밀번호 확인");
		alert("비밀번호가 확인되었습니다.");
		sessionStorage.removeItem("password");
		sessionStorage.removeItem("passwordUpdate");
		opener.document.getElementById("passwordConfirm2").value = 'updateTrue';
		opener.document.getElementById("btn").removeChild;
		window.close();
	}else if(pw==returnPw && passwordUpdate==null) {
		console.log("DB에서 비밀번호 확인");
		alert("비밀번호가 확인되었습니다.");
		sessionStorage.removeItem("password");
		opener.document.getElementById("passwordConfirm2").value = 'true';
		opener.document.getElementById("btn").removeChild;
		window.close();
		//window.opener.location.reload();
	}else alert("비밀번호를 다시 확인해주세요.");
	
}
	
</script>


	<script src="../../resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="../../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</html>
