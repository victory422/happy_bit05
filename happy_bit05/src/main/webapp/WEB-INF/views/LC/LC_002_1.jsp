<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ include file="../includes/middle.jsp"%> --%>

<script src="//code.jquery.com/jquery-3.5.0.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		//페이징 이동 처리
		var actionForm = $("#actionForm");
		var searchForm = $("#searchForm");
		
		$(".page-link").on('click', function(e){
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		
		//게시글 조회
		$(".move").on('click', function(e){
			e.preventDefault();
			
			actionForm.append("<input type='hidden' name='lc_index' value='" +
			$(this).attr("href") + "'>'");	
			
			actionForm.attr("action", "../../lc/003/lc_get");
			actionForm.submit();
		});
		
		//게시글 검색
		$("#searchForm a").on('click', function(e){

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			searchForm.submit();
		});
	});
	
	
</script>

<main role="main">
	<div class="album py-5">
		<div class="container">
		
		<div class="w-100"></div>
		
		<div class="row">
			<div class="col-6"><h3>${pageUtil.cri.lc_type } 코스</h3></div>
			<div class="col-6" style="text-align:right;">
				<c:if test="${m_index ne null}">
				<button type="button" class="btn btn-secondary" onclick="location.href='../../lc/001/write?m_index=${m_index}'">글쓰기</button>
				</c:if>
			</div>
		</div>
		
		<br>
		
		<form id="searchForm" name="searchForm" action="/lc/002/list?lc_type=${pageUtil.cri.lc_type }" method="get" >
		<div class="row">
			<div class="input-group mb-12 d-flex bd-highlight" style="margin-bottom : 30px;">
			<label class="input-group-text col-sm-12">
				<div class="col-2">
				<select
					id="type" name="type" class="custom-select w-100"
					style="margin-left: 10px; width: 15%">
					<option value="" 
						<c:out value="${pageUtil.cri.type == null?'selected':''}"/>>선택</option>
					<option value="normal"
						<c:out value="${pageUtil.cri.type eq 'normal'?'selected':''}"/>>제목+작성자</option>
					<option value="area"
						<c:out value="${pageUtil.cri.type eq 'area'?'selected':''}"/>>지역</option>
				</select> 
				</div>

				<div class="col-9">
					<input type="text" style="width: 55%" id="keyword" name="keyword" class="search-box form-control w-100" placeholder="Enter search term" 
						value='<c:out value="${pageUtil.cri.keyword }"/>'/>
				</div>
				
				<div class="col-1">
					<a class="text-muted" aria-label="Search" name="search_button" href="">
          				<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24" focusable="false"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"></circle><path d="M21 21l-5.2-5.2"></path></svg>
       				 </a>				
       			 </div>
				
			</label>
			</div>
		</div>
		
			<input type="hidden" name="pageNum" value='<c:out value="${pageUtil.cri.pageNum }"/>'/>
			<input type="hidden" name="amount" value='<c:out value="${pageUtil.cri.amount }"/>'/>
			<input type="hidden" id="lc_type" name="lc_type" value='<c:out value="${pageUtil.cri.lc_type }"/>' />
			
		</form>
		
		
		<br>
		
		<div class="row">
			<c:forEach var="lc1" varStatus="status" items="${lc_good}">
			<div class="col-md-3">
			<div data-text-content="true" style="font-weight: bold; font-size: 24px; color: rgb(41, 128, 185); margin-top: 30px;" class="row">Best</div>
				<div class="card mb-3 shadow-sm">
				<svg class="bd-placeholder-img card-img-top" width="100%" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
				<c:choose>
					<c:when test="${lc1.lc_request ne ''}">
						<img alt="" id="thumbnail" src="data:image/jsp;base64, ${lc1.lc_request}" height="200"/>
					</c:when>
					<c:otherwise>
						<c:if test="${lc1.lc_type eq '육상' }">
							<img alt="" id="thumbnail" src="/resources/img/lc/basic_run.png" height="200"/>
						</c:if>
						<c:if test="${lc1.lc_type eq '자전거' }">
							<img alt="" id="thumbnail" src="/resources/img/lc/basic_cycle.png" height="200"/>
						</c:if>
					</c:otherwise>
				</c:choose>
				</svg>
				<div class="card-body">
					<a class="move" href="<c:out value='${lc1.lc_index}'/>">
						<p class="card-text">${lc1.lc_title}</p>
					</a>
					<p class="card-text">${lc1.m_nickname}</p>
					<p class="card-text">조회수 : ${lc1.lc_see}<br>추천수 : ${lc1.lc_good}</p>
				</div>
				</div>
			</div>
		</c:forEach>
		</div>
		
		<br/>
		
		<hr/>
		
		<br/>
		
		<div class="row">
		<c:forEach var="lc" varStatus="status" items="${lc_list}">
			<div class="col-md-3">
				<div class="card mb-3 shadow-sm">
				<svg class="bd-placeholder-img card-img-top" width="100%" height="0" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: Thumbnail">
				<c:choose>
					<c:when test="${lc.lc_request ne ''}">
						<img alt="" id="thumbnail" src="data:image/jsp;base64, ${lc.lc_request}" height="200"/>
					</c:when>
					<c:otherwise>
						<c:if test="${lc.lc_type eq '육상' }">
							<img alt="" id="thumbnail" src="/resources/img/lc/basic_run.png" height="200"/>
						</c:if>
						<c:if test="${lc.lc_type eq '자전거' }">
							<img alt="" id="thumbnail" src="/resources/img/lc/basic_cycle.png" height="200"/>
						</c:if>
					</c:otherwise>
				</c:choose>
				</svg>
				<div class="card-body">
					<a class="move" href="<c:out value='${lc.lc_index}'/>">
						<p class="card-text">${lc.lc_title}</p>
					</a>
					<p class="card-text">${lc.m_nickname}</p>
					<p class="card-text">조회수 : ${lc.lc_see}<br>추천수 : ${lc.lc_good}</p>
				</div>
				</div>
			</div>
		</c:forEach>
		
		</div>
		
		<div class="row">
			<div class="col-md-10">
						<ul class="pagination d-flex justify-content-center">
							<c:if test="${pageUtil.prev }">
								<li class="page-item"><a class="page-link" href="${pageUtil.startPage-1}">Previous</a></li>
							</c:if>
							<c:forEach begin="${pageUtil.startPage }" end="${pageUtil.endPage }" var="pNum">
								<li class="page-item ${pNum==pageUtil.cri.pageNum == num ?'active':"" }"><a class="page-link" href="${pNum }">${pNum }</a></li>
							</c:forEach>
							<c:if test="${pageUtil.next }">
								<li class="page-item"><a class="page-link" href="${pageUtil.endPage+1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
		</div>
		
		<form id='actionForm' action="/lc/002/list" method='get'>
			<input type="hidden" name="lc_type" value='${pageUtil.cri.lc_type }'/>
			<input type="hidden" name="pageNum" value='${pageUtil.cri.pageNum }'/>
			<input type="hidden" name="amount" value='${pageUtil.cri.amount }'/>
			<input type="hidden" name="type" value='<c:out value="${pageUtil.cri.type }"/>'/>
			<input type="hidden" name="keyword" value='<c:out value="${pageUtil.cri.keyword }"/>'/>
			
		</form>
		
		</div>
	</div>
</main>
<%@ include file="../includes/footer.jsp"%>