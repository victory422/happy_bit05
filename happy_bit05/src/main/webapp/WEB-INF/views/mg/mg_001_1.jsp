
<%@ include file="../includes/topbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<title>메세지함</title>
<style>
.skin_white #container1 {
    background-image: url(https://ssl.pstatic.net/static/pwe/nm/bg_container_dh_white.png);
}
.table td{
	padding: 0em;
}
.button-8{
  width:140px;
  height:50px;
  border:2px solid #34495e;
  float:left;
  text-align:center;
  cursor:pointer;
  position:relative;
  box-sizing:border-box;
  overflow:hidden;
  margin:0 0 40px 50px;
}
.button-8 a{
  font-family:arial;
  font-size:16px;
  color:#fff;
  text-decoration:none;
  line-height:50px;
  transition:all .5s ease;
  z-index:2;
  position:relative;
}
.eff-8{
  width:140px;
  height:50px;
  border:70px solid #34495e;
  position:absolute;
  transition:all .5s ease;
  z-index:1;
  box-sizing:border-box;
}
.button-8:hover .eff-8{
  border:0px solid #34495e;
}
.button-8:hover a{
  color:#34495e;
}
.button-8:hover .eff-8{
  border:0px solid #34495e;
}

/*메세지쓰기 버튼 css  */
@import url(https://fonts.googleapis.com/css?family=BenchNine:700);

.snip1535 {
  background-color: black;
  border: none;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 1em;
  font-size: 22px;
  line-height: 1em;
  margin: 15px 40px;
  outline: none;
  padding: 12px 40px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
}
.snip1535:before,
.snip1535:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 24px;
  position: absolute;
  width: 24px;
}
.snip1535:before {
  border-color: black;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.snip1535:after {
  border-bottom-width: 2px;
  border-color: black;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.snip1535:hover,
.snip1535.hover {
  background-color: white;
  color: black;
  
}
.snip1535:hover:before,
.snip1535.hover:before,
.snip1535:hover:after,
.snip1535.hover:after {
  height: 100%;
  width: 100%;
}

/*검색창  */
.article_search{margin:10px auto;text-align:center}
.article_search_field, .article_search_submit{border:solid 5px #0000FF;font-size:1.0em}
.article_search_field{width:85%;height:20px;padding-left:5px;padding-top:2px}
.article_search_submit{width:10%;height:30px;background-color:#0000FF;color:#fff}
</style>

</head>


<body>

        <div class="col-sm-12 col-md-12 main">
          <h1 class="page-header">메세지함</h1>

		  <!-- 검색창 -->
<div style="margin-top: 30px;" class="row">
			
         <div class="button-8">
		    <div class="eff-8"></div>
		    	<a href="#"> 쪽지 쓰기 </a>
		 </div>
		 <div class="button-8">
		 <div class="eff-8"></div>
		    <a href="#"> ### </a>
 	 </div>
			<div class="col-md-9">
			
			</div>
			<div class="col-md-3">				
				<button class="snip1535 hover">메세지 쓰기</button>
			</div>
	  <!-- 메세지함 출력 테이블 -->
			<div class="table-responsive">
				<table class="table table table-condensed" style="margin-top: 30px;">
					<!-- <tr><td><h2>전체글</h2></td>
					<td style="text-align: right;"><input type="checkbox"></td>
					</tr> -->
					<tr class="active">
						<th width="4%">#</th>
						<th width="4">유형</th>
						<th width="16%">보낸사람</th>
						<th width="64%">내용</th>
						<th width="12%">날짜</th>
					</tr>
					<tr>
						<td>1</td>
						<td>수신</td>
						<td>049-915-8905</td>
						<td>Jason</td>
						<td>049-915-8905</td>
					</tr>
					<tr>
						<td>10</td>
						<td>수신</td>
						<td>049-915-8905</td>
						<td>05 91 32 06 50</td>
						<td>Silas</td>
					</tr>
					<tr>
						<td>7</td>
						<td>수신</td>
						<td>(690) 674-3055</td>
						<td>064-556-5601</td>
						<td>Kermit</td>
					</tr>
					<tr>
						<td>4</td>
						<td>수신</td>
						<td>049-915-8905</td>
						<td>(116) 311-3647</td>
						<td>041-667-7100</td>
					</tr>
					<tr>
						<td>6</td>
						<td>수신</td>
						<td>049-915-8905</td>
						<td>(536) 825-1564</td>
						<td>061-027-8165</td>
					</tr>
					<tr>
						<td>2</td>
						<td>수신</td>
						<td>(646) 899-9311</td>
						<td>049-915-8905</td>
						<td>055-198-5718</td>
					</tr>
					<tr>
						<td>6</td>
						<td>수신</td>
						<td>Kennedy</td>
						<td>(345) 566-3784</td>
						<td>052-187-1319</td>
					</tr>
					<tr>
						<td>3</td>
						<td>수신</td>
						<td>(770) 608-9954</td>
						<td>(582) 284-9735</td>
						<td>031-912-9404</td>
					</tr>
					<tr>
						<td>5</td>
						<td>수신</td>
						<td>049-915-8905</td>
						<td>(832) 864-9949</td>
						<td>055-390-4427</td>
					</tr>
					<tr>
						<td>1</td>
						<td>수신</td>
						<td>(776) 688-8092</td>
						<td>049-915-8905</td>
						<td>062-962-9351</td>
					</tr>
					<tr>
						<td>1</td>
						<td>수신</td>
						<td>(424) 160-7340</td>
						<td>049-915-8905</td>
						<td>062-170-6865</td>
					</tr>
					<tr>
						<td>1</td>
						<td>수신</td>
						<td>04 63 34 06 05</td>
						<td>Chaim</td>
						<td>043-417-5837</td>
					</tr>

								<%-- 					<tbody id="table_list">
						<c:forEach var="board" items="${list }">
							<tr class="success" style="text-align: center;">
								<td>${board.li_index }</td>
								<td>
									<c:out value="${board.li_type eq 'all'?'전체': board.li_type}"/>
								</td>
								<td onclick="location.href='/li/li_006_1?li_index=${board.li_index }&li_b_type=${board.li_b_type}&page=${page}'"><button type="button" onclick="location.href='/li/li_006_1?page=${page }&li_index=${board.li_index }&li_b_type=${board.li_b_type}'" class="btn btn-link">${board.li_title }</button></td>
								<td>${board.li_category }</td>
								<td>${board.m_index }</td>
								<td>${board.li_date }</td>
							</tr>
						</c:forEach>
					</tbody>
 --%>
							</table>
			</div>
         
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
	

			
			
			
			
			
			
<script>
$(".hover").mouseleave(
		  function() {
		    $(this).removeClass("hover");
		  }
		);
</script>

<%@ include file="../includes/footer.jsp"%>
