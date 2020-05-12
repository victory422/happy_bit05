<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!-- Custom styles for this template -->
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  
 
<div class="container">
	<div class="row col-12" >
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-body">
			
			<form method="get">
				
					<!-- 체크박스 부분 -->
		<div class="input-group mb-12 d-flex bd-highlight" style="margin-top: 30px;">
			
			<label class="input-group-text col-sm-12">
			
				<select
				
					id="type" name="type" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
					
					<option value=null>종목선택</option>
					<option value="육상" 
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '육상'?'selected':''}"/>
					</c:forEach>
					>육상 </option>
					<option value="자전거" 
					<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '자전거'?'selected':''}"/>
					</c:forEach>
					>자전거</option>
					
				</select> 
		
				<select
					id="type" name="search_filter" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
						<option value=null selected>선택</option>
						<option value="제목">제목</option>
						<option value="내용">내용</option>
						<option value="장소">장소</option>
				</select>
					<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="검색어 입력" onsubmit="page_put()"/>
			</label>
			
			</div>
			</form>
					<div>
						<c:forEach items="${data}" var="data">
						
						
						<input type="hidden" name="co_b_end" value="${data.co_b_end }">
						
						
						<div data-text-content="true" style="font-weight: bold; font-size: 18px; color: rgb(41, 128, 185); margin-top: 30px;" class="float-right">${data.co_b_state}</div>
					<table class="table table-bordered table-hover" style="margin-top: 30px; " onClick = "location.href='co_004_1?co_b_index=${data.co_b_index}'">														
						<tr>
							<td rowspan="4" style="width:200px; height: 125px; padding: 0;">
							<img id="thumbnail" src="data:image/jsp;base64, ${data.co_request}" style="width:200px; height: 180px; padding: 0;">
							</td>
							<td ><h2>제목 : ${data.co_b_title}</h2></td>
							
						</tr>
						<tr>
							<td >일자 : ${data.co_b_day}</td>
						</tr>
						<tr>
							<td>장소 : ${data.co_b_area}</td>
						</tr>					
					</table>
													
						</c:forEach>
					</div>
				</div>
				<!-- 페이징  -->
					<div class="col-md-10">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link" href="/co/co_003_1?page=${pageUtil.start-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
								<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link page_now btn btn-link" >${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link" href="/co/co_003_1?page=${pageUtil.end+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
</div>

<script>

var co_b_end = $('[name=co_b_end]').val();



$(document).ready(function(){
	
var param = $(location).attr('search').slice($(location).attr('search').indexOf('=') + 1);

	console.log(co_b_end);
	console.log(param);
	
	if(param == '1'){
		alert("대회신청 완료")
	}	
	
	
	$('a.page_now').on('click',function(){
		//alert($('input[name=page]').val($(this).text()))
		//alert($('select[name=type]').val())
		
		var a =$('select[name=type]').length;
		//배열생성
		var aArr = new Array(a);
		
		//필터값들 스트링으로 변환
		for(var i=0; i<a; i++){
			aArr[i] = $('select[name=type]').eq(i).val();
			//alert(aArr[i]);
		}
		
		//선택한 종목값
		//aArr[1]
		//선택한 장비값
		//aArr[2]
		//현재 선택된 a태그안  
		$(this).attr('href',"/co/co_003_1?page="+$(this).text()+"&type="+aArr[0],aArr[1])
		})
	
	//alert(${param.test1});
		function page_put(){
		console.log($('input[name=page]').val(1))
	}
	
});

/*
//접수상태 자동 변화시키기
function stateupdate(com_index){
    
    $.ajax({
        url : '/co/stateup',
        type : 'post',
        data : {'co_b_end' : co_b_end},
        success : function(data){
            if(data == 1) 
            	alert("댓글 수정");
            	commentList(); //댓글 수정후 목록 출력 
        }
    });
}
*/


</script>
<%@include file="../includes/footer.jsp"%>		
	
	
	
