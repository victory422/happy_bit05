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
					colsole.log("비회원");
				 }
				 })
			})();

	})
	  	
	</script>
<%@ include file="../includes/middle.jsp"%>
<body>

	<c:forEach var="board" items="${page }">

		<div class="container">
<form id="page_info">
	
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
				 
 <input type="hidden" name="status" value=1>
 
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
						<button class="btn btn-info" onclick="modify()">수정하기</button>
						<button  class="btn btn-info" onclick="fn_golist()">
						목록으로 돌아가기 
					</button>ㄷ
				</div>
			</div>
				</form>
			<!--  댓글  -->
				
					<label for="content"><h3>댓글</h3></label>
					<form name="commentInsertForm">
						<div class="input-group">
							<input type="text" class="form-control" name="com_text" placeholder="내용을 입력하세요."> 
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="commentInsertBtn" >등록</button>							
							</span> <input type="hidden" id="board_index" name="board_index"value="${board.li_index}"><!-- value값 게시판에 맞게 바꾸세요 -->
						</div>
					</form>
				<div class="container">
         <div class="commentList"></div>
      </div>
<!-- 댓글 마무리 -->
			
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
			      	alert("로그인이 필요합니다.");
			    }
			  });
			}

		function modify(){
			$('form').attr('action','/li/li_005_1').submit()
		}
		
		function fn_golist(){
			var a = '${back_url}?page=${page_num}'
			alert(a)
			$('form').attr('action',a).submit()
		}


//	출처: https://shxrecord.tistory.com/6 [첫 발]
document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
}, true);


//페이지 로딩시 댓글 목록
$(document).ready(function() {
	commentList();
	
	$()

});

var board_index = $('#board_index').val();//게시글 넘버 변수에 넣어주기

$('#commentInsertBtn').click(function() { //댓글 등록 버튼 클릭시
	var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	commentInsert(insertData); //Insert 함수호출(아래)
	console.log($('[name=commentInsertForm]').serialize());
});
//댓글 목록 
function commentList() {
	
	$.ajax({
		url : '/comment/list',
		type : 'get',
		data : {data : board_index},
		success : function(data) {
			//console.log(value.com_index1);
			var a = '';
			$.each(data,function(key, value) {
				a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += 	'<div class="commentInfo'+value.com_index+'">'+ '댓글번호 : '+ value.com_index ;
				//댓글이 안달린놈은 버튼 안나오게
				//if(value.com_index1 != null){
					a +=	'<a onclick="dedetlist('+value.com_index+')" id="a'+value.com_index+'">댓글보기</a>';
				//}
				a +=		'<a onclick="dedet('+value.com_index+');"  value="0" class="float-right">댓글</a>';
				a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';
                a +=	'</div>';             
				a += 	'<div class="commentContent'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
				a +='</div>';				
			});
			$(".commentList").html(a);
		}
	});
}

//대댓글 리스트
var check = true;
var checkIdx = 0;
function dedetlist(com_index){
	alert(com_index);
	var a ='';
	$.ajax({
		url : '/comment/dedetlist',
		type : 'get',
		data : {'com_index' : com_index},
		success : function(data){
			$.each(data,function(key, value){
				a += '<div class="commentArea1'+com_index+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px; margin-left: 50px;">';
				a += 	'<div class="commentInfo'+value.com_index1+'">'+ '상위 댓글 번호 : '+ value.com_index1 ;
				a +=		'<a onclick="dedet('+value.com_index+');"  value="0" class="float-right">댓글</a>';
				a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';        	
                a +=	'</div>'; 
                a += 	'<div class="commentContent1'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
                a +='</div>'
			});
			if($("#a"+com_index).text() == '댓글보기'){
				$(".commentContent" + com_index).append(a);
				$("#a"+com_index).text("댓글지우기");
			}else{
				$(".commentArea1" + com_index).remove();
				$("#a"+com_index).text("댓글보기");
			}

		}
	})	

}

//댓글작성
function commentInsert(insertData) {
	$.ajax({
		url : '/comment/insert',
		type : 'post',
		data : insertData,
		success : function(data) {
			if (data == 1) {
				commentList(); //댓글 작성 후 댓글 목록 reload
				alert("댓글 작성");
				 $('[name=com_text]').val('');
			}
		}		
	});
}

//댓글 수정 작성폼 만들기
function commentUpdate(com_index, com_text){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+com_index+'" value="'+com_text+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+com_index+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+com_index).html(a);
    
}
//댓글 수정
function commentUpdateProc(com_index){
    var updateContent = $('[name=content_'+com_index+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'com_text' : updateContent, 'com_index' : com_index},
        success : function(data){
            if(data == 1) 
            	alert("댓글 수정");
            	commentList(); //댓글 수정후 목록 출력 
        }
    });
}
//댓글 삭제 
function commentDelete(com_index){
    $.ajax({
        url : '/comment/delete/'+com_index,
        type : 'post',
        success : function(data){
            if(data == 1) 
         		alert("댓글 삭제");   	
            	commentList(); //댓글 삭제후 목록 출력 
        }
    });
}
//대댓글 폼생성
function dedet(com_index){
	alert(board_index);
	

		var textareaTag = "<hr><div style='margin-left:50px;'><textarea rows='2' cols='130' name='test1_"+com_index+"'></textarea>";
			//textareaTag += "<input type='hidden' id='co_b_index' name='co_b_index'>";
			textareaTag += "<button type='button'  class='btn btn-outline-secondary' style='margin-bottom:25px' onclick='dedetinsert("+com_index+")'>완료</button></div>"
	    $(".commentContent" + com_index).append(textareaTag);
		
	
	$("#dedet").text("댓글취소");

}
//대댓글 작성
function dedetinsert(com_index){
	
		alert(board_index); 
	var test1 = $('[name=test1_'+com_index+']').val();
	$.ajax({
		url : '/comment/dedetinsert',
		type : 'post',
		data : {"com_text" : test1, "com_index" : com_index, "board_index" : board_index},
		success : function(data){
			if(data == 1)				
				alert("대댓글 작성");
			 	commentList();
		}
	})
}



		
	</script>
	<%@ include file="../includes/footer.jsp"%>