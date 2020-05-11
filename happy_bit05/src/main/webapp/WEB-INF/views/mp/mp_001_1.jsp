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

.table-left {
	display: inline;
	background-color: #e9ecef;
	top: 0;
	bottom: 0;
	margin: auto;
	text-align: center;
	font-weight: bold;
	box-shadow: 0 0 2px #E50F0F;
}

.table-right {
	display: inline;
	background-color: white;
	top: 0;
	bottom: 0;
	margin: auto;
	text-align: center;
	font-weight: bold;
	box-shadow: 0 0 2px #E50F0F;
}

.tr {
  display: table-cell;
  background: #333;
  box-shadow: 0 0 2px #E50F0F; 
  color: #fff;
  text-align: center;
  width : 80px;
  padding-left: 10px;
  padding-right: 10px;
}

.td {
  display: table-cell;
  box-shadow: 0 0 2px #E50F0F;
  vertical-align: middle;
  height:50px;
  text-align: center;
  padding-left: 10px;
  padding-right: 10px;
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
	          		<td rowspan="5" class="td" id="m_picture">
	          			<img alt="" src="data:image/jsp;base64, ${sessionVO.m_picture}" height="200"/>
	          		</td>
	          		<td class="tr" >nickName</td>
	          		<td class="td" id="m_nick">${sessionVO.m_nickName}</td>
	          		<td class="tr" >E-mail</td>
	          		<td class="td" id="m_email">${sessionVO.m_email_1}</td>
	          	</tr>
	            <tr>
	            	<td class="tr">name</td>
	                <td class="td" id="m_name">${sessionVO.m_name}</td>
	            	<td class="tr">Phone</td>
	                <td class="td" id="m_tel"> ${sessionVO.m_tel}</td>
	                
	            </tr>
	            <tr>
	            	<td class="tr">gender</td>
	                <td class="td" id="m_gender">${sessionVO.m_gender}</td>
	            	<td class="tr">address</td>
	                <td class="td" id="m_address"> ${sessionVO.m_address}</td>
	            </tr>
	            <tr>
	            	<td class="tr">birth</td>
	                <td class="td" id="m_birth">${sessionVO.m_birth}</td>
	            	<td class="tr">password</td>
	                <td class="td" id="m_pw">********</td>
	            </tr>
	          	<tr>
	          		<td colspan="4" class="td" id="confirmBtn">
	          			<a id="btn" onclick="pwChk(1)" style="cursor: pointer;">비밀번호 확인 </a>
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
          	
          	
            <h6 class="card-title" style="margin-bottom: -10px; float: right;">
              <a href="/mp/myCourse">상세보기</a>
            </h6>
          </div>
        </div>
      </div>
      <div class="col-lg-6 portfolio-item">
        <div class="card h-100">
          <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
          <div class="card-body">
            <h4 class="card-title">
              <a href="#">Project Two</a>
            </h4>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit aliquam aperiam nulla perferendis dolor nobis numquam, rem expedita, aliquid optio, alias illum eaque. Non magni, voluptates quae, necessitatibus unde temporibus.</p>
          </div>
        </div>
      </div>


    <!-- /.row -->
	</div>
  </div>
</body>

<script type="text/javascript">

function pwChk(check) {
	var url = "/lo2";
	var name = "비밀번호 확인";
	var option = "width = 400, height = 260, top = 100, left = 200, location = no";
	console.log("check is : "+check);
	if(check=='1'){
		sessionStorage.setItem("password",'${sessionVO.m_pw}');
		sessionStorage.removeItem("passwordUpdate");
		console.log(sessionStorage.getItem("passwordUpdate"));
	}else if(check=='2') {
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
	var passwordCheck = document.getElementById("passwordConfirm2").value;
	console.log(passwordCheck);
	if(passwordCheck == 'true') {
    	document.getElementById('btn').firstChild.nodeValue = "회원정보 수정하기";
    	document.getElementById('btn').setAttribute("onclick","memberUpdate()");
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
	alert("회원정보 수정하기");
	//클릭 시 수정하는 페이지로 바꿔주는 함수
	
	//m_nick 
	var m_nick = document.getElementById('m_nick');
	var m_nick_input = document.createElement("input");
	if(m_nick.hasChildNodes()) {
		m_nick.firstChild.nodeValue = "";
	}
	m_nick_input.setAttribute("value", "${sessionVO.m_nickName}"); 
	m_nick_input.setAttribute("name", "m_nickName");
	m_nick_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_nick.appendChild(m_nick_input);
	 
	//m_email
	var m_email = document.getElementById('m_email');
	var m_email_input = document.createElement("input");
	if(m_email.hasChildNodes()) {
		m_email.firstChild.nodeValue = "";
	}
	m_email_input.setAttribute("value", "${sessionVO.m_email_1}"); 
	m_email_input.setAttribute("name", "m_email_1");
	m_email_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_email.appendChild(m_email_input);
	 
	//m_name
	var m_name = document.getElementById('m_name');
	var m_name_input = document.createElement("input");
	if(m_name.hasChildNodes()) {
		m_name.firstChild.nodeValue = "";
	}
	m_name_input.setAttribute("value", "${sessionVO.m_name}"); 
	m_name_input.setAttribute("name", "m_name");
	m_name_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_name.appendChild(m_name_input);
	
	 
	//m_tel
	var m_tel = document.getElementById('m_tel');
	var m_tel_input = document.createElement("input");
	if(m_tel.hasChildNodes()) {
		m_tel.firstChild.nodeValue = "";
	}
	m_tel_input.setAttribute("value", "${sessionVO.m_tel}"); 
	m_tel_input.setAttribute("name", "m_tel");
	m_tel_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_tel.appendChild(m_tel_input);
	
	
	//m_address
	var m_address = document.getElementById('m_address');
	var m_address_input = document.createElement("input");
	if(m_address.hasChildNodes()) {
		m_address.firstChild.nodeValue = "";
	}
	m_address_input.setAttribute("value", "${sessionVO.m_address}");
	m_address_input.setAttribute("name", "m_address");
	m_address_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_address.appendChild(m_address_input);
	
	//m_pw
	var m_pw = document.getElementById('m_pw');
	var m_pw_input = document.createElement("input");
	if(m_pw.hasChildNodes()) {
		m_pw.firstChild.nodeValue = "";
	}
	m_pw_input.setAttribute("name", "m_pw1"); 
	m_pw_input.setAttribute("type", "password"); 
	m_pw_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_pw_input.setAttribute("id", "secondPw"); 
	m_pw.appendChild(m_pw_input);
	
	//m_picture
	var m_picture = document.getElementById('m_picture');
	var m_picture_input = document.createElement("input");
	if(m_picture.hasChildNodes()) {
		m_picture.firstChild.nodeValue = "";
	}
	m_picture_input.setAttribute("value", "${sessionVO.m_picture}"); 
	m_picture_input.setAttribute("name", "m_picture");
	m_picture_input.setAttribute("type", "file"); 
	m_picture_input.setAttribute("style", "text-align:center; width:120px;"); 
	m_picture.appendChild(m_picture_input);
	
	//버튼 바꾸기
	document.getElementById('btn').firstChild.nodeValue = "회원정보 수정완료 (비밀번호 확인)";
	document.getElementById('btn').setAttribute("onclick","pwChk(2)");
}


</script>


<%@ include file="../includes/footer.jsp"%>