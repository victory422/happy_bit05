<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="uploadCourse2" enctype="multipart/form-data" method="post">
    <input type="file" name="lc_thumbnail" />
    <input type="text" name="lc_title" />
    <input type="submit" value="이미지저장"/>
</form>
</body>
</html>