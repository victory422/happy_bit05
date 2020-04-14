<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/middle.jsp"%>

<main role="main">
	<div class="album py-5">
		<div class="container">
		<div class="row">
		<c:forEach var="lc" varStatus="status" items="${lc_list}">
			<div class="col-md-3">
				<div class="card mb-3 shadow-sm">
				<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><img alt="" src="${lc.lc_thumbnail }" + "${status.current }" + "/getByteImage"/></svg>
				<div class="card-body">
					<p class="card-text">${lc.lc_title}</p>
					<p class="card-text">${lc.m_index}</p>
					<p class="card-text">${lc.lc_see}</p>
					<p class="card-text">${lc.lc_good}</p>
				</div>
				</div>
			</div>
		</c:forEach>
		
		</div>
		</div>
	</div>
</main>
<%@ include file="../includes/footer.jsp"%>