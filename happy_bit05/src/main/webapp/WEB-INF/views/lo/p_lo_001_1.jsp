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
					<div>${loginVO.loginMsg }</div>
				</div>
				<div class="card-footer"></div>
				<div class="form-group">
					<form>
						<input type="submit" value="To MyPage"
							onclick="javascript: form.action='/mp';"
							class="btn float-right member_btn">
						<input type="submit" value="logout"
							onclick="javascript: form.action='/lo/logout';"
							class="btn float-right member_btn">
					</form>
				</div>

			</div>
		</div>
	</div>
</body>





<%@ include file="../includes/footer.jsp"%>