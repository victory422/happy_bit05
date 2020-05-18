<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>MY Page</title>

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
<style>

.tr {
  display: table-cell;
  background: #333;
  box-shadow: 0 0 2px #E50F0F; 
  color: #fff;
  text-align: center;
  width : 80px;
  padding-left: 10px;
  padding-right: 10px;
  width: 8%;
}

.td {
  display: table-cell;
  box-shadow: 0 0 2px #E50F0F;
  vertical-align: middle;
  height:50px;
  text-align: center;
  padding-left: 10px;
  padding-right: 10px;
  width: : 20%;
}

.td2 {
  display: table-cell;
  box-shadow: 0 0 2px #E50F0F;
  vertical-align: middle;
  text-align: center;
  height:50px;
  padding-left: 10px;
  padding-right: 10px;
  width: : 48%;
  }
  
 .al-center {
	margin-bottom : -10px; 
	margin: auto;
	float : right;  
	position: relative; 
	left: -50%;"
 }
 
 .headLine {
    display: -ms-flexbox;
    display: flex;
    padding: .55rem 1rem;
    margin-top: 1rem;
    list-style: none;
    background-color: #9c959d;
    border-radius: .25rem;
}

  .card-custom {
    position: relative;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: column;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0,0,0,.125);
    border-radius: .50rem;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",
	    Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,
	    "Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol",
	    "Noto Color Emoji";
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #212529;
    text-align: left;
}

.thumbnail-wrappper { 
	width: 25%; 
	height: 200px; 
	overflow: hidden; 
	vertical-align: middle;
	text-align: center;
} 

img { 
	max-width: 50%; 
	height: auto; 
	display: block; 
	margin: 0px auto;
	}



</style>

</head>

<body>

  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">My Page
    	<small>&nbsp;환영합니다! ${sessionVO.m_id}님</small>
	</h1>



    <div class="row">
    <!-- 내 정보 -->
      <div class="col-lg-12 portfolio-item">
		<ol class="headLine">
      		<li class="breadcrumb-item">
        		<a href="#" style="color: white;">내 정보</a>
      		</li>
    	</ol>
        <div class="card-custom">
			
			<form action="/mp/memberUpdate" method="post" name="userinput" enctype="multipart/form-data" id="memberTable" >
			<table class="table-responsive" style="margin:auto;" id="">
	          	<tr id="tr">
	          		<td rowspan="6" class="thumbnail-wrapper" id="m_picture" style="width: 40%;">
	          			<img alt="" src="data:image/jsp;base64, ${sessionVO.m_picture}"/>
	          		</td>
	          		<td class="tr" >nickName</td>
	          		<td class="td" id="m_nick">${sessionVO.m_nickName}</td>
	          		<td class="tr">name</td>
	                <td class="td" id="m_name">${sessionVO.m_name}</td>
	          		
	          	</tr>
	            <tr>
	            	<td class="tr">Phone</td>
	                <td class="td" id="m_tel"> ${sessionVO.m_tel}</td>
	                <td class="tr">password</td>
	                <td class="td" id="m_pw">********</td>
				</tr>
	            <tr>
	            	<td class="tr">gender</td>
	                <td class="td" id="m_gender">${sessionVO.m_gender}</td>
	                <td class="tr">birth</td>
	                <td class="td" id="m_birth">${sessionVO.m_birth}</td>

	            </tr>
	            <tr>
					<td class="tr" >E-mail</td>
	          		<td colspan="3" class="td2" id="m_email">${sessionVO.m_email_1}</td>
	            </tr>
	            <tr>
	            	<td class="tr">address</td>
	                <td colspan="3" class="td2" id="m_address"> ${sessionVO.m_address}</td>
	            </tr>
	          	<tr>
	          		<td colspan="4" class="td" id="confirmBtn" style="background-color: #C0FFFF;">
	          			<a id="btn" onclick="pwChk(1)" class="btn-primary " 
	          			style="color: #fff; font-weight: 400; cursor: pointer; width : 70%;
	          			background-color: #6c757d; border-color: #6c757d;">회원정보 수정 </a> 
	          		</td>
			          	<input type="hidden" id="passwordConfirm2">
	          	</tr>
	          </table>
	          	</form>
			
          </div>
        </div>
     

    <!-- 나의 관심코스 -->
    
      <div class="col-lg-12 portfolio-item">
		<ol class="headLine">
      		<li class="breadcrumb-item">
        		<a href="/mp/myCourse" style="color: white;">나의 관심코스 보기</a>
      		</li>
    	</ol>
        <div class="card-custom">
          <div class="card-body">
          <!-- 관심코스 리스트 -->
          	<div class="table-responsive" id="myCourse" style="margin-top : -30px;">
			<table class="table table-hover" style="margin-top: 30px;">
				<tr class="active"
					style="font-weight: bold; background-color: #e9ecef; text-align: center;">
					<td>No</td>
					<td>제목</td>
					<td>종목</td>
					<td>거리</td>
					<td>도보</td>
					<td>자전거</td>
					<td>지역</td>
					<td>추천</td>
					<td>등록일</td>


				</tr>
				<c:if test="${empty listVO }">
							<h6>${"등록된 관심코스가 없습니다."}</h6>
							
				</c:if>
				<tbody id="">

					<c:forEach var="val" items="${listVO }" varStatus="status">


						<tr id="corseDetail" class="success" style="text-align: center;"
							onclick="popup('${val.rn}','${val.lc_type}','${val.lc_title}',
							'${val.m_index}','${val.lc_distance}','${val.lc_record}',
							'${val.lc_date}','${val.lc_index}','${val.lc_xy_arr}')">

							<td>${val.rn}</td>
							<td style="text-align: left;">${val.lc_title}</td>
							<td>${val.lc_type}</td>
							<td>${val.lc_distance}</td>
							<td>${val.lc_run}</td>
							<td>${val.lc_cycle}</td>
							<td>${val.lc_address}</td>
							<td>${val.lc_good}</td>
							<td>${val.lc_date}</td>
						</tr>

					</c:forEach>

				</tbody>
			</table>
          	</div>

            <h6 class="card-title al-center">
              <a href="/mp/myCourse">상세보기</a>
            </h6>
          </div>
        </div>
      </div>

	<!-- 나의 대회 -->
      <div class="col-lg-12 portfolio-item">
      	<ol class="headLine">
      		<li class="breadcrumb-item">
        		<a href="/mp/myCompetition" style="color: white;">나의 대회 보기</a>
      		</li>
    	</ol>
         <div class="card-custom">
          <div class="card-body" >
				<div class="table-responsive" id="" style="margin-top : -30px;">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr class="active" 
						style="font-weight: bold; background-color: #e9ecef; text-align: center;">
						<td style="width: 40%">제목</td>
						<td style="width: 15%">일시</td>
						<td style="width: 15%">장소</td>
						<td style="width: 15%">종목</td>
						<td style="width: 15%">후기</td>
	
	
					</tr>
					<c:if test="${empty listCompetition }">
								${"신청한 대회가 없습니다."} &nbsp;
								<small>
									<a href="/co/co_003_1">대회 신청하러 가기</a>
								</small>
								
					</c:if>
					<tbody id="">
	
						<c:forEach var="val" items="${listCompetition }" varStatus="status">
	
	
							<tr id="corseDetail" class="success" style="text-align: center;">
	
								<td style="text-align: left;" onclick="location.href='/co/co_004_1?co_b_index=${val.co_b_index}'">
									${val.co_b_title}
								</td>
								<td onclick="location.href='/co/co_004_1?co_b_index=${val.co_b_index}'">
									${val.co_b_day}
								</td>
								<td onclick="location.href='/co/co_004_1?co_b_index=${val.co_b_index}'">
									${val.co_b_area}
								</td>
								<td onclick="location.href='/co/co_004_1?co_b_index=${val.co_b_index}'">
									${val.co_b_type}
								</td>
								<td>
									<button class="btn btn-primary" style="background-color: #6c757d; border-color: #6c757d;"
										onclick="location.href='/cr/cr_001_1'">
										보기
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
          	</div>
	          	
          	<h6 class="card-title" style="margin-bottom: -10px;">&nbsp;</h6>
            <h6 class="card-title al-center">
              <a href="/mp/myCompetition">상세보기</a>
            </h6>
            </div>
          </div>
        </div>
        
        	<!-- 내 글 목록 -->
      <div class="col-lg-6 portfolio-item">
      	<ol class="headLine">
      		<li class="breadcrumb-item">
        		<a href="/mp/myPost" style="color: white;">내 글</a>
      		</li>
    	</ol>
		<div class="card-custom">
          <div class="card-body">
				<div class="table-responsive" id="" style="margin-top : -30px;">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr class="active"
						style="font-weight: bold; background-color: #e9ecef; text-align: center;">
						<td style="width: 20%">게시판</td>
						<td style="width: 20%">제목</td>
						<td style="width: 10%">추천</td>
						<td style="width: 10%">조회</td>
						<td style="width: 7%">게시일</td>
					</tr>
					<c:if test="${empty getAllMyPost }">
								${"내가 작성한 글이 없습니다."} 
					</c:if>
					<tbody>
	
						<c:forEach var="val" items="${getAllMyPost }" varStatus="status">
	
							<tr id="corseDetail" class="success" style="text-align : center;"
								onclick="goPage('${val.TABLENAME}', '${val.T_INDEX}')">
								<td>${val.TABLENAME}</td>
								<td>${val.TITLE}</td>
								<td>${val.GOOD}</td>
								<td>${val.SEE}</td>
								<td>${val.REGISTDATE}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
          	</div>
	          	
	          	<h6 class="card-title" style="margin-bottom: -10px;">&nbsp;</h6>
	            <h6 class="card-title al-center">
	              <a href="/mp/myPost">상세보기</a>
	            </h6>
            </div>
          </div>
        </div>
        
                	<!-- 내 글의 댓글 목록 -->
       <div class="col-lg-6 portfolio-item">
       	<ol class="headLine">
      		<li class="breadcrumb-item">
        		<a href="/mp/replys" style="color: white;">내 글의 댓글</a>
      		</li>
    	</ol>
        <div class="card-custom">
          <div class="card-body" id="" >
			<div class="table-responsive" id="" style="margin-top : -30px;">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr class="active"
						style="font-weight: bold; background-color: #e9ecef; text-align: center;">
						<td style="width: 20%">게시판</td>
						<td style="width: 20%">제목</td>
						<td style="width: 20%">댓글내용</td>
					</tr>
					<c:if test="${empty replyList }">
								${"내 글에 댓글이 없습니다."} 
					</c:if>
					<tbody>
						<c:forEach var="val" items="${replyList }" varStatus="status">
	
							<tr id="corseDetail" class="success" style="text-align : center;"
								onclick="goPage('${val.TABLENAME}', '${val.T_INDEX}')">
								<td>${val.TABLENAME}</td>
								<td>${val.TITLE}</td>
								<td>${val.COM_TEXT}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
         	</div>
	          	
          	<h6 class="card-title" style="margin-bottom: -10px;">&nbsp;</h6>
            <h6 class="card-title al-center">
              <a href="/mp/replys">상세보기</a>
            </h6>
            </div>
          </div>
        </div>
        
      </div> <!-- /.row -->
	</div> <!-- /.container -->
</body>

<script type="text/javascript">

window.onload = function() {
	console.log("path : "+'${path}');
	if('${path}'=='/mp/memberUpdate'){
		location = '/mp';
	}
}

function pwChk(check) {
	var url = "/lo2";
	var name = "비밀번호 확인";
	var option = "width = 400, height = 260, top = 100, left = 200, location = no";
	console.log("check is : "+check);
	console.log(check=='1');
	if(check=='1'){
		sessionStorage.setItem("password",'${sessionVO.m_pw}');
		sessionStorage.removeItem("passwordUpdate");
	}else if(check=='2') {
		//썸네일 업로드 확인 (없을 시 기존 썸네일로 대체하기 위함)
		var thumbnail = document.getElementById('file'); //input file Element
			console.log("썸네일 null : ");
			console.log(thumbnail.value == "");
		if(thumbnail.value == ""){ //썸네일 없을 시 input file 삭제
			var m_picture = document.getElementById('m_picture');
			m_picture.removeChild(thumbnail);
		}//썸네일 있을 시 기존대로 진행
		
		var newPassword = document.getElementById('secondPw').value;
		sessionStorage.setItem("password",newPassword);
		sessionStorage.setItem("passwordUpdate","0");
		
	}else if(check=='-1'){
		location = '/mp';
	}
	console.log("open login window");
	window.open(url, name, option);
	console.log(document.getElementById('btn').firstChild.nodeValue);
}

function pClose() {
	var passwordCheck = document.getElementById("passwordConfirm2").value;
	console.log(passwordCheck);
	if(passwordCheck == 'true') {
    	memberUpdate();
		
    	passwordCheck = null;
    	
	}else if(passwordCheck == 'updateTrue') {
		alert("updateTrue");
		document.getElementById('btn').firstChild.nodeValue = "비밀번호 확인";
		document.getElementById('btn').setAttribute("onclick","pwChk(1)");
		passwordCheck = null;
		
		//  /mp/memberUpdate로 서브밋	
		var formId = document.getElementById('memberTable');
		console.log(formId);
		formId.submit();
	    
	}else{
		alert("회원정보 수정 취소");
		window.location.replace("/mp");
	}
}

function memberUpdate() {

	
	//클릭 시 수정하는 페이지로 바꿔주는 함수
	//m_nick 
	var m_nick = document.getElementById('m_nick');
	var m_nick_input = document.createElement("input");
	if(m_nick.hasChildNodes()) {
		m_nick.firstChild.nodeValue = "";
	}
	m_nick_input.setAttribute("value", "${sessionVO.m_nickName}"); 
	m_nick_input.setAttribute("name", "m_nickName");
	m_nick_input.setAttribute("style", "text-align:center; width:80%;"); 
	m_nick.appendChild(m_nick_input);
	 
	//m_email
	var m_email = document.getElementById('m_email');
	var m_email_input = document.createElement("input");
	if(m_email.hasChildNodes()) {
		m_email.firstChild.nodeValue = "";
	}
	m_email_input.setAttribute("value", "${sessionVO.m_email_1}"); 
	m_email_input.setAttribute("name", "m_email_1");
	m_email_input.setAttribute("style", "text-align:center; width:100%;"); 
	m_email.appendChild(m_email_input);
	 
	//m_name
	var m_name = document.getElementById('m_name');
	var m_name_input = document.createElement("input");
	if(m_name.hasChildNodes()) {
		m_name.firstChild.nodeValue = "";
	}
	m_name_input.setAttribute("value", "${sessionVO.m_name}"); 
	m_name_input.setAttribute("name", "m_name");
	m_name_input.setAttribute("style", "text-align:center; width:80%;"); 
	m_name.appendChild(m_name_input);
	
	 
	//m_tel
	var m_tel = document.getElementById('m_tel');
	var m_tel_input = document.createElement("input");
	if(m_tel.hasChildNodes()) {
		m_tel.firstChild.nodeValue = "";
	}
	m_tel_input.setAttribute("value", "${sessionVO.m_tel}"); 
	m_tel_input.setAttribute("name", "m_tel");
	m_tel_input.setAttribute("style", "text-align:center; width:80%;"); 
	m_tel.appendChild(m_tel_input);
	
	
	//m_address
	var m_address = document.getElementById('m_address');
	var m_address_input = document.createElement("input");
	if(m_address.hasChildNodes()) {
		m_address.firstChild.nodeValue = "";
	}
	m_address_input.setAttribute("value", "${sessionVO.m_address}");
	m_address_input.setAttribute("name", "m_address");
	m_address_input.setAttribute("style", "text-align:center; width:100%;"); 
	m_address.appendChild(m_address_input);
	
	//m_pw
	var m_pw = document.getElementById('m_pw');
	var m_pw_input = document.createElement("input");
	if(m_pw.hasChildNodes()) {
		m_pw.firstChild.nodeValue = "";
	}
	m_pw_input.setAttribute("value", "${sessionVO.m_pw}"); 
	m_pw_input.setAttribute("name", "m_pw1"); 
	m_pw_input.setAttribute("type", "password"); 
	m_pw_input.setAttribute("style", "text-align:center; width:80%;"); 
	m_pw_input.setAttribute("id", "secondPw"); 
	m_pw.appendChild(m_pw_input);
	
	//m_picture
	var m_picture = document.getElementById('m_picture');
	var m_picture_input = document.createElement("input");
	if(m_picture.hasChildNodes()) {
		m_picture.firstChild.nodeValue = "";
	}
	m_picture.firstChild.nextSibling.setAttribute("src", ""); 
	m_picture_input.setAttribute("name", "m_picture");
	m_picture_input.setAttribute("id", "file");
	m_picture_input.setAttribute("type", "file"); 
	m_picture_input.setAttribute("style", "text-align:center; width:100%;"); 
	m_picture.appendChild(m_picture_input);
	
	//버튼 바꾸기
	document.getElementById('btn').firstChild.nodeValue = "회원정보 수정완료 (비밀번호 확인)";
	document.getElementById('btn').setAttribute("onclick","pwChk(2)");
}

// 내 글 , 내 댓글에서 게시판 상세페이지로 보내는 함수

function goPage(tableName, t_index ) {
	console.log("tableName :"+tableName);
	console.log("t_index :"+t_index);
	
	switch (tableName) {
		case '기록게시판' :
			location.href = '/pr/pr_003_1?pr_index='+t_index ;
			break;
			
		case '장비TIP' :
			location.href = '/li/li_006_1?li_index='+t_index+'&li_b_type=후기게시판';
			break;
			
		case '코스게시판' :
			location.href = '/lc/003/lc_get?lc_index='+t_index ;
			break;
			
		case '대회리뷰게시판' :
			location.href = '/cr/cr_003_1?co_r_index='+t_index ;
			break;
			
		case '트레이닝TIP' :
			location.href = '/lt/lt_004_1?index='+t_index;
			break;
			
			default : alert("error!");
	} 
}

function popup(rn, lc_type, lc_title, m_index, lc_distance, lc_record, lc_date,
		lc_index,lc_xy_arr) {
	alert("상세보기에서 확인가능합니다.");

	
}



</script>


<%@ include file="../includes/footer.jsp"%>