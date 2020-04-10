<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
window.onload=funtion(){
	CKEDITOR.replace('content');
}
</script>
<%@ include file="../includes/footer.jsp"%>