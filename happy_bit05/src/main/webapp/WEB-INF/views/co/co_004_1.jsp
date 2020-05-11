<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
			
	<div class="container" style="margin-top: 20px; margin-botton: 20px;">
		<div class="content">
			<c:forEach items="${data}" var="data">
			<table style="width:100%;">
				<tr>
					<td style="width:70%"><span style="font-size:1.5rem;">${data.co_b_title }&emsp; </span> 종목: ${data.co_b_type }</td>
					<td style="width:30%; text-align: right;">${data.co_b_date }</td>
				</tr>
				<tr>
					<td>작성자 : 관리자</td>
					<td style="text-align: right"><h6>추천수:<span class="good_cnt"> ${data.co_b_good } &emsp;</span>조회수 :  ${data.co_b_see }</h6> </td>
				</tr>
				<tr>
					<td></td>
					<td style="text-align: right"><a onclick="report()" class="text-muted">신고하기</a></td>
				</tr>
			</table>
			<%-- <div class="row board_style">
				<div class="col-sm-12">				
					<button class="float-right" onclick="location.href='/co/co_001_1?co_b_index=${data.co_b_index}'">대회 접수</button>
				</div>
			</div> --%>
			<hr>
			<div style="text-align: right">
				<button type="button" class="btn btn-primary" onclick="location.href='/co/co_001_1?co_b_index=${data.co_b_index}'">대회 접수</button>
			</div>
			<div style="margin-bottom: 50px">
				<div class="text_container text_padding">${data.co_b_text }</div>
			</div>
			<div class="box">
				<div id="" class="padding_1">
				<!-- 좋아요 기능 -->
					<table style="width:100%">
						<tr>
							<td style="width:60%">
								<c:choose>
									<c:when test="${data.m_index ne null}">
										<a href='javascript: like_func();'><img
											src="/resources/img/dislike.png" id='like_img'></a>추천수<span
											class="good_cnt"> ${data.co_b_good }</span>
									</c:when>
									<c:otherwise>
										<a href='javascript: login_need();'><img
											src="/resources/img/like.png"></a>추천수<span class="good_cnt">
											${data.co_b_good }</span>
									</c:otherwise>
								</c:choose>
							</td>
							<td style="width:40%; text-align: right;">
							
								<div>
									<button class="btn btn-info" onclick="location.href='/co/co_003_1'">목록으로 돌아가기 </button>
								</div>
								
								
							</td>
						</tr>
					</table>
				
				</div>
			</div>
			
				<!--  댓글  -->
				<div class="container" style="border:1px solid darkgray; margin-bottom:30px; margin-top:30px; padding: 5px;" >
					<div class="row col-12" >
					<div class="col-lg-12">
				<div class="container">
				<label for="content">댓글쓰기</label>
				</div>
					<form name="commentInsertForm">
						<div class="input-group">
							<input type="text" class="form-control" name="com_text" placeholder="내용을 입력하세요." style="margin-bottom: 25px;"> 
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="commentInsertBtn">등록</button>		
								<input type="hidden" id="board_index" name="board_index"value="${data.co_b_index}"><!-- value값 게시판에 맞게 바꾸세요 -->						
							</span>
							<div class="container"><b>Comments</b></div>
							<div class="container" style="border:1px solid black;">
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
 
<script>

	var board_index = $('#board_index').val();//게시글 넘버 변수에 넣어주기
	console.log("인덱스 : ",board_index);

var popupWidth = 600;
var popupHeight = 450;

var popupX = (window.screen.width / 2) - (popupWidth / 2); 
// 만들 팝업창 width 크기의 1/2 만큼 보정값으로 빼주었음
 
var popupY= (window.screen.height / 2) - (popupHeight / 2);
// 만들 팝업창 height 크기의 1/2 만큼 보정값으로 빼주었음
 
//신고하기 창띄우기
function report(){
	//re_type 게시판 마다 맞게 바꿔주기
	 window.open("/re/report?re_type=co&board_index="+board_index+"", '새창', 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY); 
	
}
//페이지 로딩시 댓글 목록
$(document).ready(function() {

	(function(){
		$.ajax({
			url: "../co/like_check",
			type: "GET",
			cache: false,
			dataType: "json",
			data: 'co_b_index=' +board_index,
			success: function(data) {
				 if(data.good_check == 0){
				        like_img = "/resources/img/dislike.png";
				      } else {
				        like_img = "/resources/img/like.png";
				      }
				      $('#like_img').attr('src', like_img);
				     
			},
			 error: function(request, status, error){
				 console.log("비회원")
			 }
			 })
		})();
	
	
	commentList();
});


function like_func(){

	
	  $.ajax({
		    url: "/co/like",
		    type: "GET",
		    cache: false,
		    dataType: "json",
		    data: 'co_b_index=' +board_index,
		    success: function(data) {
		      var msg = '';
		      var like_img = '';
		      msg += data.msg;
		      alert(msg);
		      if(msg != 'no'){
			      	      
		      if(data.good_check == 0){
		        like_img = "/resources/img/dislike.png";
		      } else {
		        like_img = "/resources/img/like.png";
		      }      
		      $('')
		      $('#like_img').attr('src', like_img);
		      $('.good_cnt').text(data.good_cnt);
		      
		      }else{
		    	  alert("로그인이 필요합니다.")
		      }
		      /* $('#like_check').html(data.like_check); */
		    },
		    error: function(request, status, error){
		      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		  });
		}


 
//var board_index = "${param.co_b_index}";

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
			console.log('test',JSON.stringify(data))
			//console.log(value.com_index1);
			var a = '';
			$.each(data,function(key, value) {
					a += '<div class="commentArea" style="margin-bottom: 15px;">';
					a += 	'<div class="commentInfo'+value.com_index+'">'+ '작성자 : '+ value.m_nickname;
					a +=	'&emsp; <a onclick="dedetlist('+value.com_index+')" id="a'+value.com_index+'">댓글보기</a>';
					a +=		'<a onclick="dedet('+value.com_index+');"  value="0" class="float-right">댓글</a>';
					a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
	                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';
	                a +=	'</div>';             
					a += 	'<div class="commentContent'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
				/*
					if(value.com_dedetflag == 1){					
						a += '<div class="commentArea1'+value.com_index+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px; margin-left: 50px;">';
						a += 	'<div class="commentInfo'+value.com_index1+'">'+ '상위 댓글 번호 : '+ value.com_index1 ;
						a +=		'<a onclick="dedet('+value.com_index+');"  value="0" class="float-right">댓글</a>';
						a += 		'<a onclick="commentUpdate('+value.com_index+',\''+value.com_text+'\');" class="float-right" style="margin-right : 10px"> 수정 </a>';
		                a += 		'<a onclick="commentDelete('+value.com_index+');" class="float-right" style="margin-right: 10px;"> 삭제 </a>';        	
		                a +=	'</div>'; 
		                a += 	'<div class="commentContent1'+value.com_index+'"> <p> 내용 : '+ value.com_text+ '</p> </div>';
		                a +='</div>'
					}
					a +='</div>';
				*/
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
				a += '<div class="commentArea1'+com_index+'" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
				a += 	'<div class="commentInfo'+value.com_index1+'">'+ '작성자 : '+ value.m_nickname;
				a += 		"<img src='../resources/img/reply.png' class='float-left'>";
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
			if(data == 0){
				alert("로그인이 필요합니다.");
			}
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
	

		var textareaTag = "<hr><div style='margin-left:50px;'><textarea rows='2' cols='105' name='test1_"+com_index+"'></textarea>";
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

<%@include file="../includes/footer.jsp"%>









