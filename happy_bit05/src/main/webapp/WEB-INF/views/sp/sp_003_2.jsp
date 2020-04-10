<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Comment -->

	<div class="card my-4">
		<h4 class="card-header">
			average of stars : &nbsp;<small>☆☆☆☆☆ (3.7)</small>
		</h4>
		<div class="card-body">
			<form>
				<div class="form-group">
					<h5>Leave comment :</h5>
					<textarea class="form-control" rows="3"></textarea>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>

	<!-- Single Comment -->
	<div class="media mb-4">
		<div class="media-body">
			<h5 class="mt-0">Commenter Name</h5>
			<h6>★★★★★</h6>
			Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
			scelerisque ante sollicitudin.
		</div>

	</div>
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Previous"> <span aria-hidden="true">&laquo;</span> <span
				class="sr-only">Previous</span>
		</a></li>
		<li class="page-item"><a class="page-link" href="#">1</a></li>
		<li class="page-item"><a class="page-link" href="#">2</a></li>
		<li class="page-item"><a class="page-link" href="#">3</a></li>
		<li class="page-item"><a class="page-link" href="#"
			aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
				class="sr-only">Next</span>
		</a></li>
	</ul>


</body>
</html>
