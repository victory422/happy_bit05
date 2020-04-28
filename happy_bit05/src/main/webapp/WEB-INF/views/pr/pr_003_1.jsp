<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>

<div class="container" style="margin-top: 20px; margin-botton: 50px;">
	<div class="content" style="width: 1000px">
		<c:forEach items="${data}" var="data">
			<div class="row board_style">
				<div class="col-md-8">
					<h1>제목 : ${data.pr_title }</h1>
				</div>
				<div class="col-md-4" style="text-align: right;">
					<h6>
						추천수:<span class="good_cnt"> 10</span> 조회수:60
					</h6>
					작성일자:${data.pr_resistDate }
				</div>
			</div>

			<br>

			<div class="row board_style">
				<div class="col-sm-12">			
					<h6>종목: ${data.pr_type }</h6>
				</div>
			</div>
			<hr>

			<div style="margin-bottom: 50px">
				<div class="text_container text_padding">${data.pr_text }</div>
			</div>
			<div class="box">
				<div id="" class="padding_1">
					<!-- 좋아요 기능 -->
					<c:choose>
						<c:when test="${board.m_index ne null}">
							<a href='javascript: like_func();'><img
								src="/resources/img/dislike.png" id='like_img'></a>추천수<span
								class="good_cnt"> ${board.li_good }</span>
						</c:when>
						<c:otherwise>
							<a href='javascript: login_need();'><img
								src="/resources/img/like.png"></a>추천수<span class="good_cnt">
								${board.li_good }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="push padding_1">
					<button class="btn btn-info" onclick="location.href='/pr/pr_002_1'">목록으로
						돌아가기 ${back_url}</button>
				</div>
			</div>

			<!--  댓글  -->
			<div class="container"
				style="border: 1px solid darkgray; margin-bottom: 30px; margin-top: 30px; padding: 5px;">
				<div class="row col-12">
					<div class="col-lg-12">
						<div class="container">
							<label for="content">댓글쓰기</label>
						</div>
						<form name="commentInsertForm">
							<div class="input-group">
								<input type="text" class="form-control" name="com_text"
									placeholder="내용을 입력하세요." style="margin-bottom: 25px;">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button"
										id="commentInsertBtn">등록</button> <input type="hidden"
									id="board_index" name="board_index" value="">
								<!-- value값 게시판에 맞게 바꾸세요 -->
								</span>
								<div class="container">
									<b>Comments</b>
								</div>
								<div class="container" style="border: 1px solid black;">
									<div class="commentList"></div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- 댓글 마무리 -->
		</c:forEach>
	</div>

</div>
















<%@include file="../includes/footer.jsp"%>