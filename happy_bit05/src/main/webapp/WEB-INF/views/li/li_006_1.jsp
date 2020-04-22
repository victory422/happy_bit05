<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>장비게시판 상세페이지</title>
<style>
.text_container {
	background-color: #eee
}
.box {
  display: flex;
}
.push {
    margin-left: auto;
}
.text_padding {
  padding-top: 3%;
  padding-right: 3%;
  padding-bottom: 3%;
  padding-left: 3%;
}
.padding_1{
	padding-top: 2%;
	padding-bottom: 2%;
}
</style>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		(function(){
			var li_index = $('#li_index').val();
			$.ajax({
				url: "../li/like_check",
				type: "GET",
				cache: false,
				dataType: "json",
				data: 'li_index=' +li_index,
				success: function(data) {
					 if(data.good_check == 0){
					        like_img = "/resources/img/dislike.png";
					      } else {
					        like_img = "/resources/img/like.png";
					      }
					      $('#like_img').attr('src', like_img);
					     
				},
				 error: function(request, status, error){
					 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				 }
				 })
			})();
	})
	
	</script>
<%@ include file="../includes/middle.jsp"%>
<body>
<form>
	<c:forEach var="board" items="${page }">
	<!--에이작스로 넘겨룰 히든값  -->
		<input type="hidden" id="li_index" name="li_index" value="${board.li_index }"/>
		<input type="hidden" id="m_index" value="${board.m_index }"/>
		<input type="hidden" id="good_click_check" value="null"/>
		
	<!-- 수정할떄 넘겨줄값들 -->
		
		<input type="hidden" name="li_b_type" value=${board.li_b_type }>
		<!-- 
		<input type="hidden" name="li_type" value="${board.li_type }">
		<input type="hidden" name="li_title" value="${board.li_title }">
		<input type="hidden" name="li_category" value="${board.li_category }">
				 -->
		<div class="container">

			<div class="row board_style">
				<div class="col-md-8">
					<h1>제목 : ${board.li_title }</h1>
				</div>
				<div class="col-md-4" style="text-align: right;">
					<h6>추천수:<span class="good_cnt"> ${board.li_good }</span> 조회수:${board.li_see } </h6>
					작성일자:${board.li_date }
				</div>
			</div>

			<br>

			<div class="row board_style">
				<div class="col-sm-12">
					<h4>
						장비게시판<small> (후기게시판) </small>
					</h4>
					<h6>종목: ${board.li_type } 종류 : ${board.li_category }</h6>
				</div>
			</div>

			<br>
			<div>
				<h2>내용:</h2>
				<div class="text_container text_padding">${board.li_text }</div>
			</div>
			<div class="box">
				<div id="" class="padding_1">
				<!-- 좋아요 기능 -->
					<c:choose>
						<c:when test="${board.m_index ne null}">
							<a href='javascript: like_func();'><img
								src="/resources/img/dislike.png" id='like_img'></a>추천수<span class="good_cnt"> ${board.li_good }</span>
						</c:when>
						<c:otherwise>
							<a href='javascript: login_need();'><img
								src="/resources/img/like.png"></a>추천수<span class="good_cnt"> ${board.li_good }</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="push padding_1">
					<button class="btn btn-info" onclick="modify()">
						수정하기 
					</button>
					<button class="btn btn-info" onclick="location.href='${back_url}?page=${page_num }'">
						목록으로 돌아가기 
					</button>
				</div>
			</div>
			<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 -->
			<%--     <c:if test = "${board.li_index != null and sessionScope.user_id != dto.user_id">
    
		<button type="button"  id ="btnGood">추천하기</button>
    
    </c:if> --%>


			<%-- api정보 데이터출력  --%>
			<%-- or sessionScope.navername != null and sessionScope.navername != dto.user_id
    or sessionScope.kakaonickname != null and sessionScope.kakaonickname != dto.user_id
    or sessionScope.facebookname != null and sessionScope.facebookname != dto.user_id}" --%>


		</div>
	</c:forEach>
	</form>
<!-- 좋아요 함수 -->
	<script type="text/javascript">
	
	
	function like_func(){
		  var li_index = $('#li_index').val();
		  var li_good = $('#li_good').val()
		  var mno = $('#m_index').val();
		  console.log("li_index, mno : " + li_index +","+ mno);


		  $.ajax({
			    url: "../li/like",
			    type: "GET",
			    cache: false,
			    dataType: "json",
			    data: 'li_index=' +li_index,
			    success: function(data) {
			      var msg = '';
			      var like_img = '';
			      msg += data.msg;
			      alert(msg);
			      
			      if(data.good_check == 0){
			        like_img = "/resources/img/dislike.png";
			      } else {
			        like_img = "/resources/img/like.png";
			      }      
			      $('')
			      $('#like_img').attr('src', like_img);
			      $('.good_cnt').text(data.good_cnt);
			      /* $('#like_check').html(data.like_check); */
			    },
			    error: function(request, status, error){
			      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }
			  });
			}

		function modify(){
			$('form').attr('action','/li/li_005_1').submit()
		}


//	출처: https://shxrecord.tistory.com/6 [첫 발]

		
	</script>
	<%@ include file="../includes/footer.jsp"%>