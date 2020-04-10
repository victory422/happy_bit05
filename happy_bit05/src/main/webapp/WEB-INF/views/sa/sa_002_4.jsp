<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>Shop</title>
</head>
<body>
	<c:if test="${empty list }">
        ${"데이터가 존재하지않아요."}
    </c:if>
	<c:forEach items="${list }" var="val" varStatus="status">
        ${status.count }<br>
        prod_id : ${val.prod_id }<br>
        vend_id : ${val.vend_id }<br>
        prod_cost : ${val.prod_cost }<br>
        prod_price : ${val.prod_price }<br>
        cate_id : ${val.cate_id }<br>
        prod_date : ${val.prod_date }<br>
		<br>
	</c:forEach>

</body>

<%@ include file="../includes/footer.jsp"%>