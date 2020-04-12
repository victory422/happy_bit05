<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Home</title>
</head>

<div class="container">
	<div class="album py-5">
	
		<c:forEach var="lc" items="${lc_list}">
			<div class="col-md-4">
				<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
				<rect width="100%" height="100%" fill="#55595c"></rect>
				<p class="card-text">${lc.lc_title}</p>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="../includes/middle.jsp"%>
<%@ include file="../includes/footer.jsp"%>