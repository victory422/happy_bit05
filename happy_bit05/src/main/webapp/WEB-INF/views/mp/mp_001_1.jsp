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
  height:50px;
  text-align: center;
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
  


</style>

</head>

<body>

  <div class="container">

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">My Page
    	<small>&nbsp;환영합니다! ${sessionVO.m_id}님</small>
	</h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">Home</a>
      </li>
      <li class="breadcrumb-item active">Portfolio 2</li>
    </ol>

    <div class="row">
    <!-- 내 정보 -->
      <div class="col-lg-12 portfolio-item">
        <div class="card h-100">
          <div class="card-body">
			
			<form action="/mp/memberUpdate" method="post" name="userinput" enctype="multipart/form-data">
			<table style="margin:auto;" id="memberTable">
	          	<tr id="tr">
	          		<td rowspan="6" class="td" id="m_picture" style="width: 40%;">
	          			<img alt="" src="data:image/jsp;base64, ${sessionVO.m_picture}" height="200"/>
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
	          			<a id="btn" onclick="pwChk(1)" class="btn btn-primary " 
	          			style="color: #fff; font-weight: 400; cursor: pointer;">회원정보 수정 </a> 
	          		</td>
			          	<input type="hidden" id="passwordConfirm2">
	          	</tr>
	          </table>
	          	</form>
			
          </div>
        </div>
     </div>

    <!-- 나의 관심코스 -->
      <div class="col-lg-12 portfolio-item">
        <div class="card h-100">
          <div class="card-body" id="importMyCourse" style="background-color: #e9ecef;">
          	<a href="/mp/myCourse">나의 관심코스 보기</a>
          </div>
          <div class="card-body" id="importMyCourse">
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
					<td>원글</td>


				</tr>
				<c:if test="${empty listVO }">
							<h6 onload="blind()" id="blind">${"등록된 관심코스가 없습니다."}</h6>
							
				</c:if>
				<tbody id="">

					<c:forEach var="val" items="${listVO }" varStatus="status">


						<tr id="corseDetail" class="success" style="text-align: center;"
							onclick="downPage('${val.rn}','${val.lc_type}','${val.lc_title}',
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
							<td>
								<button
									onclick="location.href='/lc/003/lc_get?lc_index=${val.lc_index}'">
									보기
								</button>
							</td>
						</tr>

					</c:forEach>

				</tbody>
			</table>

			<div id="row">
				<!-- 페이징 없음 -->
			</div>
          	</div>

            <h6 class="card-title al-center">
              <a href="/mp/myCourse">상세보기</a>
            </h6>
          </div>
        </div>
      </div>

	<!-- 나의 대회 -->
      <div class="col-lg-12 portfolio-item">
        <div class="card h-100">
          <div class="card-body" id="" style="background-color: #e9ecef; ">
          	<a href="/mp/myCompetition">나의 대회 보기</a>
          </div>
          <div class="card-body" id="" >
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
	
	
							<tr id="corseDetail" class="success" style="text-align: center;"
								onclick="">
	
								<td style="text-align: left;">${val.co_b_title}</td>
								<td>${val.co_b_day}</td>
								<td>${val.co_b_area}</td>
								<td>${val.co_b_type}</td>
								<td>
									<button
										onclick="location.href='/co/co_004_1'">
										보기
									</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
	
				<div id="row">
					<!-- 페이징 없음 -->
				</div>
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
        <div class="card h-100">
          <div class="card-body" id="" style="background-color: #e9ecef;">
          	<a href="/mp/myPost">내 글</a>
          </div>
          <div class="card-body" id="" >
				<div class="table-responsive" id="" style="margin-top : -30px;">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr class="active"
						style="font-weight: bold; background-color: #e9ecef; text-align: center;">
						<td style="width: 8%">게시판</td>
						<td style="width: 20%">제목</td>
						<td style="width: 8%">추천</td>
						<td style="width: 8%">조회</td>
						<td style="width: 8%">게시일</td>
					</tr>
					<c:if test="${empty getAllMyPost }">
								${"내가 작성한 글이 없습니다."} 
								
								
					</c:if>
					<tbody id="">
	
						<c:forEach var="val" items="${getAllMyPost }" varStatus="status">
	
	
							<tr id="corseDetail" class="success" 
								onclick="location.href='/?/?=${val.T_INDEX}'">
								<td>${val.TABLENAME}</td>
								<td>${val.TITLE}</td>
								<td>${val.GOOD}</td>
								<td>${val.SEE}</td>
								<td>${val.REGISTDATE}</td>
							</tr>
	
						</c:forEach>
	
					</tbody>
				</table>
	
				<div id="row">
					<!-- 페이징 없음 -->
				</div>
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
        <div class="card h-100">
          <div class="card-body" id="" style="background-color: #e9ecef;">
          	<a href="/mp/replys">내 글의 댓글</a>
          </div>
          <div class="card-body" id="" >
				<div class="table-responsive" id="" style="margin-top : -30px;">
				<table class="table table-hover" style="margin-top: 30px;">
					<tr class="active"
						style="font-weight: bold; background-color: #e9ecef; text-align: center;">
						<td style="width: 8%">게시판</td>
						<td style="width: 20%">제목</td>
						<td style="width: 8%">추천</td>
						<td style="width: 8%">조회</td>
						<td style="width: 8%">게시일</td>
					</tr>
					<c:if test="${empty getAllMyPost }">
								${"내가 작성한 글이 없습니다."} 
								
								
					</c:if>
					<tbody id="">
	
						<c:forEach var="val" items="${getAllMyPost }" varStatus="status">
	
	
							<tr id="corseDetail" class="success" 
								onclick="location.href='/?/?=${val.T_INDEX}'">
								<td>${val.TABLENAME}</td>
								<td>${val.TITLE}</td>
								<td>${val.GOOD}</td>
								<td>${val.SEE}</td>
								<td>${val.REGISTDATE}</td>
							</tr>
	
						</c:forEach>
	
					</tbody>
				</table>
	
				<div id="row">
					<!-- 페이징 없음 -->
				</div>
          	</div>
	          	
	          	<h6 class="card-title" style="margin-bottom: -10px;">&nbsp;</h6>
	            <h6 class="card-title al-center">
	              <a href="/mp/replys">상세보기</a>
	            </h6>
            </div>
          </div>
        </div>
        
        
      </div> <!-- /.row -->


    
	</div>
</body>

<script type="text/javascript">

function pwChk(check) {
	var url = "/lo2";
	var name = "비밀번호 확인";
	var option = "width = 400, height = 260, top = 100, left = 200, location = no";
	console.log("check is : "+check);
	console.log(check=='1');
	if(check=='1'){
		sessionStorage.setItem("password",'${sessionVO.m_pw}');
		sessionStorage.removeItem("passwordUpdate");
		console.log(sessionStorage.getItem("passwordUpdate"));
	}else if(check=='2') {
		//썸네일 업로드 확인 (없을 시 기존 썸네일로 대체하기 위함)
		var thumbnail = document.getElementById('file'); //input file Element
		
		if(thumbnail.value == ""){ //썸네일 없을 시 input file 삭제
			var m_picture = document.getElementById('m_picture');
			m_picture.removeChild(thumbnail);
		}//썸네일 있을 시 기존대로 진행
		
		var newPassword = document.getElementById('secondPw').value;
		console.log("두번째 비밀번호 : "+newPassword);
		sessionStorage.setItem("password",newPassword);
		sessionStorage.setItem("passwordUpdate","0");
	
	}else if(check=='-1'){
		location = '/mp';
	}
	window.open(url, name, option);
	console.log(document.getElementById('btn').firstChild.nodeValue);
}

function pClose() {
	console.log('aaa??');
	var passwordCheck = document.getElementById("passwordConfirm2").value;
	console.log(passwordCheck);
	if(passwordCheck == 'true') {
    	memberUpdate();
		
    	passwordCheck = null;
    	
	}else if(passwordCheck == 'updateTrue') {
		document.getElementById('btn').firstChild.nodeValue = "비밀번호 확인";
		document.getElementById('btn').setAttribute("onclick","pwChk(1)");
		passwordCheck = null;
		
		//  /mp/memberUpdate로 서브밋	
		var form = document.userinput;
	    form.submit();
	    
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

</script>


<%@ include file="../includes/footer.jsp"%>