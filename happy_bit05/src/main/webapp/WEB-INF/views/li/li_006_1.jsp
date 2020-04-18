<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>장비게시판 상세페이지</title>
<style>
	.text_container{
	background-color: #eee
	}
</style>
</head>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<%@ include file="../includes/middle.jsp"%>
<body>
<c:forEach var="board" items="${page }">
<div class="container">

<div class="row board_style">
  <div class="col-md-8"><h1>제목 : ${board.li_title }</h1></div>
  <div class="col-md-4" style="text-align: right;"> <h6>조회수:${board.li_see }  추천수:${board.li_good }</h6> 작성일자:${board.li_date } </div>
</div>

<br>

<div class="row board_style">
  <div class="col-sm-12"><h4>장비게시판<small> (후기게시판) </small></h4> <h6> 종목: ${board.li_type } 종류 : ${board.li_category }</h6></div>
</div>

<br>
					 	<div>
							<h2>내용:</h2>
							<div class="text_container">
							${board.li_text }
							</div>
						 </div>
						 <div id="">
						 
						 </div>
</div>
</c:forEach>
<%@ include file="../includes/footer.jsp"%>