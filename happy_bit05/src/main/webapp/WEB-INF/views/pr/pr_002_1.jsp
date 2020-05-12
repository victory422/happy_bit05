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


<div class="container">
	<form method="get">

		<!-- 체크박스 부분 -->
		<div class="input-group mb-12 d-flex bd-highlight"
			style="margin-top: 30px;">

			<label class="input-group-text col-sm-12"> <select id="type"
				name="type" class="custom-select custom-select-sm-1"
				style="margin-left: 10px; width: 15%">

					<option value=null>종목선택</option>
					<option value="육상"
						<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '육상'?'selected':''}"/>
					</c:forEach>>육상
					</option>
					<option value="자전거"
						<c:forEach var="type1" items="${type }">
					<c:out value="${type1 eq '자전거'?'selected':''}"/>
					</c:forEach>>자전거</option>
		
			</select> <!-- <select id="category" name="type" class="custom-select custom-select-sm-1 .col-md-3 col-md-offset-3"
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
				</select> --> <select id="type" name="search_filter"
				class="custom-select custom-select-sm-1"
				style="margin-left: 10px; width: 15%">
					<option value=null selected>제목</option>
					<option value="내용">내용</option>
					<option value="all">제목+내용</option>
					<option value="장소">장소</option>
			</select> <input type="text" style="width: 55%" id="input_text"
				name="input_text" class="search-box form-control"
				placeholder="검색어 입력" onsubmit="page_put()" />
			</label>

		</div>
	</form>
	<table class="table table-striped table-bordered table-hover"
		style="margin-top: 30px;">
		<thead>
			<tr>
				<th>제목</th>
				<th>일자</th>
				<th>장소</th>
				<th>기록</th>
				<th>추천수</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${data}" var="data">	
				<tr onClick = "location.href='pr_003_1?pr_index=${data.pr_index}'">			
					<td>${data.pr_title }</td>
					<td>${data.pr_recordDate }</td>
					<td>${data.m_nickname }</td>
					<td>${data.pr_record }</td>
					<td>${data.pr_good }</td>
					<td>${data.pr_see }</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
	<!-- 페이징  -->
	<div class="col-md-10">
		<ul class="pagination d-flex justify-content-center">
			<c:if test="${pageUtil.prev }">
				<li class="page-item"><a class="page-link"
					href="/pr/pr_002_1?page=${pageUtil.start-1}">Previous</a></li>
			</c:if>
			<c:forEach begin="${pageUtil.start }" end="${pageUtil.end }"
				var="pNum">
				<li class="page-item ${pNum==pageUtil.dto.page?'active':"" }"><a
					class="page-link page_now btn btn-link">${pNum }</a></li>
			</c:forEach>
			<c:if test="${pageUtil.next }">
				<li class="page-item"><a class="page-link"
					href="/pr/pr_002_1?page=${pageUtil.end+1 }">Next</a></li>
			</c:if>
		</ul>
	</div>

</div>



<script>


$(document).ready(function(){
	
	
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
		$(this).attr('href',"/pr/pr_002_1?page="+$(this).text()+"&type="+aArr[0],aArr[1])
		})
	
	//alert(${param.test1});
		function page_put(){
		console.log($('input[name=page]').val(1))
	}
	
})






















































/*
$(document).ready(function() {
	
	chartlist();
});


function chartlist(){

	 $.ajax({
		url : '/pr/chart',
		type : 'post',
		data : {'pr_index' : pr_index},
        	success : function(data){
        		console.log("test", JSON.stringify(data));
			 var myChart = Highcharts.chart('container', {
			 chart : {
			 type : 'bar'
			 },
			 title : {
			 text : '불광천'
			 },
			 xAxis : {
			 categories : [ '평균기록' ]
			 },
			 yAxis : {
			 title : {
			 text : '평균 차트'
			 }
			 },
			 series : [ {
			 name : '남자',
			 data : [ 40.70 ]
			 } ]
			 });
        } 
	 });
}; 
*/
</script>


<%@include file="../includes/footer.jsp"%>