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


<div style="padding-left: 280px;padding-right: 100px; "> 
<h1 style="text-align: center; margin-top: 30px;">회원 상세보기</h1>
   <div class="row">
   	<form id="ad_insert" action="/ma/002/insert" method="get">
      <div class="col-lg-12">
     	 <div id="ad" class="input-group mb-1">
						<div class="input-group-prepend">
							<h5 class="my-0 font-weight-normal"><font style="font-weight:bold"> 광고 1 : </t> </font></h5>    
						</div>
						<div class="custom-file">
                 		 &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile0" name="ad_image[0]">
             			</div>
		</div>
     </div>
     <div class="w-100"/>
     <button type="button" onclick="javascript:addAd()">광고 개수 추가.</button>
     <div class="w-100" />
     <input type="submit" value="submit" />
   </div>
   </form>
</div>
         
  
</body>
</html>

<script type="text/javascript">

 var count = 0;
 
	function addAd(){
		
		count++;
		
		if(count > 9){
			alert("광고는 최대 10개 까지 등록 가능합니다.");
		}else{
			var content;
			
			content +=	'<div class="w-100"></div>';
			content +=	'<div class="input-group-prepend">';
			content +=  '	<h5 class="my-0 font-weight-normal"><font style="font-weight:bold"> 광고 ' + (count+1) + ' : </t> </font></h5> ';   
			content +=  '</div>';
			content +=  '<div class="custom-file">';
			content +=	'	 &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile' + count + '" name="ad_image[' + count + ']">';
			content +=	'	</div>'; 
			
			var ad = document.getElementById("ad");
			ad.innerHTML += content;
		}
	}
</script>