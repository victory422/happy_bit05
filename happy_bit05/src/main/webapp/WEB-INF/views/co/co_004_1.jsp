<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="container" style="margin-top: 20px; margin-botton: 20px;">
		<div class="content" style="width: 1000px">
			<c:forEach items="${data}" var="data">
			<table class="table table-striped col-12">
			<thead>
				<tr>
				<td><h1>제목 : ${data.co_b_title }</h1></td>
				</tr>
				<tr>
				<td class="">작성자 : 이찬영</td>
				<td>종목 : ${data.co_b_type }</td>
				<td>추천수 : ${data.co_b_good }</td>
				<td>조회수 : ${data.co_b_see }</td>
				</tr>
				<tr> 
				<td>접수기간 : ${data.co_b_period }</td>
				<td>
				<form role="form" action="co_001_1" method = "get">
					<input type="hidden" name="co_b_index" value="${data.co_b_index }">
					 
					<button type="submit" class="btn btn-primary float-right">대회 접수</button>
				</form>
				</td>
				</tr>		
				<tr>
				<td><h2>내용</h2></td>
				</tr>		
				<tr>
				<td>${data.co_b_text }</td>
				</tr>
			</thead>			 
			</table>
			
				<!--  댓글  -->
				<div class="container">
					<label for="content"><h3>댓글</h3></label>
					<form name="commentInsertForm">
						<div class="input-group">
							<input type="text" class="form-control" name="com_text" placeholder="내용을 입력하세요."> 
							<span class="input-group-btn">
								<button class="btn btn-default" type="button" id="commentInsertBtn">등록</button>								
							</span> <input type="hidden" id="board_index" name="board_index"value="${data.co_b_index}"><!-- value값 게시판에 맞게 바꾸세요 -->
						</div>
					</form>
				</div>
				<!-- 댓글 마무리 -->
		</c:forEach>
		</div>

		<div class="container">
			<div class="commentList"></div>
		</div>
	</div>
 
<script>
//페이지 로딩시 댓글 목록
$(document).ready(function() {
	
	commentList();
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

<%@include file="../includes/footer.jsp"%>