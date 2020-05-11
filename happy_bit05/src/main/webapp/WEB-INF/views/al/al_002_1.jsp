<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/sidebar.jsp" %>
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
	<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  
  
  
<div class="container"> 
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">admin 대회 목록</div>
				<!-- /.panel-heading -->
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
	
				<!-- <select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
					style="margin-left: 10px; width: 15%">
					<option value=null>장비선택</option>
					<option value="운동복">운동복</option>
					<option value="안전장비">안전장비</option>
					<option value="신발">신발</option>
					<option value="기타">기타</option>
									<%-- <c:forEach items=”${사용할변수}” var=”넘어온데이터”>
									<option value=”${사용할변수.값}”
										${아이템.변수}
									</option> 
								</c:forEach>--%>
				</select> -->
				
				<select
					id="type" name="search_filter" class="custom-select custom-select-sm-1"
					style="margin-left: 10px; width: 15%">
						<option value=null selected>제목</option>
						<option value="내용">내용</option>
						<option value="all">제목+내용</option>
						<option value="장소">장소</option>
				</select>
					<input type="text" style="width: 55%" id="input_text" name="input_text" class="search-box form-control" placeholder="검색어 입력" onsubmit="page_put()"/>
			</label>
			
			</div>
			</form>
					<table class="table table-striped table-bordered table-hover" style="margin-top: 30px;">
						<thead>
							<tr>
								<th>글 번호</th>
								<th>글쓴이</th>
								<th>글제목</th>
								<th>신고사유</th>
								<th>신고자</th>
								<th>신고일자</th>
								<th>처리상태</th>
								
							</tr>
						</thead>
						<c:forEach items="${re_list}" var="data">
							<tr>
								<td>${data.board_index }</td>
								<td>${data.m_index}</td>
								<td><a style="color: blue" onclick="index_detail('${data.board_index }')" id="test${data.board_index }" value="${data.board_index }">${data.de_target}</a></td>
								<td>${data.de_type}</td>
								<td>${data.m_index2}</td>
								<td>${data.de_date }</td>
								<c:if test="${data.de_dispose eq '처리대기'}">
								<td><button type="button" class="btn btn-primary disposechange" id="statechange${data.de_index }" value="${data.de_index}">${data.de_dispose }</button></td>
								</c:if>
								<c:if test="${data.de_dispose eq '경고'}">
								<td><button type="button" class="btn btn-secondary disposechange" id="statechange${data.de_index }" value="${data.de_index }">${data.de_dispose}</button></td>
								</c:if>
								<c:if test="${data.de_dispose  eq '삭제처리'}">
								<td><button type="button" class="btn btn-danger disposechange" id="statechange${data.de_index }" value="${data.de_index }">${data.de_dispose}</button></td>
								</c:if>
							</tr>
					</c:forEach> 
						</table>
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content"></div>

						</div>
					</div>
				</div>
				<!-- 페이징  -->
					<div class="col-md-10">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link" href="/al/al_001_1?page=${pageUtil.start-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }" var="pNum">
								<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a class="page-link" href="/al/al_001_1?page=${pNum }">${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link" href="/al/al_001_1?page=${pageUtil.end+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
				<!-- /.table-responsive -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	</div>

<script>

var co_b_end = $('[name=co_b_end]').val();

$(document).ready(function(){
	
	console.log(co_b_end);
	
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

function index_detail(index){
	
	console.log(index);
	var sub_index = index.substr(0,2);
	var a = '';
	var b = '';
	 console.log(sub_index);
	 
	 if(sub_index == 'co'){
		 a='co_004_1';
		 b="co_b_index";
	 }
	 if(sub_index == 'cr'){
		 a='cr_003_1';
		 b='co_r_index';		 
	 }
	 if(sub_index == 'li'){
		 a='li_006_1';
		 b='li_index';
	 }
	 if(sub_index == 'lc'){
		 a='003/lc_get';
		 b='lc_index';
	 }
	 if(sub_index == 'pr'){
		 a='pr_003_1';
		 b='pr_index';
	 }
	 /*
	 if(sub_index == 'co') a='co';
	 if(sub_index == 'co') a='co';
	 if(sub_index == 'co') a='co';
	 */
	 //location.href="/co/co_004_1?co_b_index="+index;
	 location.href="/"+sub_index+"/"+a+"?"+b+"="+index;
	 /*
	 $.ajax({ 
			url : '/al/detail',
			type : 'get',
			data : {'index' : index, 'sub_index' : sub_index},
			success : function(data) {
				
				
				
			}
	 });
	*/
	
}


$('.disposechange').on("click", function() {
	
	
	
	var de_dispose = $(this).text();
	console.log("상태",de_dispose);
	var de_index = $(this).val();
	console.log("index",de_index);
	$.ajax({
		url : '/al/disposechange',
		type : 'post',
		data : {'de_index' : de_index},
		success : function(data) {
			if(de_dispose == '처리대기'){
				
				$('#statechange'+de_index).text("경고");			
				$('#statechange'+de_index).removeClass("btn btn-primary");
				$('#statechange'+de_index).addClass("btn btn-secondary");
			
			}else if(de_dispose == '경고'){
				
				$('#statechange'+de_index).text("삭제처리");			
				$('#statechange'+de_index).removeClass("btn btn-secondary");
				$('#statechange'+de_index).addClass("btn btn-danger");
				
			
			}else{
				
				$('#statechange'+de_index).text("처리대기");			
				$('#statechange'+de_index).removeClass("btn btn-danger");
				$('#statechange'+de_index).addClass("btn btn-primary");

				
			}
			
			
			
			/*
			if(de_dispose == '처리대기'){
				
				$('#statechange'+de_index).text("경고");			
				$('#statechange'+de_index).removeClass("btn btn-primary");
				$('#statechange'+de_index).addClass("btn btn-secondary");
			}else{_
				
				$('#statechange'+de_index).text("처리대기");			
				$('#statechange'+de_index).removeClass("btn btn-secondary");
				$('#statechange'+de_index).addClass("btn btn-primary");

				
			}
			*/
		},
		error : function(xhr, status, error){
			console.log(xhr);
			console.log(status);
			console.log(error);
		}
	});
});




</script>

</body>
</html>