<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Login</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">
				<div class="card-header">
					<h3>Login</h3>

				</div>
				<div class="card-body">
					<form action="/lo/login" method="post">
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" name="m_id" placeholder="id">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" name="m_pw"
								placeholder="password">
						</div>
						<div class="row align-items-center remember">
							<input type="checkbox">Remember

						</div>
						<div class="form-group">
							<input type="submit" value="Login" onclick="'login()'"
								class="btn float-right login_btn">
						</div>
					
						<br>
						<div class="form-group">
							<input type="submit" value="회원가입" onclick="javascript: form.action='/ms';"
							class="btn float-right member_btn"></button>
						</div>
					</form>
				</div>
				<div class="card-footer"></div>

			</div>
		</div>
	</div>
	</div>
	</div>
</body>

<script type="text/javascript">

	//세션체크
	console.log("세션체크 1 : "+'${sessionVO}');
	console.log("세션체크 2 : "+sessionStorage.getItem("sessionScript"));

	function login() {
		sessionStorage.setItem("sessionScript",'${sessionVO}');
		console.log("로그인 및 스크립트 세션 저장 : "+sessionStorage.getItem("sessionScript"));
	}
	
	
</script>





<%@ include file="../includes/footer.jsp"%>