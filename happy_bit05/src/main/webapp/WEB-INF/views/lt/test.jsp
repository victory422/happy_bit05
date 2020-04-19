<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
				<div class="col-md-4" style="text-align: right;s"><br>
					<input type="radio" name="sort" value="li_index">등록순
					<input type="radio" name="sort" value="li_see">조회순
					<input type="radio" name="sort" value="li_good">추천순
				</div>
			

<input type="text" value="">


	<script type="text/javascript">
	$(document).ready(function(){
		$('input:raido[name="sort"]').on('click',function(){
			alert('gd')
			$('#sort').val(sort_)
		})
		
	})
	</script>

</body>
</html>