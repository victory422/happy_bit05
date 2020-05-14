<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>myrecord</title>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="utf-8">
<script src="https://code.jquery.com/jquery-3.5.0.js"
	integrity="sha256-r/AaFHrszJtwpe+tHyNi/XCfMxYpbsRg2Uqn0x3s2zc="
	crossorigin="anonymous"></script>


<!-- Bootstrap core CSS -->
<link href="../../../resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.carousel-item {
	height: auto;
	width: 100%;
}

a {
	text-decoration: none;
	color: #000000;
}

a:hover {
	color: #ff0000;
}

nav ul li {
	display: inline; /*  세로나열을 가로나열로 변경 */
	border-left: 1px solid #999; /* 각 메뉴의 왼쪽에 "|" 표시(분류 표시) */
	font: bold 12px Dotum; /* 폰트 설정 - 12px의 돋움체 굵은 글씨로 표시 */
	padding: 0 10px; /* 각 메뉴 간격 */
}

.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

.course-text {
	margin-bottom: 30px;
}

.input-group-prepend {
	width: 80px;
}

.map {
	margin: 0;
}
</style>

<script>



</script>

</head>
<body>



	<!-- Navigation -->
<%@ include file="../includes/mobile_topbar.jsp"%>

<!-- 게시글 리스트 출력 테이블 -->
		<div class="table-responsive" id="myCourse">
		<h1 style="text-align: center;">기록 자랑하기</h1>
		<h4 style="text-align: center;">업로드하고싶은 기록을 클릭해주세요.</h4>
			<table class="table table-hover" style="margin-top: 0px;">
				<tr class="active"
					style="font-weight: bold; background-color: #e9ecef;">
					<td width="30%" onclick="sort('LC_TITLE')">제목</td>
					<td width="8%" onclick="sort('PR_TYPE')">코스유형</td>
					<td width="8%"onclick="sort('LC_DISTANCE')">거리<small>(km)</small></td>
					<td width="40%"onclick="sort('ADDRESS')">지역</td>
					<td width="14%"onclick="sort('PR_RECORD')">기록</td>


				</tr>
				<c:if test="${empty list }">
							${"저장된 기록이 없습니다."}
							
				</c:if>
				<tbody id="vals">

					<c:forEach var="val" items="${list}" varStatus="status">

						<tr id="corseDetail" class="success" 
							onclick="upload('${val.PR_INDEX}')">
							<!-- lc_index값 없음  글 업로드 페이지로 가야함  혁희-->
							<td width="30%">${val.LC_TITLE}</td>
							<td width="8%">${val.PR_TYPE}</td>
							<td width="8%">${val.LC_DISTANCE}</td>
							<td width="40%">${val.ADDRESS}</td>
							<td width="14%">${val.PR_RECORD}</td>
							<%-- <td>
								<button
									onclick="location.href='/lc/003/lc_get?lc_index=${val.lc_index}'">
									보기
								</button>
							</td> --%>
						</tr>

					</c:forEach>

				</tbody>
			</table>

</div>


<script type="text/javascript">


var sortType = 'DESC';
var count = 0;

	function sort(searchType) {
		var m_index = ${list.get(0).M_INDEX};
		console.log("searchType : "+searchType);	
		console.log("m_index : "+m_index);
		console.log(sortType);
		
		
		//sort type 주입 (오름차순 내림차순)
		if(count==0) {
			sortType = 'DESC';
			count = 1;
		}else {
			sortType = 'ASC';
			count = 0;
		}
		
		$.ajax({
			type : "post",
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			url : 'mb_007_1/sort',
			data : {"searchType" : searchType,
					"m_index" : m_index,
					"sort" : sortType},
			dataType : "json",
			success : function(data){
				
				var htm = '';
				document.getElementById('vals').firstChild.remove();
				for(var i=0; i<data.length; i++) {
					console.log(data[i]);
					htm += '<tr class="success">';
					htm += '<td>'+data[i]['LC_TITLE']+'</td>';
					htm += '<td>'+data[i]['PR_TYPE']+'</td>';
					htm += '<td>'+data[i]['LC_DISTANCE']+'</td>';
					htm += '<td>'+data[i]['ADDRESS']+'</td>';
					htm += '<td>'+data[i]['PR_RECORD']+'</td>';
					htm += '</tr>';
				}
				
				document.getElementById('vals').innerHTML = htm;

			},
			error : function(request,status,error) {
				console.log("error : "+ (JSON.stringify(request)));
				console.log("error : "+ (JSON.stringify(status)));
				console.log("error : "+ (JSON.stringify(error)));
			}
		});
		
	}
	
		
	

function upload(pr_index){
	var upload = confirm('이 기록을 업로드 하시겠습니까?')
	var pr_index = pr_index;
	if (upload){
		alert("페이지이동경로 넣기");
		location.href="/mb/upload?pr_index="+pr_index
	}
}
	
</script>
</body>
</html>
