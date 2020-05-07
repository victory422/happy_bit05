<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<title>Login</title>
<script
  src="https://code.jquery.com/jquery-3.5.0.js"
  integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
  crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
	    <!-- Bootstrap core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
html, body { width: 100%; height: 100%; }
.outer {
  display: table;
  width: 100%;
  height: 100%;
}
.inner {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
}

            .centered {
                position: relative;
                display: inline-block;
                width: 50%;
                padding: 1em;
                background: orange;
                color: white;
            }

.hc { width:200px; left:0; right:0; margin-left:auto; margin-right:auto; }/* 가로 중앙 정렬 */

.vc { height:40px; top: 0; bottom:0; margin-top:auto; margin-bottom:auto; } /* 세로 중앙 정렬 */
</style>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-center h-100" >
			<div class="card">
				<div class="card-header">
					<h3>Login</h3>

				</div>
				<div ><p id="check" class="bg-danger"></p></div>
				<div class="card-body">
					<form action="/mb/mb_003_1" method="post" onsubmit="return checkMem()">
					
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" class="form-control" id="m_id" name="m_id" placeholder="id">

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" class="form-control" id="m_pw" name="m_pw"
								placeholder="password">
						</div>
						<div class="row align-items-center remember">
							<input type="checkbox">Remember

						</div>
						<div class="form-group">
							<input type="submit" value="Login"
								class="btn float-right login_btn">
						</div>
					
						<br>
						<div class="form-group">
							<input type="submit" value="회원가입" onclick="javascript: form.action='/ms';"
							class="btn float-right member_btn">
						</div>
					</form>
				</div>
				<div class="card-footer"></div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function checkMem(){
			var id = document.getElementById("m_id").value;
			var pw = document.getElementById("m_pw").value;
	        $.ajax({
				url: "/mb/loginCheck",
				type: "post",
				cache: false,
				data: {"m_id" : id , "m_pw" : pw},
				success: function(data) {
						if(data == 'ok'){
							alert('로그인 성공')
							window.location.href = "/mb/mb_003_1";
						}else{
							alert('로그인 실패')
							$('#check').html("로그인에 실패 하셨습니다.<br>");
						}
				},
				 error: function(request, status, error){
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					 console.log('error:'+error);
					 return false;
				 }
				 })
				 return false;
				 }
	</script>
</body>
</html>