<%@include file="../includes/topbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<title>Insert title here</title>
<script type="text/javascript"
	src="../../../resources/CKEditorSample/ckeditor/ckeditor.js"></script>
	 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script type="text/javascript"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script src="http://code.highcharts.com/highcharts.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.css">
<script src="https://uicdn.toast.com/tui.date-picker/latest/tui-date-picker.js"></script>
</head>

<div class="container" style="margin-top:20px; margin-bottom:20px;">
	<div class="content" style="width: 1000px">
		<form action="ac_001_1.do" method="post" enctype="multipart/form-data"> 
		<div class="row justify-content-md-center">
			<div class="col-sm-9">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label class="input-group-text">제목</label>
					</div>
					<input type="text" class="form-control" name="co_b_title">
				</div>
			</div>
			
			<div class="col-sm-3">
				<div class="input-group mb-3">
					<select class="custom-select" id="inputGroupSelect03" name="co_b_type">
						<option selected>분류</option>
						<option value="육상">육상</option>
						<option value="자전거">자전거</option>
					</select>
				</div>
			</div>
			
		</div>
		<div class="row justify-content-md-center">
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">일자</label>
					<div class="tui-datepicker-input tui-datetime-input tui-has-focus" style="z-index: 1; height: 38px;">
                            <input type="text" name="co_b_day"id="date" class="form-control text-center" aria-label="Date-Time" readonly>
                            <span class="tui-ico-date"></span>
                            <div id="wrapper2"></div>
                    </div>
				</div>
                        <label class="input-group-text">시간</label><input type="text" class="form-control" name="co_b_time">
			</div>
		</div>
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">접수기한</label>
					
					   
					<div class="tui-datepicker-input tui-datetime-input tui-has-focus" style="z-index: 1; height: 38px;">
                            <input type="text" name="co_b_start"id="start" class="form-control text-center" aria-label="Date-Time" readonly>
                            <span class="tui-ico-date"></span>
                            <div id="wrapper"></div>
                    </div>
                    &nbsp; ~ &nbsp;
                      <div class="tui-datepicker-input tui-datetime-input tui-has-focus" style="z-index: 1; height: 38px;">
                            <input type="text" name="co_b_end"id="end" class="form-control text-center" aria-label="Date-Time" readonly>
                            <span class="tui-ico-date"></span>
                            <div id="wrapper1"></div>
                    </div>
                    
                   
				</div>
				 <!-- <input type="text" class="form-control" name="co_b_period"> -->
			</div>
		</div>
		
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">장소</label>
				</div>
				<input type="text" class="form-control" name="co_b_area">
			</div>
		
		</div>
		<div class="col-sm-6">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">참가비</label>
				</div>
				<input type="text" class="form-control" name="co_b_price">	
			</div>
		</div>
		<div class="col-sm-6 ac_sou">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">기념품</label>
				</div>
				
				<input type="text" class="form-control" name="co_souvenir" id="ac_souvenirid">
				<button class="btn btn-primary" type="button" id="ac_souveniradd">추가</button>	
				
			</div>
		</div>
		<div class="col-sm-6 ac_rat">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<label class="input-group-text">종목/등급</label>
				</div>
				
				<input type="text" class="form-control" name="co_rating" id="ac_rating">
				<button class="btn btn-primary" type="button" id="ac_ratingadd">추가</button>	
				
			</div>
		</div>
		</div>
		
		
		<hr>

		<div class="row justify-content-md-center">
			<div class="col_c" style="margin-bottom: 100px">
				<div class="input-group">
					<textarea class="textarea" id="p_content" name="co_b_text"></textarea>
					
					<script type="text/javascript">
							CKEDITOR.replace('p_content')                                                                              
					</script>
				</div>
			</div>
		</div>
		 
		 
		<div class="input-group mb-1">
                  <div class="input-group-prepend">
                     <h5 class="my-0 font-weight-normal"><font style="font-weight:bold">썸네일</font></h5>    
                  </div>
                  <div class="custom-file">
                        &nbsp;<input type="file" class="form-control-file" name="co_b_thumbnail">
                      </div>
               </div>
               
		<div class="row justify-content-md-center">
			<button type="submit" class="btn btn-outline-secondary"
				style="width: 20%; font-weight: bold">등 록</button>
		</div>
		</form>
	</div>
</div>


</body>

 
<script>

function getWriteSaleCloseDatePicker() {
    let startDatePicker = new tui.DatePicker('#wrapper', {
      date: new Date(),
      language: 'ko',
      input: {
        element: '#start',
        format: 'yyyy-MM-dd'
      }
    });

    return startDatePicker;
  }
  
getWriteSaleCloseDatePicker();

function getWriteSaleCloseDatePicker1() {
    let endDatePicker = new tui.DatePicker('#wrapper1', {
      date: new Date(),
      language: 'ko',
      input: {
        element: '#end',
        format: 'yyyy-MM-dd'
      }
    });

    return endDatePicker;
  }
  
getWriteSaleCloseDatePicker1();


function getWriteSaleCloseDatePicker2() {
    let DatePicker = new tui.DatePicker('#wrapper2', {
      date: new Date(),
      language: 'ko',
      input: {
        element: '#date',
        format: 'yyyy-MM-dd'
      }
    });

    return DatePicker;
  }
  
getWriteSaleCloseDatePicker2();
$('#ac_souveniradd').click(function(){
		
	var ac_text = '';
	
	ac_text += '<input name="co_souvenir" value="'+$('#ac_souvenirid').val() +'">';	
	
	$('.ac_sou').append(ac_text);
	
	$('#ac_souvenirid').val('');

});


$('#ac_ratingadd').click(function(){

	var ra_text = '';
	
	ra_text += '<input name ="co_rating" value="'+$('#ac_rating').val() +'">';
	
	$('.ac_rat').append(ra_text);
	
	$('#ac_rating').val('');
	
})






























</script>


<%@include file="../includes/footer.jsp"%>